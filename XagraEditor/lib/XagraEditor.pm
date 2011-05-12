package XagraEditor;

use 5.010000;
use strict;
use warnings;

use Switch;
use base 'Exporter';
use XAGra;
use Data::Dumper;
# require Exporter;
# use AutoLoader qw(AUTOLOAD);

# our @ISA = qw(Exporter);

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.

# This allows declaration	use XagraEditor ':all';
# If you do not need this, moving things directly into @EXPORT or @EXPORT_OK
# will save memory.
# our %EXPORT_TAGS = ( 'all' => [ qw(
# 	
# ) ] );

# our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw(startGrammar checkGrammar addSymbol addAttribute showSymbols showAttributes showFunctions showImportations showProductions
	showComputations showArguments addProduction addFunction addImport modifyFunction modifySymbol modifyAttribute modifyProduction
	editFunction editSymbol editProduction editAttribute dualFunction dualSymbol dualAttribute dualProduction removeImport dualComputation
	addComputation modifyComputation modifyArgument editComputation editArgument addArgument dualArgument addProdComp addCompArg
	compOfProd argOfComp viewComputations viewArguments
	
);

our $VERSION = '0.01';

# Preloaded methods go here.

# Autoload methods go after =cut, and are processed by the autosplit program.

=head2 startGrammar

create a new grammar

=cut

sub startGrammar {
	my $grammar = shift;
	if ( !defined insert_Grammar($grammar,'undef') ) { return undef }
	return "$grammar grammar has been successfully created!";
}

=head2 checkGrammar

check if grammar exists

=cut

sub checkGrammar {
	my $grammar = shift;
	my $sql = "Grammar_Name='$grammar'";
	my $g = select_Grammar($sql,'Grammar_Name');
	if ( !defined $g ) { return undef }
	if ( !exists $g->{$grammar} ) { $@ = "Grammar $grammar not found!"; return undef }
	return "$grammar grammar has been successfully loaded!";
}


#----------
#  Add
#----------


=head2 addSymbol

insert terminal or non-terminal symbol

=cut

sub addSymbol {
	my ($grammar,$symbol,$value,$type) = @_;
	if ( $type eq 'Axiom' ) {
		my $set = "Axiom='$symbol'";
		my $sql = "Grammar_Name='$grammar'";
		if ( !defined update_Grammar($set,$sql) ) { return undef }
	}
	if ( !defined insert_Symbol($symbol,$value,$type) ) { return undef }
	if ( !defined insert_Symbol_Grammar($symbol,$grammar) ) { return undef }
	return "Symbol $symbol added successfully!";
}

=head2 addAttribute

insert attribute

=cut

sub addAttribute {
	my ($grammar,$attribute,$type,$class) = @_;
	my ($symbol,$attrib) = split /\./, $attribute;
	if ( !defined insert_Attribute($attribute,$type,$class,$symbol) ) { return undef }
	if ( !defined insert_Attribute_Grammar($attribute,$grammar) ) { return undef }
	return "Attribute $attribute added successfully!";
}

=head2 addProduction

insert production

=cut

sub addProduction {
	my ($grammar,$prod,$exp) = @_;
	if ( !defined insert_Production($prod,$exp) ) { return undef }
	if ( !defined insert_Production_Grammar($prod,$grammar) ) { return undef }
	return "Production $prod added successfully!";
}

=head2 addComputation

insert computation

=cut

sub addComputation {
	my ($comp,$attrib,$pos,$type,$modus) = @_;
	if ( !defined insert_Computation($comp,$pos,$type,$modus,$attrib) ) { return undef }
	return "Computation $comp added successfully!";
}

=head2 addArgument

insert argument

=cut

sub addArgument {
	my ($arg,$attrib,$pos) = @_;
	if ( !defined insert_Argument($arg,$pos,$attrib) ) { return undef }
	return "Argument $arg added successfully!";
}

=head2 addFunction

insert function

=cut

sub addFunction {
	my ($grammar,$func,$spec) = @_;
	if ( !defined insert_Function($func,$spec) ) { return undef }
	if ( !defined insert_Function_Grammar($func,$grammar) ) { return undef }
	return "Function $func added successfully!";
}

=head2 addImport

insert importation

=cut

sub addImport {
	my ($grammar,$import) = @_;
	if ( !defined insert_Importation($import) ) { return undef }
	if ( !defined insert_Importation_Grammar($import,$grammar) ) { return undef }
	return "$import imported successfully!";
}

=head2 addProdComp

insert computation and associate it with a production

=cut

sub addProdComp {
	my ($prod,$comp,$attrib,$pos,$type,$modus) = @_;
	if ( !defined insert_Computation($comp,$pos,$type,$modus,$attrib) ) { return undef }
	if ( !defined insert_Computation_Production($comp,$prod) ) { return undef }
	return "Computation $comp added successfully!";
}

=head2 addCompArg

insert argument and associate it with a computation

=cut

sub addCompArg {
	my ($comp,$arg,$attrib,$pos) = @_;
	if ( !defined insert_Argument($arg,$pos,$attrib) ) { return undef }
	if ( !defined insert_Argument_Computation($arg,$comp) ) { return undef }
	return "Argument $arg added successfully!";
}

#----------
#  Edit
#----------

=head2 editSymbol

edit symbol

=cut

sub editSymbol {
	my $symbol = shift;
	my $sql = "Id_symbol='$symbol'";
	my $sym = select_Symbol($sql,'Id_symbol','Value','Type');
	if ( !defined $sym ) { return undef }
	if ( !keys %{$sym} ) { $@ = "Symbol $symbol not found!"; return undef }
	my ($key) = keys %{$sym};
	my $res = {
		Symbol => $sym->{$key}->{'Id_symbol'},
		Value => $sym->{$key}->{'Value'},
		SymbolType => $sym->{$key}->{'Type'}
	};
	return $res;
}

=head2 editAttribute

edit attribute

=cut

sub editAttribute {
	my $attribute = shift;
	my $sql = "Id_attrib='$attribute'";
	my $attrib = select_Attribute($sql,'Id_attrib','Type','Classe');
	if ( !defined $attrib ) { return undef }
	if ( !keys %{$attrib} ) { $@ = "Attribute $attribute not found!"; return undef }
	my ($key) = keys %{$attrib};
	my $res = {
		Attribute => $attrib->{$key}->{'Id_attrib'},
		Type => $attrib->{$key}->{'Type'},
		Class => $attrib->{$key}->{'Classe'}
	};
	return $res;
}

=head2 editProduction

edit production

=cut

sub editProduction {
	my $prod = shift;
	my $sql = "Prod_Name='$prod'";
	my $p = select_Production($sql,'Prod_Name','Expression');
	if ( !defined $p ) { return undef }
	if ( !keys %{$p} ) { $@ = "Production $prod not found!"; return undef }
	my ($key) = keys %{$p};
	my $res = {
		Production => $p->{$key}->{'Prod_Name'},
		Expression => $p->{$key}->{'Expression'}
	};
	return $res;
}

=head2 editComputation

edit computation

=cut

sub editComputation {
	my $comp = shift;
	my $sql = "Comp_Name='$comp'";
	my $c = select_Computation($sql,'Comp_Name','Id_attrib','Position','ReturnType','Modus');
	if ( !defined $c ) { return undef }
	if ( !keys %{$c} ) { $@ = "Computation $comp not found!"; return undef }
	my ($key) = keys %{$c};
	my $res = {
		Computation => $c->{$key}->{'Comp_Name'},
		Attribute => $c->{$key}->{'Id_attrib'},
		Position => $c->{$key}->{'Position'},
		ReturnType => $c->{$key}->{'ReturnType'},
		Modus => $c->{$key}->{'Modus'}
	};
	return $res;
}

=head2 editArgument

edit argument

=cut

sub editArgument {
	my $arg = shift;
	my $sql = "Cod_Arg='$arg'";
	my $a = select_Argument($sql,'Cod_Arg','Id_attrib','Position');
	if ( !defined $a ) { return undef }
	if ( !keys %{$a} ) { $@ = "Argument $arg not found!"; return undef }
	my ($key) = keys %{$a};
	my $res = {
		Cod_Arg => $a->{$key}->{'Cod_Arg'},
		Attribute => $a->{$key}->{'Id_attrib'},
		Position => $a->{$key}->{'Position'}
	};
	return $res;
}

=head2 editFunction

edit function

=cut

sub editFunction {
	my $function = shift;
	my $sql = "Func_Name='$function'";
	my $func = select_Function($sql,'Func_Name','Specification');
	if ( !defined $func ) { return undef }
	if ( !keys %{$func} ) { $@ = "Function $function not found!"; return undef }
	my ($key) = keys %{$func};
	my $res = {
		Function => $func->{$key}->{'Func_Name'},
		Specification => $func->{$key}->{'Specification'}
	};
	return $res;
}


#----------
#  Modify
#----------


=head2 modifySymbol

modify symbol

=cut

sub modifySymbol {
	my ($grammar,$symbol,$newkey,$value,$type) = @_;
	my $set = "Id_symbol='$newkey', Value='$value', Type='$type'";
	my $sql = "Id_symbol='$symbol'";
	if ( !defined update_Symbol($set,$sql) ) { return undef }
	$set = "Id_symbol='$newkey'";
	$sql = "Grammar_Name='$grammar'";
	if ( !defined update_Symbol_Grammar($set,$sql) ) { return undef }
	return "Symbol successfully edited!";
}

=head2 modifyAttribute

modify attribute

=cut

sub modifyAttribute {
	my ($grammar,$attribute,$newkey,$type,$class) = @_;
	my ($symbol,$attrib) = split /\./, $newkey;
	my $set = "Id_attrib='$newkey', Type='$type', Classe='$class', Id_symbol='$symbol'";
	my $sql = "Id_attrib='$attribute'";
	if ( !defined update_Attribute($set,$sql) ) { return undef }
	$set = "Id_attrib='$newkey'";
	$sql = "Grammar_Name='$grammar'";
	if ( !defined update_Attribute_Grammar($set,$sql) ) { return undef }
	$sql = "Id_attrib='$attribute'";
	if ( !defined update_Argument($set,$sql) ) { return undef }
	if ( !defined update_Computation($set,$sql) ) { return undef }
	return "Attribute successfully edited!";
}

=head2 modifyProduction

modify production

=cut

sub modifyProduction {
	my ($grammar,$prod,$newkey,$exp) = @_;
	my $set = "Prod_Name='$newkey', Expression='$exp'";
	my $sql = "Prod_Name='$prod'";
	if ( !defined update_Production($set,$sql) ) { return undef }
	$set = "Prod_Name='$newkey'";
	$sql = "Grammar_Name='$grammar'";
	if ( !defined update_Production_Grammar($set,$sql) ) { return undef }
	$sql = "Prod_Name='$prod'";
	if ( !defined update_Computation_Production($set,$sql) ) { return undef }
	return "Production successfully edited!";
}

=head2 modifyComputation

modify computation

=cut

sub modifyComputation {
	my ($comp,$newkey,$attrib,$pos,$type,$modus) = @_;
	my $set = "Comp_Name='$newkey', Id_attrib='$attrib', Position='$pos', ReturnType='$type', Modus='$modus'";
	my $sql = "Comp_Name='$comp'";
	if ( !defined update_Computation($set,$sql) ) { return undef }
	$set = "Comp_Name='$newkey'";
	if ( !defined update_Computation_Production($set,$sql) ) { return undef }
	if ( !defined update_Argument_Computation($set,$sql) ) { return undef }
	return "Computation successfully edited!";
}

=head2 modifyArgument

modify argument

=cut

sub modifyArgument {
	my ($arg,$attrib,$pos) = @_;
	my $set = "Id_attrib='$attrib', Position='$pos'";
	my $sql = "Cod_Arg='$arg'";
	if ( !defined update_Argument($set,$sql) ) { return undef }
	return "Argument successfully edited!";
}

=head2 modifyFunction

modify function

=cut

sub modifyFunction {
	my ($grammar,$func,$newkey,$spec) = @_;
	my $set = "Func_Name='$newkey', Specification='$spec'";
	my $sql = "Func_Name='$func'";
	if ( !defined update_Function($set,$sql) ) { return undef }
	$set = "Func_Name='$newkey'";
	$sql = "Grammar_Name='$grammar'";
	if ( !defined update_Function_Grammar($set,$sql) ) { return undef }
	return "Function successfully edited!";
}


#-------------------
#  Remove & Search
#-------------------


=head2 dualSymbol

remove or search for a symbol

=cut

sub dualSymbol {
	my ($grammar,$field,$cond,$key,$oper) = @_;
	my $sql = "Grammar_Name='$grammar'";
	my $symbols = select_Symbol_Grammar($sql,'Id_symbol');
	if ( !defined $symbols ) { return undef }
	if ( !keys %{$symbols} ) { $@ = "$grammar grammar doesn't have any symbols!"; return undef }
	my $res;
	switch ($field) {
		case 'Symbol' { $sql = 'Id_symbol' }
		case 'Value' { $sql = 'Value' }
		case 'SymbolType' { $sql = 'Type' }
	}
	switch ($cond) {
		case 'Equal' { $sql .= "='$key'" }
		case 'NotEqual' { $sql .= " not like '$key'" }
		case 'StartWith' { $sql .= " like '$key\%'" }
		case 'EndWith' { $sql .= " like '\%$key'" }
		case 'Contains' { $sql .= " like '\%$key\%'" }
	}
	my @list;
	foreach ( keys %{$symbols} ) { push @list, "Id_symbol='$_'" }
	if ( @list ) { $sql .= ' and ('; $sql .= join ' or ',@list; $sql .= ')' }
	if ( $oper eq 'Remove') {
		$res = select_Symbol($sql,'Id_symbol','Value','Type');
		if ( !defined $res ) { return undef }
		if ( !defined delete_Symbol($sql) ) { return undef }
		return $res;
	}
	else {
		$res = select_Symbol($sql,'Id_symbol','Value','Type');
		if ( !defined $res ) { return undef }
		return $res;
	}
}

=head2 dualAttribute

remove or search for an attribute

=cut

sub dualAttribute {
	my ($grammar,$field,$cond,$key,$oper) = @_;
	my $sql = "Grammar_Name='$grammar'";
	my $attrib = select_Attribute_Grammar($sql,'Id_attrib');
	if ( !defined $attrib ) { return undef }
	if ( !keys %{$attrib} ) { $@ = "$grammar grammar doesn't have any attributes!"; return undef }
	my $res;
	switch ($field) {
		case 'Attribute' { $sql = 'Id_attrib' }
		case 'Type' { $sql = 'Type' }
		case 'Class' { $sql = 'Classe' }
	}
	switch ($cond) {
		case 'Equal' { $sql .= "='$key'" }
		case 'NotEqual' { $sql .= " not like '$key'" }
		case 'StartWith' { $sql .= " like '$key\%'" }
		case 'EndWith' { $sql .= " like '\%$key'" }
		case 'Contains' { $sql .= " like '\%$key\%'" }
	}
	my @list;
	foreach ( keys %{$attrib} ) { push @list, "Id_attrib='$_'" }
	if ( @list ) { $sql .= ' and ('; $sql .= join ' or ',@list; $sql .= ')' }
	if ( $oper eq 'Remove') {
		$res = select_Attribute($sql,'Id_attrib','Type','Classe');
		if ( !defined $res ) { return undef }
		if ( !defined delete_Attribute($sql) ) { return undef }
		return $res;
	}
	else {
		$res = select_Attribute($sql,'Id_attrib','Type','Classe');
		if ( !defined $res ) { return undef }
		return $res;
	}
}

=head2 dualProduction

remove or search for a production

=cut

sub dualProduction {
	my ($grammar,$field,$cond,$key,$oper) = @_;
	my $sql = "Grammar_Name='$grammar'";
	my $prod = select_Production_Grammar($sql,'Prod_Name');
	if ( !defined $prod ) { return undef }
	if ( !keys %{$prod} ) { $@ = "$grammar grammar doesn't have any productions!"; return undef }
	my $res;
	switch ($field) {
		case 'Production' { $sql = 'Prod_Name' }
		case 'Expression' { $sql = 'Expression' }
	}
	switch ($cond) {
		case 'Equal' { $sql .= "='$key'" }
		case 'NotEqual' { $sql .= " not like '$key'" }
		case 'StartWith' { $sql .= " like '$key\%'" }
		case 'EndWith' { $sql .= " like '\%$key'" }
		case 'Contains' { $sql .= " like '\%$key\%'" }
	}
	my @list;
	foreach ( keys %{$prod} ) { push @list, "Prod_Name='$_'" }
	if ( @list ) { $sql .= ' and ('; $sql .= join ' or ',@list; $sql .= ')' }
	if ( $oper eq 'Remove') {
		$res = select_Production($sql,'Prod_Name','Expression');
		if ( !defined $res ) { return undef }
		if ( !defined delete_Production($sql) ) { return undef }
		return $res;
	}
	else {
		$res = select_Production($sql,'Prod_Name','Expression');
		if ( !defined $res ) { return undef }
		return $res;
	}
}

=head2 dualFunction

remove or search for a function

=cut

sub dualFunction {
	my ($grammar,$field,$cond,$key,$oper) = @_;
	my $sql = "Grammar_Name='$grammar'";
	my $func = select_Function_Grammar($sql,'Func_Name');
	if ( !defined $func ) { return undef }
	if ( !keys %{$func} ) { $@ = "$grammar grammar doesn't have any functions!"; return undef }
	my $res;
	switch ($field) {
		case 'Function' { $sql = 'Func_Name' }
		case 'Specification' { $sql = 'Specification' }
	}
	switch ($cond) {
		case 'Equal' { $sql .= "='$key'" }
		case 'NotEqual' { $sql .= " not like '$key'" }
		case 'StartWith' { $sql .= " like '$key\%'" }
		case 'EndWith' { $sql .= " like '\%$key'" }
		case 'Contains' { $sql .= " like '\%$key\%'" }
	}
	my @list;
	foreach ( keys %{$func} ) { push @list, "Func_Name='$_'" }
	if ( @list ) { $sql .= ' and ('; $sql .= join ' or ',@list; $sql .= ')' }
	if ( $oper eq 'Remove') {
		$res = select_Function($sql,'Func_Name','Specification');
		if ( !defined $res ) { return undef }
		if ( !defined delete_Function($sql) ) { return undef }
		return $res;
	}
	else {
		$res = select_Function($sql,'Func_Name','Specification');
		if ( !defined $res ) { return undef }
		return $res;
	}
}

=head2 dualComputation

remove or search for a computation

=cut

sub dualComputation {
	my ($grammar,$field,$cond,$key,$oper) = @_;
	my $sql = "Grammar_Name='$grammar'";
	my $prod = select_Production_Grammar($sql,'Prod_Name');
	if ( !defined $prod ) { return undef }
	if ( !keys %{$prod} ) { $@ = "$grammar grammar doesn't have any productions!"; return undef }
	my @list;
	foreach ( keys %{$prod} ) { push @list, "Prod_Name='$_'" }
	if ( @list ) { $sql = join ' or ',@list }
	my $comp = select_Computation_Production($sql,'Comp_Name');
	if ( !defined $comp ) { return undef }
	if ( !keys %{$comp} ) { $@ = "$grammar grammar doesn't have any computations associated with productions!"; return undef }
	my $res;
	switch ($field) {
		case 'Computation' { $sql = 'Comp_Name' }
		case 'Attribute' { $sql = 'Id_attrib' }
		case 'Position' { $sql = 'Position' }
		case 'ReturnType' { $sql = 'ReturnType' }
		case 'Modus' { $sql = 'Modus' }
	}
	switch ($cond) {
		case 'Equal' { $sql .= "='$key'" }
		case 'NotEqual' { $sql .= " not like '$key'" }
		case 'StartWith' { $sql .= " like '$key\%'" }
		case 'EndWith' { $sql .= " like '\%$key'" }
		case 'Contains' { $sql .= " like '\%$key\%'" }
	}
	@list = ();
	foreach ( keys %{$comp} ) { push @list, "Comp_Name='$_'" }
	if ( @list ) { $sql .= ' and ('; $sql .= join ' or ',@list; $sql .= ')' }
	if ( $oper eq 'Remove') {
		$res = select_Computation($sql,'Comp_Name','Id_attrib','Position','ReturnType','Modus');
		if ( !defined $res ) { return undef }
		if ( !defined delete_Computation($sql) ) { return undef }
		return $res;
	}
	else {
		$res = select_Computation($sql,'Comp_Name','Id_attrib','Position','ReturnType','Modus');
		if ( !defined $res ) { return undef }
		return $res;
	}
}

=head2 dualArgument

remove or search for an argument

=cut

sub dualArgument {
	my ($grammar,$field,$cond,$key,$oper) = @_;
	my $sql = "Grammar_Name='$grammar'";
	my $prod = select_Production_Grammar($sql,'Prod_Name');
	if ( !defined $prod ) { return undef }
	if ( !keys %{$prod} ) { $@ = "$grammar grammar doesn't have any productions!"; return undef }
	my @list;
	foreach ( keys %{$prod} ) { push @list, "Prod_Name='$_'" }
	if ( @list ) { $sql = join ' or ',@list }
	my $comp = select_Computation_Production($sql,'Comp_Name');
	if ( !defined $comp ) { return undef }
	if ( !keys %{$comp} ) { $@ = "$grammar grammar doesn't have any computations associated with productions!"; return undef }
	@list = ();
	foreach ( keys %{$comp} ) { push @list, "Comp_Name='$_'" }
	if ( @list ) { $sql = join ' or ',@list }
	my $arg = select_Argument_Computation($sql,'Cod_Arg');
	if ( !defined $arg ) { return undef }
	if ( !keys %{$arg} ) { $@ = "$grammar grammar doesn't have any arguments associated with computations!"; return undef }
	my $res;
	switch ($field) {
		case 'Cod_Arg' { $sql = 'Cod_Arg' }
		case 'Attribute' { $sql = 'Id_attrib' }
		case 'Position' { $sql = 'Position' }
	}
	switch ($cond) {
		case 'Equal' { $sql .= "='$key'" }
		case 'NotEqual' { $sql .= " not like '$key'" }
		case 'StartWith' { $sql .= " like '$key\%'" }
		case 'EndWith' { $sql .= " like '\%$key'" }
		case 'Contains' { $sql .= " like '\%$key\%'" }
	}
	@list = ();
	foreach ( keys %{$arg} ) { push @list, "Cod_Arg='$_'" }
	if ( @list ) { $sql .= ' and ('; $sql .= join ' or ',@list; $sql .= ')' }
	if ( $oper eq 'Remove') {
		$res = select_Argument($sql,'Cod_Arg','Id_attrib','Position');
		if ( !defined $res ) { return undef }
		if ( !defined delete_Argument($sql) ) { return undef }
		return $res;
	}
	else {
		$res = select_Argument($sql,'Cod_Arg','Id_attrib','Position');
		if ( !defined $res ) { return undef }
		return $res;
	}
}

=head2 removeImport

remove an importation

=cut

sub removeImport {
	my ($grammar,$import) = @_;
	my $sql = "Grammar_Name='$grammar'";
	my $imp = select_Importation_Grammar($sql,'Import');
	if ( !defined $imp ) { return undef }
	if ( !keys %{$imp} ) { $@ = "$grammar grammar doesn't have any importations!"; return undef }
	my ($key) = keys %{$imp};
	$sql = "Import='$key'";
	if ( !defined delete_Importation($sql) ) { return undef }
	return "$import successfully removed!";
}


#----------
#  View
#----------


=head2 viewComputations

show all the computations of a production

=cut

sub viewComputations {
	my $production = shift;
	my $sql = "Prod_Name='$production'";
	my $comp = select_Computation_Production($sql,'Comp_Name');
	if ( !defined $comp ) { return undef }
	if ( !keys %{$comp} ) { $@ = "$production production doesn't have any computations associated!"; return undef }
	my @list;
	foreach ( keys %{$comp} ) { push @list, "Comp_Name='$_'" }
	if ( @list ) { $sql = join ' or ',@list }
	my $res = select_Computation($sql,'Comp_Name','Id_attrib','Position','ReturnType','Modus');
	if ( !defined $res ) { return undef }
	if ( !keys %{$res} ) { $@ = "There are no computations associated with $production production!"; return undef }
	return $res;
}

=head2 viewArguments

show all the arguments of a computation

=cut

sub viewArguments {
	my $computation = shift;
	my $sql = "Comp_Name='$computation'";
	my $args = select_Argument_Computation($sql,'Cod_Arg');
	if ( !defined $args ) { return undef }
	if ( !keys %{$args} ) { $@ = "$computation computation's operation doesn't have any arguments!"; return undef }
	my @list;
	foreach ( keys %{$args} ) { push @list, "Cod_Arg='$_'" }
	if ( @list ) { $sql = join ' or ',@list }
	my $res = select_Argument($sql,'Cod_Arg','Id_attrib','Position');
	if ( !defined $res ) { return undef }
	if ( !keys %{$res} ) { $@ = "There are no arguments associated with $computation computation!"; return undef }
	return $res;
}


#----------
#  Show
#----------


=head2 showSymbols

returns all symbols

=cut

sub showSymbols {
	my $grammar = shift;
	my $sql = "Grammar_Name='$grammar'";
	my $symbols = select_Symbol_Grammar($sql,'Id_symbol');
	if ( !defined $symbols ) { return undef }
	if ( !keys %{$symbols} ) { $@ = "$grammar grammar doesn't have any symbols!"; return undef }
	my @list;
	foreach ( keys %{$symbols} ) { push @list, "Id_symbol='$_'" }
	$sql = join ' or ',@list;
	my $res = select_Symbol($sql,'Id_symbol','Value','Type');
	if ( !defined $res ) { return undef }
	return $res;
}

=head2 showAttributes

returns all attributes

=cut

sub showAttributes {
	my $grammar = shift;
	my $sql = "Grammar_Name='$grammar'";
	my $attribs = select_Attribute_Grammar($sql,'Id_attrib');
	if ( !defined $attribs ) { return undef }
	if ( !keys %{$attribs} ) { $@ = "$grammar grammar doesn't have any attributes!"; return undef }
	my @list;
	foreach ( keys %{$attribs} ) { push @list, "Id_attrib='$_'" }
	$sql = join ' or ',@list;
	my $res = select_Attribute($sql,'Id_attrib','Type','Classe');
	if ( !defined $res ) { return undef }
	return $res;
}

=head2 showProductions

returns all productions

=cut

sub showProductions {
	my $grammar = shift;
	my $sql = "Grammar_Name='$grammar'";
	my $prod = select_Production_Grammar($sql,'Prod_Name');
	if ( !defined $prod ) { return undef }
	if ( !keys %{$prod} ) { $@ = "$grammar grammar doesn't have any productions!"; return undef }
	my @list;
	foreach ( keys %{$prod} ) { push @list, "Prod_Name='$_'" }
	$sql = join ' or ',@list;
	my $res = select_Production($sql,'Prod_Name','Expression');
	if ( !defined $res ) { return undef }
	return $res;
}

=head2 showSymbols

returns all functions

=cut

sub showFunctions {
	my $grammar = shift;
	my $sql = "Grammar_Name='$grammar'";
	my $func = select_Function_Grammar($sql,'Func_Name');
	if ( !defined $func ) { return undef }
	if ( !keys %{$func} ) { $@ = "$grammar grammar doesn't have any functions!"; return undef }
	my @list;
	foreach ( keys %{$func} ) { push @list, "Func_Name='$_'" }
	$sql = join ' or ',@list;
	my $res = select_Function($sql,'Func_Name','Specification');
	if ( !defined $res ) { return undef }
	return $res;
}

=head2 showImportations

returns all importations

=cut

sub showImportations {
	my $grammar = shift;
	my $sql = "Grammar_Name='$grammar'";
	my $imp = select_Importation_Grammar($sql,'Import');
	if ( !defined $imp ) { return undef }
	if ( !keys %{$imp} ) { $@ = "$grammar grammar doesn't have any importations!"; return undef }
	my @list;
	foreach ( keys %{$imp} ) { push @list, "Import='$_'" }
	$sql = join ' or ',@list;
	my $res = select_Importation($sql,'Import');
	if ( !defined $res ) { return undef }
	return $res;
}

=head2 showComputations

returns all computations

=cut

sub showComputations {
	# my $grammar = shift;
	# my $sql = "Grammar_Name='$grammar'";
	# my $comp = select_Computation_Grammar($sql,'Comp_Name');
	# if ( !defined $comp ) { return undef }
	# if ( !keys %{$comp} ) { $@ = "$grammar grammar doesn't have any defined computations!"; return undef }
	# my @list;
	# foreach ( keys %{$comp} ) { push @list, "Comp_Name='$_'" }
	# $sql = join ' or ',@list;
	my $res = select_Computation('undef','Comp_Name','Position','ReturnType','Modus','Id_attrib');
	if ( !defined $res ) { return undef }
	return $res;
	# $@ = "Under construction!";
	# return undef;
}

=head2 showArguments

returns all arguments

=cut

sub showArguments {
	# my $grammar = shift;
	# my $sql = "Grammar_Name='$grammar'";
	# my $args = select_Argument_Grammar($sql,'Cod_Arg');
	# if ( !defined $args ) { return undef }
	# if ( !keys %{$args} ) { $@ = "$grammar grammar doesn't have any defined arguments!"; return undef }
	# my @list;
	# foreach ( keys %{$args} ) { push @list, "Cod_Arg='$_'" }
	# $sql = join ' or ',@list;
	my $res = select_Argument('undef','Cod_Arg','Position','Id_attrib');
	if ( !defined $res ) { return undef }
	return $res;
	# $@ = "Under construction!";
	# return undef;
}


#-------------
#  Associate
#-------------


=head2 compOfProd

associates a computation to a production

=cut

sub compOfProd {
	my ($prod,$comp) = @_;         
	if ( !defined insert_Computation_Production($comp,$prod) ) { return undef }
	return "Computation $comp has been successfully added to $prod Production!";
}

=head2 argOfComp

associates an argument to a computation

=cut

sub argOfComp {
	my ($comp,$arg) = @_;         
	if ( !defined insert_Argument_Computation($arg,$comp) ) { return undef }
	return "Argument $arg has been successfully added to $comp Computation!";
}

1;
__END__
# Below is stub documentation for your module. You'd better edit it!

=head1 NAME

XagraEditor - Perl extension for blah blah blah

=head1 SYNOPSIS

  use XagraEditor;
  blah blah blah

=head1 DESCRIPTION

Stub documentation for XagraEditor, created by h2xs. It looks like the
author of the extension was negligent enough to leave the stub
unedited.

Blah blah blah.

=head2 EXPORT

None by default.



=head1 SEE ALSO

Mention other useful documentation such as the documentation of
related modules or operating system documentation (such as man pages
in UNIX), or any relevant external documentation such as RFCs or
standards.

If you have a mailing list set up for your module, mention it here.

If you have a web site set up for your module, mention it here.

=head1 AUTHOR

Hugo Areias, E<lt>Hades@localE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2009 by Hugo Areias

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.10.0 or,
at your option, any later version of Perl 5 you may have available.


=cut
