#!/usr/bin/perl

use strict;
use warnings;

use Shell;

$Shell::capture_stderr = 1;

print "Please enter an input filename: ";
my $file = <STDIN>;

print "Running yapp...\n";
print yapp("drawparser.yp") or die "Couldn't run yapp, please check your permissions and drawparser.yp existence\n";
print "Compiling and generating cgis...\n";
if ($file) {
	my $path = pwd();
	chomp($path);
	chomp($file);     
	$file = $path.'/'.$file;
	if (-f $file) {
		print perl("drawlexer.pl", $file) or die "Couldn't execute the parser, please check your permissions and drawlexer.pl existence\n";
	}
	else { die "Couldn't found the $file file" }
	print perl("gencgi.pl") or die "Couldn't generate the cgis, please check your permissions and parser file existence\n";
}
else { die "No input file found!" }
print "All tasks done!\n";