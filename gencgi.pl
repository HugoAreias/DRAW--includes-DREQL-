#!/usr/bin/perl

use strict;
use warnings;
use CGI ':standard';
use Switch;
use Shell;
use Tie::IxHash;
use DBI;
# use Error qw(:try);

use Data::Dumper; # debugger

# emite warnings com um identificador a precede-los para realcar os erros do programador

BEGIN {
	$SIG{__WARN__} = sub{ print STDERR "DRAW Warning: ", @_; };
	$SIG{__DIE__}  = sub{ print STDERR "DRAW Error: ", @_; exit 1 };
}
   
my @myTypes = qw/STRING URL EMAIL FLOAT DATE PHONE PASSWORD INT TEXT CODE IMG/;
my @spcTypes = qw/SPECIAL FUNCTION METHOD/;
my %SpcTypes;
my %Types;                           
foreach (@spcTypes) { $SpcTypes{$_} = 1 }
foreach (@myTypes) { $Types{$_} = 1 }

my $Flags = {
	DRAW_CSS => undef,
	DRAW_AUTHOR => undef,
	DRAW_EMAIL => undef,
	DRAW_WEB => undef,
	DRAW_BACK => undef,
	DRAW_DB_PATH => undef,
	DRAW_DB_PASS => undef,
	DRAW_DB_USER => undef,
	DRAW_PATH => undef
};

my $Grafo = undef; # mantem a hash ordenada pela ordem de entrada              
my $Vars = undef; # armazena todas as variaveis utilizadas pelas diferentes CGIs
my $Rotinas = undef; # armazena todas as funcoes utilizadas pela totalidade das CGIs
my $Path; # armazena todas as directorias que contem ficheiros necessarios para a correcta execucao do grafo de CGIs
my %Modulos; # armazena todos os modulos usados por uma determinada cgi
my %Paginas; # armazena todos os nodos existentes no grafo
my %Funcoes; # armazena todas as funcoes invocadas por uma determinada cgi
my %Href; # armazena todos os nodos que apenas necessitam de hyperlinks

# Inicio do parser

my $path = pwd();
chomp($path);
$path .= '/path';
$path = do "$path" or die "Couldn't open path file, check if the file really exists or check out your permissions!";

# carrega os caminhos onde ira ser armazenada toda a informacao referente ao grafo
$Path = do "$path/path" or die "Couldn't open $path/path file, check if the file really exists or check out your permissions!";

# recupera de ficheiro a lista de listas com a informacao referente ao grafo
$Grafo = do "$Path->{'Data'}/graph" or die "Couldn't open $Path->{'Data'}/graph file, check if the file really exists or check out your permissions!";
$Grafo = listToHash($Grafo); # converte a forma de lista do grafo para uma hash

# recupera de ficheiro a lista de flags inicializadas
my $flg = do "$Path->{'Data'}/flags" or die "Couldn't open $Path->{'Data'}/flags file, check if the file really exists or check out your permissions!";
$flg = listToHash($flg); # converte a lista das flags numa hash

# carrega as rotinas necessarias para correcto funcionamento do grafo, caso existam
unless ( !(-f qq($Path->{'Data'}/functions)) ) {
	$Rotinas = do "$Path->{'Data'}/functions" or die "Couldn't open $Path->{'Data'}/functions file, check if the file really exists or check out your permissions!";
	$Rotinas = listToHash($Rotinas); # converte a lista de rotinas numa hash
	
	open OUT, ">$Path->{'Data'}/functions" or die "Couldn't open $Path->{'Data'}/functions file, check if the file really exists or check out your permissions!";
	print OUT Dumper $Rotinas; # imprime todas as rotinas para ficheiro na forma de hash
	close OUT;
}

# carrega todas as variaveis utilizadas nas arestas do grafo
unless ( !(-f qq($Path->{'Data'}/vars)) ) {
	$Vars = do "$Path->{'Data'}/vars" or die "Couldn't open $Path->{'Data'}/vars file, check if the file really exists or check out your permissions!";
	$Vars = listToHash($Vars); # converte a lista de variaveis numa hash
	
	open OUT, ">$Path->{'Data'}/vars" or die "Couldn't open $Path->{'Data'}/vars file, check if the file really exists or check out your permissions!";
	print OUT Dumper $Vars; # imprime todas as variaveis para ficheiro na forma de hash
	close OUT;
}

# preenche a hash Flags

foreach ( keys %{$flg} ) {
	if ( exists $Flags->{uc($_)} ) { $Flags->{uc($_)} = $flg->{$_} } # adiciona o valor da respectiva flag na hash
	else { warn "Unrecognised flag found: $_!" }
}

# cria e preenche a base de dados para os objectos, caso seja necessaria

unless ( -f qq($Path->{'Data'}/obj.db) ) {
	my $sql = "CREATE TABLE Object (object TEXT PRIMARY KEY,state BLOB);";
	open OUT, ">$Path->{'Data'}/sql" or die "Couldn't create obj.db, check out your permissions!";
	print OUT $sql;
	close OUT;
	print sqlite3("$Path->{'Data'}/obj.db < $Path->{'Data'}/sql"); # cria a base de dados para os objectos
	chmod(0664,"$Path->{'Data'}/obj.db"); # altera as permissoes para os utilizadores poderem ler da base de dados
	print rm("$Path->{'Data'}/sql");
}
my $dbh = DBI->connect("dbi:SQLite:dbname=$Path->{'Data'}/obj.db","","",{ RaiseError => 1, AutoCommit => 0, unicode => 1 }) or die $DBI::errstr;

foreach ( keys %{$Vars} ) {
	if ( exists $Vars->{$_}->{'type'} && $Vars->{$_}->{'type'} eq 'OBJECT' ) { # verifica se e um objecto
		if ( $Vars->{$_}->{'lang'} eq 'PERL' ) { # verifica se e um objecto Perl
			my $sql = "INSERT INTO Object (object,state) VALUES (?,?)";
			my $sth = $dbh->prepare($sql) or die $dbh->errstr;
			$sth->execute($_,undef) or die $dbh->errstr;
			$dbh->commit;
			# utilizar try catch para apanhar os erros
			# try {
				# my $sth = $dbh->prepare($sql) or throw $dbh->errstr;
				# $sth->execute($_,undef) or throw $dbh->errstr;
				# $dbh->commit or throw $dbh->errstr;
			# }
			# catch Error::IO with {
				# print shift;
			# }
		}
	}
	else { next }
}

$dbh->disconnect or warn $dbh->errstr;

# preenche as hashes Modulos, Paginas e Funcoes

tie %Href, 'Tie::IxHash';
foreach ( keys %{$Grafo} ) {
	my $tie = 0;
	$Paginas{$_}++;
	foreach my $key ( keys %{$Grafo->{$_}} ) {
		my $check = 0;
		$Paginas{$key}++;
		my @href = keys %{$Grafo->{$_}->{$key}};
		if (@href) {
			foreach my $atrib ( @href ) {                                                                         
				my $aux = $Grafo->{$_}->{$key}->{$atrib};
				if (exists $aux->{'type'} && $aux->{'type'} eq 'FUNCTION') {
					$Modulos{$key}{$Rotinas->{$atrib}->{'module'}}++;
					if ( ref $Rotinas->{$atrib}->{'return'} ) {
						my ($type) = keys %{$Rotinas->{$atrib}->{'return'}};
						if ($type eq 'LIST') { $Funcoes{$key}{'LISTCOMPOSED'}++ }
						else { $Funcoes{$key}{$type}++ }
					}
					elsif ( exists $Types{$Rotinas->{$atrib}->{'return'}} ) { $Funcoes{$key}{'SIMPLES'}++ }
					else { $Funcoes{$key}{$Rotinas->{$atrib}->{'return'}}++ }
				}
				elsif (exists $aux->{'type'} && $aux->{'type'} eq 'METHOD') {
					if (exists $Vars->{$atrib}) {
						$Modulos{$key}{$Vars->{$atrib}->{'module'}}++;
						$Funcoes{$key}{'VOID'}++
					}
					else { warn "Undeclared object found: $atrib!" }
				}
				else {
					$check = 1;
				}
			}
			if (0 == $check) {
				if (0 == $tie) { tie %{$Href{$_}}, 'Tie::IxHash'; $tie = 1 }
				$Href{$_}{$key}++
			}
		}
		else {
			if (0 == $tie) { tie %{$Href{$_}}, 'Tie::IxHash'; $tie = 1 }
			$Href{$_}{$key} = 0
	    }
	}
}
# Fim do parser

# print Dumper ($Grafo);
# print Dumper \%Paginas;
# print Dumper \%Modulos;
# print Dumper \%Funcoes;
# print Dumper \%Href;
# print Dumper $Vars;
# print Dumper $Rotinas;
# print Dumper $Flags;

if ( defined $Flags->{'DRAW_DB_PATH'} ) {
	# cria o modulo com o auxilio do comando h2xs
	print h2xs("-X -n $Path->{'Title'}") or die "$Path->{'Title'} cannot be created! Check your permissions and try again!";
	$path = "./$Path->{'Title'}/lib/$Path->{'Title'}.pm";
	my $sql = './sqlqueries.pl'; # ficheiro originado pelo DREQL que contem as rotinas de acesso a base de dados
	
	open IN, "<$path" or die "Couldn't open $path file, check if the file exists!";
	open MOD, "<$sql" or die "Couldn't open $sql file, check if the file exists!";
	
	$/ = undef;
	my $mod = <MOD>;
	my $input = <IN>;
	
	# substitui o valor das flags no codigo originado pelo DREQL
	$input =~ s/(\s+use warnings;\s+).*?(\s+1;\s+__END__)/$1$mod$2/sg;
	$input =~ s/\[DATABASE_PATH\]/$Flags->{'DRAW_DB_PATH'}/sg;
	if ( defined $Flags->{'DRAW_DB_PASS'} ) { $input =~ s/\[DB_PASSWORD\]/$Flags->{'DRAW_DB_PASS'}/sg }
	else { $input =~ s/\[DB_PASSWORD\]//sg }
	if ( defined $Flags->{'DRAW_DB_USER'} ) { $input =~ s/\[DB_USERNAME\]/$Flags->{'DRAW_DB_USER'}/sg }
	else { $input =~ s/\[DB_USERNAME\]//sg }
	
	close IN;
	close MOD;
	open OUT, ">$path" or die "Can't open $path file, check if the file exists!"; # abre o modulo para escrita
	print OUT $input; # imprime o novo conteudo do modulo para ficheiro
	close OUT;
	
	print cd("$Path->{'Title'}/ && perl Makefile.PL") or die "Cannot create make file!";
	print sudo("make -C $Path->{'Title'}") or die "Make failed when compiling the module!";
	print sudo("make install -C $Path->{'Title'}") or die "Installation of $Path->{'Title'}.pm failed!"; # instala o modulo que contem as rotinas de acesso a base de dados
	print sqlite3("$Flags->{'DRAW_DB_PATH'} < ./database.sql"); # cria a base de dados caso seja requisitado
	chmod (0664,$Flags->{'DRAW_DB_PATH'});
	$/ = '\n';
}


save_graph($Grafo); # guarda o conteudo de uma hash para ficheiro
unless (-f qq($Path->{'CGIS'})) { mkdir qq($Path->{'CGIS'}), 0754 } # cria uma pasta com permissoes de leitura, escrita e execucao

for my $estado (keys %Paginas) # para todos os nodos de origem
{   
    open CGIS, ">$Path->{'CGIS'}/$estado.cgi" or die "Can't create $estado.cgi\n";
    print_header($estado,%Modulos);
	my @array = keys %{$Grafo};
	print CGIS qq(my \$Grafo = do "$Path->{'Data'}/graph" or die "Couldn't find data file, check if the file really exists or check out your permissions!";\n);
	print CGIS qq(\$Grafo = listToHash(\$Grafo);\n);
	if (exists $Funcoes{$estado}) {
		print CGIS qq(my \$Funcoes = do "$Path->{'Data'}/functions" or die "Couldn't find data file, check if the file really exists or check out your permissions!";\n);
		# print CGIS qq/\$Funcoes = listToHash(\$Funcoes);\n/;
	} 
	if ( keys %{$Vars} ) {
		print CGIS qq(my \$Vars = do "$Path->{'Data'}/vars" or die "Couldn't find data file, check if the file really exists or check out your permissions!";\n);
		# print CGIS qq/\$Vars = listToHash(\$Vars);\n/;
	}
	else { print CGIS qq(my \$Vars = undef;\n) }
    print CGIS qq(my \$cgi = '$estado';\n\n);

	my @keys = keys %{ $Grafo->{$estado} };
	my $forms;
    for (@keys) { # para todos os nodos de destino de um determinado nodo de origem
        my %hash = %{ $Grafo->{$estado} };
		check_function($_,$estado,$hash{$_});
		if ( keys %{ $hash{$_} } ) { # verifica se a hash esta vazia
			if ( !(exists $Href{$estado}{$_}) ) {
				$forms->{$_} = '$form'.$_;
				print_form($_);
       			print_hidden($_,'Pai','$cgi'); # imprime um hidden field que armazena o actual nodo
       			foreach my $fields ( keys %{ $hash{$_} } ) { # para todos os atributos de um determinado nodo de destino
					create_cgi_form($fields, $_, $hash{$_});
       			}
			}
		}
    }
    if ( exists $Funcoes{$estado} ) { print_param($Funcoes{$estado}) }

	my $str = undef;
	for (@keys) {  # gera todos os forms dos nodos que contem atributos
		if ( !(exists $Href{$estado}{$_}) ) { $str .= qq/\tprint \$form$_->render(header => 0);\n/ }
	}
	if (defined $str) { # caso haja forms para criar
		print CGIS qq/if (!\$\@ || ( param("Pai") && param("Pai") eq \$cgi) ) {\n/;
		print CGIS qq/\tprint qq(<div class="forms">);\n/;
		print CGIS qq/$str/;
		print CGIS qq!\tprint qq(</div>);\n!;
		print CGIS "}\n\n";
	}
	if (exists $Href{$estado}) {
		my @nodes = keys %{$Href{$estado}};
		if (@nodes) { print CGIS "\nprint start_form(-class => 'link');\nprint br,'<ul>';\n" }
		foreach my $key (@nodes) { # gera links para os nodos que nao contem atributos
			if ($estado eq $key) { # caso seja um link para a mesma pagina (utilizado em caso de erro)
				print CGIS "if (\$\@) {\n";
				print CGIS qq/print '<li>',a( {-href => "$key.cgi?_submitted_$estado.cgi=1&Pai=$estado/;
				foreach (keys %{$Grafo->{$estado}->{$key}}) { print CGIS "&$_=$_" }
				print CGIS qq/"}, '$key' ), br;\n/;
				print CGIS "}\n";
			}
			else {
				if ( defined $Flags->{'DRAW_BACK'} && 1 == $Flags->{'DRAW_BACK'} ) {
					print CGIS qq!if (param("Pai") && param("Pai") eq '$key') {\n!;
					print CGIS qq/\tprint '<li>',a( {-href => "$key.cgi?_submitted_$estado.cgi=1&Pai=$estado/;
					foreach (keys %{$Grafo->{$estado}->{$key}}) { print CGIS "&$_=$_" }
					print CGIS qq/"}, 'back' ), br;\n/;
					print CGIS qq!}\nelse {\n\t!;
				}
			   	print CGIS qq/print '<li>',a( {-href => "$key.cgi?_submitted_$estado.cgi=1&Pai=$estado/;
			   	foreach (keys %{$Grafo->{$estado}->{$key}}) { print CGIS "&$_=$_" }
				print CGIS qq/"}, '$key' ), br;\n/;
				print CGIS qq(}\n) if ( defined $Flags->{'DRAW_BACK'} && 1 == $Flags->{'DRAW_BACK'} );
			}
		}
		if (@nodes) { print CGIS "print '</ul>';\nprint end_form;\n\n" }
	}
	if ( defined $Flags->{'DRAW_AUTHOR'} || defined $Flags->{'DRAW_EMAIL'} || defined $Flags->{'DRAW_WEB'}) {
		print CGIS qq(print "<span class='info'>";\n);
		print_info();
		print CGIS qq(print "</span>";\n);
	}
	print_end();
	if (exists $Funcoes{$estado}) {
		if (1 == print_result($Funcoes{$estado})) { # imprime os rotinas necessarias para a cgi funcionar devidamente
			print_vars($forms); # imprime a rotina necessaria para processar o tipo VARS
		}
		concat_tuplos();
		call_function();
	}
	printListToHash();
	# muda as permissoes de acesso as cgis
	chmod(0754,"$Path->{'CGIS'}/$estado.cgi") or die "Can't change $estado.cgi permissions";
    close CGIS;
}

# remove os espacos de uma string

sub trim {
    my ($str) = @_;
    $str =~ s/\s*$//;
    $str =~ s/^\s*//;
    return $str;
}

# armazena o conteudo de uma hash para ficheiro

sub save_hash {
    my ($hash) = @_;
    unless (-f qq($Path->{'Data'})) { mkdir qq($Path->{'Data'}), 0754 }
	my ($key) = keys %{$hash};
    open OUT,">$Path->{'Data'}/$key.dw" or die "Couldn't create the $key.dw file, check out your permissions!";
    print OUT Dumper $hash;
    close OUT;
    return;
}

# armazena o conteudo do grafo para ficheiro

sub save_graph {
    my ($hash) = @_;
    unless (-f qq($Path->{'Data'})) { mkdir qq($Path->{'Data'}), 0754 }
	my @arraytitle = split /\//, $Path->{'Path'};
	my $title = pop @arraytitle;
    open OUT,">$Path->{'Data'}/$title.dw" or die "Couldn't create the $title.dw file, check out your permissions!";
    print OUT Dumper $hash;
    close OUT;
    return;
}                 

# verifica se os parametros da funcao estao de acordo com o prototipo

sub check_function {
	my ($src,$dest,$hash) = @_;
	foreach (keys %{$hash}) {
		if (exists $Rotinas->{$_} && $hash->{$_}->{'type'} eq 'FUNCTION') {
			my $func = $Rotinas->{$_}->{'args'};
			if (!ref $func && $func eq 'VOID') { next }
			else {
				my $param = $hash->{$_}->{'args'};
				my $tam = scalar(@{$func});
				for (my $key = 0; $key < $tam; $key++) {
					if (exists $Vars->{$param->[$key]}->{'type'}) {
						if ($Vars->{$param->[$key]}->{'type'} eq $func->[$key] || $Vars->{$param->[$key]}->{'type'} eq 'SELECT' || $Vars->{$param->[$key]}->{'type'} eq 'CHECKBOX' || $Vars->{$param->[$key]}->{'type'} eq 'RADIO') {
							next
						}
						else { print "Type mismatch! Variable: $param->[$key], Function: $_, From $src to $dest!\n" }
					}
					else { print "Variable $param->[$key] not found!\n" }
				}
			}
		}
	}
	return;
}

# converte uma lista de listas para uma hash

sub listToHash {
	my ($list) = shift;
	my $hash;
	tie %{$hash}, 'Tie::IxHash';
	my $length = scalar @{$list}; # calcula o numero de elementos da lista
	if (0 == $length) { return {} } # verifica se a lista se encontra vazia
	for (my $i = 0; $i < $length; $i++) { # para todos os elementos da lista
		my @array = undef;
		# verifica se e uma referencia, se for hash retira as chaves, se for lista chama novamente a funcao
		if (ref $list->[$i]) { @array = keys %{$list->[$i]} or listToHash($list->[$i]) }
		else { return $list } # caso nao seja referencia devolve o conteudo da lista
		if (@array) { # caso nao seja uma lista vazia
			my $len = scalar @array; # calcula o numero de elementos da lista
			for (my $j = 0; $j < $len; $j++) { # para todos os elementos da lista
				my $aux = $list->[$i]->{$array[$j]};
				if (ref $aux) { # verifica se e uma referencia
					if (exists $hash->{$array[$j]}) { # verifica se e uma chave repetida
						my ($key) = keys %{$aux->[0]};
						# chama novamente a funcao, garantindo que nao substitui a chave anterior
						$hash->{$array[$j]}->{$key} = listToHash($aux->[0]->{$key});
					}
					else { $hash->{$array[$j]} = listToHash($aux) } # chama novamente a funcao para as listas internas da hash
				}
				else { $hash->{$array[$j]} = $aux } # garantia que chegamos a uma folha da hash
			}
		}
	}
	return $hash;
}
    
# imprime a hash de forms a qual uma cgi tem acesso para as cgis poderem alterar as forms no caso do tipo VARS

# esta funcao faz o mesmo que eval('$form'.$cgi)
                    
# sub forms_hash {
# 	my ($forms) = @_;
# 	my $flag = 0;
# 	print CGIS qq(	my \$forms = {\n);
# 	foreach my $key (keys %{$forms}) {
# 		if (0 == $flag) { print CGIS qq(		$key => $forms->{$key}); $flag = 1 }
# 		else { print CGIS qq(,\n		$key => $forms->{$key}) }
# 	}
# 	print CGIS qq(\n	};\n\n);
# }

# imprime a funcao listToHash

sub printListToHash {
	print CGIS qq(sub listToHash {
	my (\$list) = shift;
	my \$hash;
	tie %{\$hash}, 'Tie::IxHash';
	my \$length = scalar \@{\$list};
	if (0 == \$length) { return {} }
	for (my \$i = 0; \$i < \$length; \$i++) {
		my \@array = undef;
		if (ref \$list->[\$i]) { \@array = keys %{\$list->[\$i]} or listToHash(\$list->[\$i]) }
		else { return \$list }
		if (\@array) {
			my \$len = scalar \@array;
			for (my \$j = 0; \$j < \$len; \$j++) {
				my \$aux = \$list->[\$i]->{\$array[\$j]};
				if (ref \$aux) {
					if (exists \$hash->{\$array[\$j]}) {
						my (\$key) = keys %{\$aux->[0]};
						\$hash->{\$array[\$j]}->{\$key} = listToHash(\$aux->[0]->{\$key})
					}
					else { \$hash->{\$array[\$j]} = listToHash(\$aux) }
				}
				else { \$hash->{\$array[\$j]} = \$aux }
			}
		}
	}
	return \$hash;
});
}

# imprime os cabecalhos das cgis

sub print_header {
    my ($estado,%hash) = @_;
    print CGIS qq(#!/usr/bin/perl
	
use strict;
use warnings;
use CGI ':standard';
use Data::Dumper;
use CGI::FormBuilder;
use Tie::IxHash;
use Storable qw(freeze thaw);
use DBI;);
	for (keys %{ $hash{$estado} }) {
		print CGIS "\nuse $_;" unless ($_ eq 'strict' || $_ eq 'warnings' || $_ eq 'CGI' || $_ eq 'Data::Dumper' || $_ eq 'CGI::FormBuilder' || $_ eq 'Tie::IxHash' || $_ eq 'DBI' || $_ eq 'Storable');
	}
    print CGIS qq!\n\nprint header;
print start_html( -title => "$estado"!;
	print CGIS qq!, -style => {-src=> '$Flags->{'DRAW_CSS'}', -type => 'text/css', -media => 'screen'} ! if ( defined $Flags->{'DRAW_CSS'} );
	print CGIS qq!);
print h1("$estado");\n\n!;
    return;
}

# imprime a informacao de uma determinada form

sub print_form {
    print CGIS qq(my \$form@_ = CGI::FormBuilder->new(
	name => '@_.cgi',
	submit => '@_',
	method => 'post',
	reset => 1,
	messages => { form_required_text => "" },
	action => '@_.cgi'
);\n\n);
    return;
}

# imprime hidden fields

sub print_hidden {
	my ($node,$field,$value) = @_;
    if ($field eq 'Pai') { print CGIS "\$form$node->field(name => '$field',\n" }
	else { print CGIS "\$form$node->field(name => $value,\n" }
    print CGIS qq(\ttype => 'hidden',
	force => 1,
	value => $value);
    print CGIS ");\n\n" unless $field ne 'Pai';
    return;
}

# imprime a informacao referente ao autor

sub print_info {
	print CGIS qq/print "©$Flags->{'DRAW_AUTHOR'}", ' ';\n/ if ( defined $Flags->{'DRAW_AUTHOR'} );
	if ( defined $Flags->{'DRAW_EMAIL'} ) {
		my $email = $Flags->{'DRAW_EMAIL'};
		$email =~ s/\@/\\\@/;
		print CGIS qq/print a( {-href=>"mailto:$email",-target=>"_newtab"}, '$Flags->{'DRAW_EMAIL'}'), ' ';\n/;
	}
	print CGIS qq!print a( {-href=>"http://$Flags->{'DRAW_WEB'}",-target=>"_newtab"}, '$Flags->{'DRAW_WEB'}'), ' ';\n! if ( defined $Flags->{'DRAW_WEB'} );
	return;
}

# imprime a informacao necessaria para finalizar a cgi

sub print_end {
    print CGIS "print end_html;\n\n";
    return;
}

# imprime tudo o que e comum aos varios campos de um form

sub print_common {
    my ($field,$node,$transit,$required) = @_;
    print CGIS "\$form$node->field(name => '$field',\n";
	print CGIS qq(	required => 1,\n) if ($required eq '1');
    if ($transit eq '0') {
		print CGIS qq(	force => 1,\n);
    	print CGIS qq(	value => "",\n);
	}
	print CGIS qq(	label => '$field:');
    return;
}

# imprime uma select box

sub print_select {
	my ($node,$field,$hash) = @_;
	print CGIS qq!\$form$node->field(name => '$field',
	label => '$field:',
	force => 1,
	value => "",
	type => '$Vars->{$field}->{'type'}',
	required => 1,
	multiple => 0,!;
	print CGIS "\toptions => [",( join (',', ( map ("\'$_\'",@{$hash->{'args'}}) ) ) ),"]";
    return;
}

# imprime toda a informacao que difere entre as varias cgis

sub create_cgi_form {
    my ($field,$node,$hash) = @_;
    print_common($field,$node,$hash->{$field}->{'transit'},$hash->{$field}->{'required'}) unless ( exists $SpcTypes{$hash->{$field}->{'type'}} );
    switch($Vars->{$field}->{'type'}) {
            case /\bstring\b/i   { print CGIS qq(,\n	validate => 'VALUE') }
            case /\bint\b/i      { print CGIS qq(,\n	validate => 'INT') }
            case /\burl\b/i      { print CGIS qq(,\n	validate => 'VALUE') }
            case /\bemail\b/i    { print CGIS qq(,\n	validate => 'EMAIL') }
            case /\bfloat\b/i    { print CGIS qq(,\n	validate => 'FLOAT') }
            case /\bdate\b/i     { print CGIS qq(,\n	validate => 'DATE') }
    		case /\bphone\b/i    { print CGIS qq(,\n	validate => 'INTPHONE') }
			case /\bimg\b/i		 { print CGIS qq(,\n	validate => 'VALUE') }
            case /\bpassword\b/i {
                print CGIS qq(,\n	type => 'password');
                print CGIS qq(,\n	validate => '/^[\\w.!?@#\$%&*]{6,30}\$/');
                print CGIS qq(,\n	maxlength => 30);
            }
            case /\btext\b/i     { print CGIS qq(,\n	type => 'textarea',\n	rows => '10',\n	cols => '40') }
			case /\bcode\b/i     { print CGIS qq(,\n	type => 'textarea',\n	rows => '10',\n	cols => '40') }
            else {
    			if ( exists $hash->{$field}->{'type'} && $hash->{$field}->{'type'} eq 'FUNCTION' ) {
    				my $value = "'".$field."'";
    				print_hidden($node,'Func',$value);
    			}
    			elsif ( exists $hash->{$field}->{'type'} && ( $hash->{$field}->{'type'} eq 'SPECIAL') ) {
    				print_select($node,$field,$hash->{$field})
    			}
				elsif ( exists $hash->{$field}->{'type'} && ( $hash->{$field}->{'type'} eq 'METHOD') ) {}
    			else { warn "Error: Type $Vars->{$field}->{'type'} unrecognised" }
    		}
    }
    print CGIS ");\n\n" unless ( exists $hash->{$field}->{'type'} && ( $hash->{$field}->{'type'} eq 'METHOD') );
	return;
}

# imprime as instrucoes que permitem a cgi efectuar operacoes

sub print_param {
	my ($hash) = @_;
	my $count = 0;
	print_init_values();
    print CGIS qq!if (param("Pai")) {
	my \$dbh = DBI->connect("dbi:SQLite:dbname=$Path->{'Data'}/obj.db","","",{ RaiseError => 1, AutoCommit => 0, unicode => 1 }) or die \$DBI::errstr;\n!;
	print CGIS q/	my $pai = param("Pai");
	my $hash = $Grafo->{$pai}->{$cgi};
	for (keys %{$hash} ) {
		if (param($_) && $hash->{$_}->{'type'} eq 'FUNCTION') {
			my $funcname = param($_);
			my $function = $hash->{$funcname};
			my @arglst;
			my $value = $Funcoes->{$funcname}->{'return'};
			if (ref $Funcoes->{$funcname}->{'args'}) {;
				foreach (@{ $function->{'args'} }) {
					if ( param($_) ) {
						push @arglst, param($_);
						if ( exists $Vars->{$_}->{'value'} ) { $Vars->{$_}->{'value'} = param($_) }
					}
					elsif ( !exists $hash->{$_}->{'required'} || (exists $hash->{$_}->{'required'} && 1 == $hash->{$_}->{'required'}) ) {
						if ( exists $Vars->{$_} && defined $Vars->{$_}->{'value'} ) { push @arglst, $Vars->{$_}->{'value'} }
					}
					else { push @arglst, 'undef' }
				}
			}
			my $return = call_function($funcname,@arglst);
			if (ref $value) {
				my ($key) = keys %{$value};/;
    print CGIS qq(\n);
	for (keys %{$hash}) {
		switch($_) {
			case /\bLISTCOMPOSED\b/ {
				if (1 == $count) { print CGIS qq!\t\t\t\telsif (\$key eq 'LIST') {\n! }
				else { print CGIS qq!\t\t\t\tif (\$key eq 'LIST') {\n!; $count = 1 }
				print CGIS qq!\t\t\t\t\tmy \@list;
					foreach my \$keys (\@{\$return}) { push \@list, concat_tuplos(\$function->{'return'},\$keys) }
					print qq(<div class="colist">);
					print_list_composed(\\\@list);
					print qq(</div>);
				}\n!;
			}
			case /\bCOMPOSED\b/ {
				if (1 == $count) { print CGIS qq!\t\t\t\telsif (\$key eq 'COMPOSED') {\n! }
				else { print CGIS qq!\t\t\t\tif (\$key eq 'COMPOSED') {\n!; $count = 1 }
				print CGIS qq!\t\t\t\t\t\$return = concat_tuplos(\$function->{'return'},\$return);
					print qq(<div class="comp">);
					print_composed(\$return);
					print qq(</div>);
				}\n!;
			}
			case /\bHASH\b|\bLIST\b|\bSIMPLES\b|\bVARS\b|\bVOID\b/ { next }
			else { warn "Error: Return type $_ unrecognised" }
		}
	}
	if (1 == $count) { print CGIS qq(\t\t\t\telse { warn "Error: Return type \$key unrecognised" }\n) }
	print CGIS qq(\t\t\t}
			else {\n);
	$count = 0;
	for (keys %{$hash}) {
		switch($_) {
			case /\bHASH\b/ {
				if (1 == $count) { print CGIS qq!				elsif (\$value eq 'HASH') { my \$var = 0; print qq(<div class="hash">); print_hash(\\\$var,\$return); print qq(</div>) }\n! }
				else { print CGIS qq!				if (\$value eq 'HASH') { my \$var = 0; print qq(<div class="hash">); print_hash(\\\$var,\$return); print qq(</div>) }\n!; $count = 1 }
			}
			case /\bSIMPLES\b/ {
				if (1 == $count) { print CGIS qq!				elsif (\$value =~ /STRING|URL|EMAIL|FLOAT|DATE|PHONE|PASSWORD|INT|TEXT|CODE|IMG/) { print qq(<div class="misc">); print_misc(\$return); print qq(</div>) }\n! }
				else { print CGIS qq!				if (\$value =~ /STRING|URL|EMAIL|FLOAT|DATE|PHONE|PASSWORD|INT|TEXT|CODE|IMG/) { print qq(<div class="misc">); print_misc(\$value,\$return); print qq(</div>) }\n!; $count = 1 }
			}
			case /\bVOID\b/ {
				if (1 == $count) { print CGIS qq!				elsif (\$value eq 'VOID') { next }\n! }
				else { print CGIS qq!				if (\$value eq 'VOID') { next }\n!; $count = 1 }
			}
			case /\bLIST\b/ {
				if (1 == $count) { print CGIS qq!				elsif (\$value eq 'LIST') { print qq(<div class="list">); print_list(\$return), print qq(</div>) }\n! }
				else { print CGIS qq!				if (\$value eq 'LIST') { print qq(<div class="list">); print_list(\$return); print qq(</div>) }\n!; $count = 1 }
			}
			case /\bVARS\b/ {
				if (1 == $count) { print CGIS qq!				elsif (\$value eq 'VARS') { print_vars(\$return) }\n! }
				else { print CGIS qq!				if (\$value eq 'VARS') { print_vars(\$return) }\n!; $count = 1 }
			}
			case /\bLISTCOMPOSED\b|\bCOMPOSED\b/ { next }
			else { warn "Error: Return type $_ unrecognised" }
		}
	}
	if (1 == $count) { print CGIS qq(				else { warn "Error: Return type \$value unrecognised" }\n) }
	print CGIS qq#\t\t\t}
		}
		elsif (\$hash->{\$_}->{'type'} eq 'METHOD') {
			if (exists \$Vars->{\$_} && \$Vars->{\$_}->{'lang'} eq 'PERL') {
				my \$sql = "SELECT object,state FROM Object WHERE object=?";
				my \$sth = \$dbh->prepare(\$sql) or die \$dbh->errstr;
				\$sth->execute(\$_) or die \$dbh->errstr;
				my \$rv = \$sth->fetchall_hashref('object');
				if ( exists \$rv->{\$_} ) {
					my \$obj = \$rv->{\$_}->{'state'};
					\$obj = thaw \$obj;
					my \$objstr;
					if ( \$hash->{\$_}->{'method'} =~ /.+->.+/ ) { \$objstr .= '\$obj = '.\$hash->{\$_}->{'method'}; }
					else { \$objstr .= '\$obj->'.\$hash->{\$_}->{'method'}; }
					my \@arglst = ();
					if ( ref \$hash->{\$_}->{'args'} eq 'ARRAY' ) {
						foreach my \$arg ( \@{\$hash->{\$_}->{'args'}} ) {
							if ( param(\$arg) ) { push \@arglst, '\\''.param(\$arg).'\\'' }
							elsif ( !exists \$hash->{\$arg}->{'required'} || (exists \$hash->{\$arg}->{'required'} && 1 == \$hash->{\$arg}->{'required'}) ) {
								if ( exists \$Vars->{\$arg} && defined \$Vars->{\$arg}->{'value'} ) { push \@arglst, '\\''.\$Vars->{\$arg}->{'value'}.'\\'' }
							}
							else { push \@arglst, 'undef' }
						}
					}
					if (\@arglst) {
						\$objstr .= '(';
						\$objstr .= join ',',\@arglst;
						\$objstr .= ')';
					}
					print eval \$objstr;
					if ( defined \$obj ) {
						\$sql = "UPDATE Object SET state=? WHERE object=?";
						\$sth = \$dbh->prepare(\$sql) or die \$dbh->errstr;
						\$sth->execute((freeze \$obj),\$_) or die \$dbh->errstr;
						\$dbh->commit;
					}					
				}
			}
		}
	}
	open OUT, "> $Path->{'Data'}/vars" or die "Couldn't open $Path->{'Data'}/vars file, check if the file really exists or check out your permissions!";
	print OUT Dumper \$Vars;
	close OUT;
	\$dbh->disconnect or warn \$dbh->errstr;
}\n\n#;
}

# preenche os forms com os valores inicializados

sub print_init_values {
	print CGIS qq!foreach (keys %{\$Grafo->{\$cgi}}) {
	foreach my \$key (keys %{\$Grafo->{\$cgi}->{\$_}}) {
		if (exists \$Vars->{\$key} && exists \$Vars->{\$key}->{'init'} && 1 == \$Vars->{\$key}->{'init'} && defined \$Vars->{\$key}->{'value'}) {
			eval('\$form'.\$_)->field(name => \$key, force => 1, value => \$Vars->{\$key}->{'value'});
		}
	}
}\n\n!;
}

# imprime uma funcao para criar uma lista de auxilio ao pretty printing de tuplos

sub concat_tuplos {
	print CGIS qq!sub concat_tuplos {
	my (\$args,\$list) = \@_;
	my \@return;
	my \$cond = 0;
	foreach (\@{\$args}) {
		if ( defined(\$list->[\$cond]) ) { push \@return,\$_."=:=".\$list->[\$cond++] }
		else { last }
	}
	return \\\@return;
}\n\n!;
}

# imprime a rotina que invoca as funcoes utilizadas nas arestas do grafo

sub call_function {
	print CGIS qq%sub call_function {
	my (\$funcname,\@args) = \@_;
	{
		no strict;
		\$return = &{\$funcname}(\@args);
		if (defined \$return) {
			return wantarray ? \@{\$return} : \$return;
		}
		else {
			\$pai = param("Pai");
			print qq!<script "text/javascript">
			var loc = window.location.pathname;
			var newloc = loc.replace(/\$cgi.cgi/g,"\$pai.cgi");
			alert("\$\@");
			window.location.href=newloc,"\$pai";
			</script>!;
			die \$\@;
		}
	}
}\n\n%;
}

# imprime as funcoes de impressao de tipos de acordo com os tipos necessarios a determinada cgi

sub print_result {
	my ($result) = @_;
	my $list = 0;
	my $hash = 0;
	for (keys %{$result}) {
		switch ($_) {
			case /LISTCOMPOSED/ { $list = 1; print_list_composed() }
			case /COMPOSED/ { print_composed() }
			case /HASH/ { $hash = 1; print_hash() }
			case /LIST/ { $list = 1; print_list() }
			case /SIMPLES/ { print_misc() }
			case /VARS/ { return 1 }
			case /VOID/ {}
			else { warn "Error: Type $_ unrecognised" }
		}
	}
	if (1 == $list && 0 == $hash) { print_hash() }
	return 0;
}
                       
# pretty printing do tipo VARS

sub print_vars {
	my ($forms) = @_;
	print CGIS qq/sub print_vars {
	my (\$vars) = \@_;
	foreach (keys %{\$Grafo->{\$cgi}}) {
		foreach my \$key (keys %{\$Grafo->{\$cgi}->{\$_}}) {
			if (exists \$vars->{\$key}) {
				eval('\$form'.\$_)->field(name => \$key, force => 1, value => \$vars->{\$key});
			}
		}
	}
	return;
}\n\n/;
	return;
}

# pretty printing de listas

sub print_list {
	print CGIS qq/sub print_list {
	my \$enum = 1;
	my (\$list) = \@_;
	foreach (\@{\$list}) {
		if (ref \$_) { my \$var = 0; print_hash(\\\$var,\$_) }
		else { print b(\$enum++)," => ",\$_,br }
	}
	print br,br;
	return;
}\n\n/;
}

# Dumper de uma hash

sub print_hash {
	print CGIS qq#sub print_hash {
	my (\$level,\$hash) = \@_;
	for (keys %{\$hash}) {
		if (ref \$hash->{\$_}) {
			if (0 != \$\$level) { print "&nbsp" x (4*\$\$level),b(\$_)," => \\{",br }
			else { print br,b(\$_)," => \\{",br }
			\$\$level++;
			print_hash(\$level,\$hash->{\$_});
			print "&nbsp" x (4*\$\$level),"\\}",br;
		}
		else {
			print "&nbsp" x (4*\$\$level),b(\$_),": ";
			if ( exists \$Vars->{\$_}->{'type'} && \$Vars->{\$_}->{'type'} eq 'URL' ) { print a( {-href=>"\$hash->{\$_}",-target=>"_newtab"}, \$hash->{\$_}), br }
			elsif ( exists \$Vars->{\$_}->{'type'} && \$Vars->{\$_}->{'type'} eq 'EMAIL' ) { print a( {-href=>"mailto:\$hash->{\$_}",-target=>"_newtab"}, \$hash->{\$_}), br }
			elsif ( exists \$Vars->{\$_}->{'type'} && \$Vars->{\$_}->{'type'} eq 'IMG' ) {
				print <<HTML
				<a href="\$hash->{\$_}" target="_newtab"><img src="\$hash->{\$_}" alt="\$hash->{\$_}" height="15%" width="15%"/></a><br>
HTML
			}
			else { print \$hash->{\$_}, br }
		}
	}
	\$\$level--;
	return;
}\n\n#;
}

# pretty printing de tuplos

sub print_composed {
	print CGIS qq#sub print_composed {
	my (\$list) = \@_;
	foreach (\@{\$list}) {
		if (ref \$_) { my \$var = 0; print_hash(\\\$var,\$_) }
		else {
			my (\$field,\$value) = split /=:=/;
			print b(\$field),": ";
			if ( exists \$Vars->{\$field}->{'type'} && \$Vars->{\$field}->{'type'} eq 'URL' ) { print a( {-href=>"\$value",-target=>"_newtab"}, \$value), br }
			elsif ( exists \$Vars->{\$field}->{'type'} && \$Vars->{\$field}->{'type'} eq 'EMAIL' ) { print a( {-href=>"mailto:\$value",-target=>"_newtab"}, \$value), br }
			elsif ( exists \$Vars->{\$field}->{'type'} && \$Vars->{\$field}->{'type'} eq 'IMG' ) {
				print <<HTML
				<a href="\$value" target="_newtab"><img src="\$value" alt="\$value" height="15%" width="15%"/></a><br>
HTML
			}
			else { print \$value,br }
		}
	}
	print br,br;
	return;
}\n\n#;
}

# pretty printing de listas de tuplos

sub print_list_composed {
	print CGIS qq#sub print_list_composed {
	my \$enum = 1;
	my (\$listof) = \@_;
	for my \$list (\@{\$listof}) {
		print b(\$enum++),":",br;
		foreach ( \@{\$list} ) {
			if (ref \$_) { my \$var = 0; print_hash(\\\$var,\$_) }
			else {
				my (\$field,\$value) = split /=:=/;
				print "&nbsp"x2,b(\$field),": ";
				if ( exists \$Vars->{\$field}->{'type'} && \$Vars->{\$field}->{'type'} eq 'URL' ) { print a( {-href=>"\$value",-target=>"_newtab"}, \$value), br }
				elsif ( exists \$Vars->{\$field}->{'type'} && \$Vars->{\$field}->{'type'} eq 'EMAIL' ) { print a( {-href=>"mailto:\$value",-target=>"_newtab"}, \$value), br }
				elsif ( exists \$Vars->{\$field}->{'type'} && \$Vars->{\$field}->{'type'} eq 'IMG' ) {
					print <<HTML
					<a href="\$value" target="_newtab"><img src="\$value" alt="\$value" height="15%" width="15%"/></a><br>
HTML
				}
				else { print \$value,br }
			}
		}
		print br;
	}
	print br,br;
	return;
}\n\n#;
}

# pretty printing dos restantes tipos de dados

sub print_misc {
	print CGIS qq(sub print_misc {
	my (\$value,\$return) = \@_;
	if ( \$value eq 'URL' ) { print a( {-href=>"\$return",-target=>"_newtab"}, \$return), br,br }
	elsif ( \$value eq 'EMAIL' ) { print a( {-href=>"mailto:\$return",-target=>"_newtab"}, \$return), br,br }
	elsif ( \$value eq 'IMG' ) {
		print <<HTML
		<a href="\$return" target="_newtab"><img src="\$return" alt="\$return" height="15%" width="15%"/></a><br>
HTML
	}
	else { print \$return, br,br }
}

);
}

__END__