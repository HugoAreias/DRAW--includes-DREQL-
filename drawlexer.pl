#!/usr/bin/perl

use strict;
use warnings;
use Text::RewriteRules;
use drawparser;
use Data::Dumper;

$/ = undef; #vai fazer com que leia tudo como se fosse uma so string
my $drawfx = <>;
yylex_init($drawfx);

my $parser = new drawparser();
my $list = $parser->YYParse(yylex => \&yylex, yyerror => \&yyerror);

my $path;
my $error = 1;
my $i = 0;
foreach ( @{$list->[1]{'Flags'}} ) {
	my ($key) = (keys %{$_});
    if ( uc($key) eq 'DRAW_PATH' ) {
		$path = $list->[1]{'Flags'}->[$i]{$key};
		$error = 0;
		last
	}
	$i++;
}

if ( 1 == $error ) { die "Required flag 'DRAW_PATH' not defined by user!" }

my $pathHash = {
	Title => $list->[0]{'Title'}[0]{'title'},
	Path => $path,
	Data => $path.'/Data',
	CGIS => $path.'/CGIS'
};

#cria uma pasta com permissoes de leitura, escrita e execucao com o objectivo de conter todo o projecto
unless (-f '$path') { mkdir $path, 0755 }
#cria uma pasta com permissoes de leitura, escrita e execucao com o objectivo de conter todos os ficheiros de dados
unless (-f qq($pathHash->{'Data'})) { mkdir $pathHash->{'Data'}, 0755 }
         
open OUT, ">$pathHash->{'Data'}/path" or die "Couldn't create $pathHash->{'Data'}/path file!";
print OUT Dumper $pathHash;
close OUT;

open OUT, ">$pathHash->{'Data'}/flags" or die "Couldn't create $pathHash->{'Data'}/flags file!";
print OUT Dumper $list->[1]{'Flags'};
close OUT;
chmod(0664,"$pathHash->{'Data'}/flags");

if (scalar(@{$list->[2]{'Vars'}}) > 0) {
	open OUT, ">$pathHash->{'Data'}/vars" or die "Couldn't create $pathHash->{'Data'}/vars file!";
	print OUT Dumper $list->[2]{'Vars'};
	close OUT;
	chmod(0664,"$pathHash->{'Data'}/vars");
}

if (scalar(@{$list->[3]{'Functions'}}) > 0) {
	open OUT, ">$pathHash->{'Data'}/functions" or die "Couldn't create $pathHash->{'Data'}/functions file!";
	print OUT Dumper $list->[3]{'Functions'};
	close OUT;
	chmod(0664,"$pathHash->{'Data'}/functions");
}

open OUT, ">$pathHash->{'Data'}/graph" or die "Couldn't create $pathHash->{'Data'}/graph file!";
print OUT Dumper $list->[4]{'Graph'};
close OUT;
chmod(0664,"$pathHash->{'Data'}/graph");

open OUT, ">path" or die "Couldn't create path file!";
print OUT Dumper $pathHash->{'Data'};
close OUT;

sub yyerror {
	my $parser = shift;
	my $expected = $parser->YYExpect;
	my $got = $parser->YYCurtok;
	die "Parse Error: Expected $expected, got $got\n";
}

RULES/lx yylex

	->=e=>('->','->')

	=>=e=>('=>','=>')

    [=]=e=>('=','=')

	([,;:\(\)\{\}\[\]\\\/\@])=e=>($1,$1)

	([\w\d\-\.]+)=e=>('DVAR',$1)

	=EOF=e=>(undef,"")

	(\s+)=ignore=>

	(.+)=e=>die "unexpected symbol: $1\n"

ENDRULES