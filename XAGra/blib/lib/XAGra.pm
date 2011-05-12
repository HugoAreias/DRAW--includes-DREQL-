package XAGra;

use 5.010000;
use strict;
use warnings;

use DBI;
use Tie::IxHash;
use Switch;
use base 'Exporter';

our @EXPORT = ('insert_Grammar', 'delete_Grammar', 'update_Grammar', 'select_Grammar', 'insert_Symbol_Grammar', 'delete_Symbol_Grammar', 'update_Symbol_Grammar', 'select_Symbol_Grammar', 'insert_Function_Grammar', 'delete_Function_Grammar', 'update_Function_Grammar', 'select_Function_Grammar', 'insert_Production', 'delete_Production', 'update_Production', 'select_Production', 'insert_Attribute_Grammar', 'delete_Attribute_Grammar', 'update_Attribute_Grammar', 'select_Attribute_Grammar', 'insert_Attribute', 'delete_Attribute', 'update_Attribute', 'select_Attribute', 'insert_Computation_Production', 'delete_Computation_Production', 'update_Computation_Production', 'select_Computation_Production', 'insert_Symbol', 'delete_Symbol', 'update_Symbol', 'select_Symbol', 'insert_Production_Grammar', 'delete_Production_Grammar', 'update_Production_Grammar', 'select_Production_Grammar', 'insert_Argument_Computation', 'delete_Argument_Computation', 'update_Argument_Computation', 'select_Argument_Computation', 'insert_Computation', 'delete_Computation', 'update_Computation', 'select_Computation', 'insert_Importation_Grammar', 'delete_Importation_Grammar', 'update_Importation_Grammar', 'select_Importation_Grammar', 'insert_Function', 'delete_Function', 'update_Function', 'select_Function', 'insert_Importation', 'delete_Importation', 'update_Importation', 'select_Importation', 'insert_Argument', 'delete_Argument', 'update_Argument', 'select_Argument');

our $VERSION = '0.01';

our $db;
tie %{$db}, 'Tie::IxHash';

tie %{$db->{Grammar}}, 'Tie::IxHash';
tie %{$db->{Grammar}->{'fields'}}, 'Tie::IxHash';
%{$db->{Grammar}->{'fields'}} = (
	'Grammar_Name' => {
		type => 'varchar',
		size => 'null',
		options => [ 'Key', 'Editable' ]
	},
	'Axiom' => {
		type => 'varchar',
		size => 'null',
		options => [ 'Optional' ]
	}
);
$db->{Grammar}->{'primkeys'} = {
	Grammar_Name => undef,
};
$db->{Grammar}->{'fgnkeys'} = {
};

tie %{$db->{Symbol_Grammar}}, 'Tie::IxHash';
tie %{$db->{Symbol_Grammar}->{'fields'}}, 'Tie::IxHash';
%{$db->{Symbol_Grammar}->{'fields'}} = (
	'Id_symbol' => {
		type => 'varchar',
		size => 'null',
		options => [ 'Key' ]
	},
	'Grammar_Name' => {
		type => 'varchar',
		size => 'null',
		options => [ 'Key', 'Editable' ]
	}
);
$db->{Symbol_Grammar}->{'primkeys'} = {
	Id_symbol => undef,
	Grammar_Name => undef,
};
$db->{Symbol_Grammar}->{'fgnkeys'} = {
	Id_symbol => 'Symbol',
	Grammar_Name => 'Grammar',
};

tie %{$db->{Function_Grammar}}, 'Tie::IxHash';
tie %{$db->{Function_Grammar}->{'fields'}}, 'Tie::IxHash';
%{$db->{Function_Grammar}->{'fields'}} = (
	'Func_Name' => {
		type => 'varchar',
		size => 'null',
		options => [ 'Key' ]
	},
	'Grammar_Name' => {
		type => 'varchar',
		size => 'null',
		options => [ 'Key', 'Editable' ]
	}
);
$db->{Function_Grammar}->{'primkeys'} = {
	Func_Name => undef,
	Grammar_Name => undef,
};
$db->{Function_Grammar}->{'fgnkeys'} = {
	Func_Name => 'Function',
	Grammar_Name => 'Grammar',
};

tie %{$db->{Production}}, 'Tie::IxHash';
tie %{$db->{Production}->{'fields'}}, 'Tie::IxHash';
%{$db->{Production}->{'fields'}} = (
	'Prod_Name' => {
		type => 'varchar',
		size => 'null',
		options => [ 'Key' ]
	},
	'Expression' => {
		type => 'text',
		size => 'null',
		options => [ 'Optional' ]
	}
);
$db->{Production}->{'primkeys'} = {
	Prod_Name => undef,
};
$db->{Production}->{'fgnkeys'} = {
};

tie %{$db->{Attribute_Grammar}}, 'Tie::IxHash';
tie %{$db->{Attribute_Grammar}->{'fields'}}, 'Tie::IxHash';
%{$db->{Attribute_Grammar}->{'fields'}} = (
	'Id_attrib' => {
		type => 'varchar',
		size => 'null',
		options => [ 'Key' ]
	},
	'Grammar_Name' => {
		type => 'varchar',
		size => 'null',
		options => [ 'Key', 'Editable' ]
	}
);
$db->{Attribute_Grammar}->{'primkeys'} = {
	Id_attrib => undef,
	Grammar_Name => undef,
};
$db->{Attribute_Grammar}->{'fgnkeys'} = {
	Id_attrib => 'Attribute',
	Grammar_Name => 'Grammar',
};

tie %{$db->{Attribute}}, 'Tie::IxHash';
tie %{$db->{Attribute}->{'fields'}}, 'Tie::IxHash';
%{$db->{Attribute}->{'fields'}} = (
	'Id_attrib' => {
		type => 'varchar',
		size => 'null',
		options => [ 'Key' ]
	},
	'Type' => {
		type => 'varchar',
		size => 'null',
		options => [ 'Optional' ]
	},
	'Classe' => {
		type => 'varchar',
		size => 'null',
		options => [ 'Optional' ]
	},
	'Id_symbol' => {
		type => 'varchar',
		size => 'null',
		options => [ 'Key' ]
	}
);
$db->{Attribute}->{'primkeys'} = {
	Id_attrib => undef,
};
$db->{Attribute}->{'fgnkeys'} = {
	Id_symbol => 'Symbol',
};

tie %{$db->{Computation_Production}}, 'Tie::IxHash';
tie %{$db->{Computation_Production}->{'fields'}}, 'Tie::IxHash';
%{$db->{Computation_Production}->{'fields'}} = (
	'Comp_Name' => {
		type => 'varchar',
		size => 'null',
		options => [ 'Key' ]
	},
	'Prod_Name' => {
		type => 'varchar',
		size => 'null',
		options => [ 'Key' ]
	}
);
$db->{Computation_Production}->{'primkeys'} = {
	Comp_Name => undef,
	Prod_Name => undef,
};
$db->{Computation_Production}->{'fgnkeys'} = {
	Comp_Name => 'Computation',
	Prod_Name => 'Production',
};

tie %{$db->{Symbol}}, 'Tie::IxHash';
tie %{$db->{Symbol}->{'fields'}}, 'Tie::IxHash';
%{$db->{Symbol}->{'fields'}} = (
	'Id_symbol' => {
		type => 'varchar',
		size => 'null',
		options => [ 'Key' ]
	},
	'Value' => {
		type => 'text',
		size => 'null',
	},
	'Type' => {
		type => 'varchar',
		size => 'null',
		options => [ 'Optional' ]
	}
);
$db->{Symbol}->{'primkeys'} = {
	Id_symbol => undef,
};
$db->{Symbol}->{'fgnkeys'} = {
};

tie %{$db->{Production_Grammar}}, 'Tie::IxHash';
tie %{$db->{Production_Grammar}->{'fields'}}, 'Tie::IxHash';
%{$db->{Production_Grammar}->{'fields'}} = (
	'Prod_Name' => {
		type => 'varchar',
		size => 'null',
		options => [ 'Key' ]
	},
	'Grammar_Name' => {
		type => 'varchar',
		size => 'null',
		options => [ 'Key', 'Editable' ]
	}
);
$db->{Production_Grammar}->{'primkeys'} = {
	Prod_Name => undef,
	Grammar_Name => undef,
};
$db->{Production_Grammar}->{'fgnkeys'} = {
	Prod_Name => 'Production',
	Grammar_Name => 'Grammar',
};

tie %{$db->{Argument_Computation}}, 'Tie::IxHash';
tie %{$db->{Argument_Computation}->{'fields'}}, 'Tie::IxHash';
%{$db->{Argument_Computation}->{'fields'}} = (
	'Cod_Arg' => {
		type => 'int',
		size => 'null',
		options => [ 'Key' ]
	},
	'Comp_Name' => {
		type => 'varchar',
		size => 'null',
		options => [ 'Key' ]
	}
);
$db->{Argument_Computation}->{'primkeys'} = {
	Cod_Arg => undef,
	Comp_Name => undef,
};
$db->{Argument_Computation}->{'fgnkeys'} = {
	Cod_Arg => 'Argument',
	Comp_Name => 'Computation',
};

tie %{$db->{Computation}}, 'Tie::IxHash';
tie %{$db->{Computation}->{'fields'}}, 'Tie::IxHash';
%{$db->{Computation}->{'fields'}} = (
	'Comp_Name' => {
		type => 'varchar',
		size => 'null',
		options => [ 'Key' ]
	},
	'Position' => {
		type => 'int',
		size => 'null',
		options => [ 'Optional' ]
	},
	'ReturnType' => {
		type => 'varchar',
		size => 'null',
		options => [ 'Optional' ]
	},
	'Modus' => {
		type => 'varchar',
		size => 'null',
		options => [ 'Optional' ]
	},
	'Id_attrib' => {
		type => 'varchar',
		size => 'null',
		options => [ 'Key' ]
	}
);
$db->{Computation}->{'primkeys'} = {
	Comp_Name => undef,
};
$db->{Computation}->{'fgnkeys'} = {
	Id_attrib => 'Attribute',
};

tie %{$db->{Importation_Grammar}}, 'Tie::IxHash';
tie %{$db->{Importation_Grammar}->{'fields'}}, 'Tie::IxHash';
%{$db->{Importation_Grammar}->{'fields'}} = (
	'Import' => {
		type => 'varchar',
		size => 'null',
		options => [ 'Key' ]
	},
	'Grammar_Name' => {
		type => 'varchar',
		size => 'null',
		options => [ 'Key', 'Editable' ]
	}
);
$db->{Importation_Grammar}->{'primkeys'} = {
	Import => undef,
	Grammar_Name => undef,
};
$db->{Importation_Grammar}->{'fgnkeys'} = {
	Import => 'Importation',
	Grammar_Name => 'Grammar',
};

tie %{$db->{Function}}, 'Tie::IxHash';
tie %{$db->{Function}->{'fields'}}, 'Tie::IxHash';
%{$db->{Function}->{'fields'}} = (
	'Func_Name' => {
		type => 'varchar',
		size => 'null',
		options => [ 'Key' ]
	},
	'Specification' => {
		type => 'text',
		size => 'null',
		options => [ 'Optional' ]
	}
);
$db->{Function}->{'primkeys'} = {
	Func_Name => undef,
};
$db->{Function}->{'fgnkeys'} = {
};

tie %{$db->{Importation}}, 'Tie::IxHash';
tie %{$db->{Importation}->{'fields'}}, 'Tie::IxHash';
%{$db->{Importation}->{'fields'}} = (
	'Import' => {
		type => 'varchar',
		size => 'null',
		options => [ 'Key' ]
	}
);
$db->{Importation}->{'primkeys'} = {
	Import => undef,
};
$db->{Importation}->{'fgnkeys'} = {
};

tie %{$db->{Argument}}, 'Tie::IxHash';
tie %{$db->{Argument}->{'fields'}}, 'Tie::IxHash';
%{$db->{Argument}->{'fields'}} = (
	'Cod_Arg' => {
		type => 'int',
		size => 'null',
		options => [ 'Key' ]
	},
	'Position' => {
		type => 'int',
		size => 'null',
		options => [ 'Optional' ]
	},
	'Id_attrib' => {
		type => 'varchar',
		size => 'null',
		options => [ 'Key' ]
	}
);
$db->{Argument}->{'primkeys'} = {
	Cod_Arg => undef,
};
$db->{Argument}->{'fgnkeys'} = {
	Id_attrib => 'Attribute',
};

# Preloaded methods go here.

=head2 select_Grammar

SELECT

=cut

sub select_Grammar {
	my ($condition, @fields) = @_;

	my $dbh = DBI->connect("dbi:SQLite:dbname=/Applications/MAMP/cgi-bin/Projecto/XAGra/Data/xagra.db","Hugo","Xagra",{ RaiseError => 1, AutoCommit => 0, unicode => 1 }) or die $DBI::errstr;
	foreach (@fields) {
		if ( !exists $db->{Grammar}->{'fields'}->{$_} ) {
			$dbh->disconnect or warn $dbh->errstr;
			$@ = "Unknown field '$_' found while selecting data from Grammar table!";
			return undef
		}
		else { next }
	}
	my $sql;
	if ( 'undef' eq $condition ) { $sql = 'SELECT '.(join ',',@fields)." FROM Grammar" }
	else { $sql = 'SELECT '.(join ',',@fields)." FROM Grammar WHERE $condition" }

	my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
	$sth->execute or $@ = $dbh->errstr;
	my $rv = $sth->fetchall_hashref($fields[0]);
	$dbh->disconnect or warn $dbh->errstr;
	return $rv;
}

# Preloaded methods go here.

=head2 insert_Grammar

INSERT

=cut

sub insert_Grammar {
	my @fields = @_;
	my @tfield = keys %{$db->{Grammar}->{'fields'}};
	my $diff = scalar(@tfield) - scalar(@fields);

	if ( $diff < 0 ) { $@ = "Invalid number of fields submitted!"; return undef }
	my $i = 0;
	my @newfld;
	my $dbh = DBI->connect("dbi:SQLite:dbname=/Applications/MAMP/cgi-bin/Projecto/XAGra/Data/xagra.db","Hugo","Xagra",{ RaiseError => 1, AutoCommit => 0, unicode => 1 }) or die $DBI::errstr;
	foreach ( @tfield ) {
		my $miss=0;
		switch ( $db->{Grammar}->{'fields'}->{$_}->{'type'} ) {
			case /\bvarchar\b/i {
				if ( uc($db->{Grammar}->{'fields'}->{$_}->{'size'}) ne 'NULL' && length($fields[$i]) > $db->{Grammar}->{'fields'}->{$_}->{'size'} ) {
					$dbh->disconnect or warn $dbh->errstr;
					$@ = "Varchar too large, $_ field can only have $db->{Grammar}->{'fields'}->{$_}->{'size'} characters!";
					return undef
				}
			}
			case /\binteger\b/i { if ( $fields[$i] !~ /^\d+$/ ) { $dbh->disconnect or warn $dbh->errstr; $@ = "Invalid type found, $_ field is of type INTEGER!"; return undef } }
			case /\breal\b/i { if ( $fields[$i] !~ /^\d+(\.\d+)?$/ ) { $dbh->disconnect or warn $dbh->errstr; $@ = "Invalid type found, $_ field is of type REAL!"; return undef } }
			else {}
		}
		OPT: foreach my $opt ( @{$db->{Grammar}->{'fields'}->{$_}->{'options'}} ) {
			switch ($opt) {
				case /\beditable\b/i       { next }
				case /\bvisible\b/i        { next }
				case /\bnull\b/i           { next }
				case /\bmasked\b/i         { next }
				case /\bauto_increment\b/i {
					if ( 0 == $diff ) {
						my $sql = "SELECT $_ FROM Grammar WHERE $_='$fields[$i]'";
						my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
						$sth->execute or $@ = $dbh->errstr;
						my $rv = $sth->fetchall_hashref($_);
						if ( exists $rv->{$fields[$i]} ) {
							$dbh->disconnect or warn $dbh->errstr;
							$@ = "$_ is an Auto increment field, $fields[$i] value already found on the Grammar table!";
							return undef
						}
						else { next }
					}
					else { $miss=1; last OPT }
				}
				case /\boptional\b/i       {
					if ( uc($fields[$i]) eq 'NULL' ) { $dbh->disconnect or warn $dbh->errstr; $@ = "$_ cannot be a null value!"; return undef }
					else { next }
				}
				case /\bunique\b/i         {
					my $sql = "SELECT $_ FROM Grammar WHERE $_='$fields[$i]'";
					my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
					$sth->execute or $@ = $dbh->errstr;
					my $rv = $sth->fetchall_hashref($_);
					if ( exists $rv->{$fields[$i]} ) {
						$dbh->disconnect or warn $dbh->errstr;
						$@ = "$_ must have an Unique value, $fields[$i] value already found on the Grammar table!";
						return undef
					}
					else { next }
				}
				else { next }
			}
		}
		if ( 1 == $miss ) { $diff-- }
		else {
			if ( exists $db->{Grammar}->{'fgnkeys'}->{$_} && exists $db->{Grammar}->{'primkeys'}->{$_} ) {}
			elsif ( exists $db->{Grammar}->{'fgnkeys'}->{$_} ) {
				my $sql = "SELECT $_ FROM $db->{Grammar}->{'fgnkeys'}->{$_} WHERE $_='$fields[$i]'";
				my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
				$sth->execute or $@ = $dbh->errstr;
				my $rv = $sth->fetchall_hashref($_);
				if ( !exists $rv->{$fields[$i]} ) {
					$dbh->disconnect or warn $dbh->errstr;
					$@ = "Foreign key $_ cannot be added because '$fields[$i]' key does not exist on the $db->{Grammar}->{'fgnkeys'}->{$_} table!";
					return undef
				}
			}
			if ( exists $db->{Grammar}->{'fgnkeys'}->{$_} && exists $db->{Grammar}->{'primkeys'}->{$_} ) {}
			elsif ( exists $db->{Grammar}->{'primkeys'}->{$_} ) {
				my $sql = "SELECT $_ FROM Grammar WHERE $_='$fields[$i]'";
				my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
				$sth->execute or $@ = $dbh->errstr;
				my $rv = $sth->fetchall_hashref($_);
				if ( exists $rv->{$fields[$i]} ) {
					$dbh->disconnect or warn $dbh->errstr;
					$@ = "Primary key $_ cannot be added because '$fields[$i]' key already exists on the Grammar table!";
					return undef
				}
			}
			$i++;
			push @newfld, $_
		}
	}
	if ( $diff != 0 ) { $dbh->disconnect or warn $dbh->errstr; $@ = "Invalid number of fields submitted!"; return undef }
	my $sql = 'INSERT INTO Grammar('.(join ',',@newfld).') VALUES ('.(join ',',split / /, '? ' x scalar(@fields)).')';
	my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
	my $res=$sth->execute(@fields) or $@ = $dbh->errstr;
	$dbh->commit;
	$dbh->disconnect or warn $dbh->errstr;
	return $res;
}

# Preloaded methods go here.

=head2 delete_Grammar

DELETE

=cut

sub delete_Grammar {
	my $condition = shift;
	my $i=1;
	my $dbh = DBI->connect("dbi:SQLite:dbname=/Applications/MAMP/cgi-bin/Projecto/XAGra/Data/xagra.db","Hugo","Xagra",{ RaiseError => 1, AutoCommit => 0, unicode => 1 }) or die $DBI::errstr;

	foreach ( keys %{$db->{Grammar}->{'primkeys'}} ) {
		foreach my $tb ( keys %{$db} ) {
			if ( exists $db->{$tb}->{'fgnkeys'}->{$_} ) {
				my $notnull = 0;
				foreach my $opt ( @{$db->{$tb}->{'fields'}->{$_}->{'options'}} ) {
					if ( $opt =~ /\boptional\b/i ) { $notnull = 1; last }
					else { next }
				}
				unless ( 1 == $notnull ) {
					my $sql;
					if ( 'undef' eq $condition ) { $sql = "SELECT $_ FROM Grammar" }
					else { $sql = "SELECT $_ FROM Grammar WHERE $condition" }
					my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
					$sth->execute or $@ = $dbh->errstr;
					my $rv = $sth->fetchall_hashref($_);
					foreach my $key ( keys %{$rv} ) {
						my $sql = "UPDATE $tb SET $_=? WHERE $_='$key'";
						my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
						my $str = 'NULL'.$i++;
						$sth->execute($str) or $@ = $dbh->errstr;
					}
					$dbh->commit
				}
			}
		}
	}
	my $sql;
	if ( 'undef' eq $condition ) { $sql = "DELETE FROM Grammar" }
	else { $sql = "DELETE FROM Grammar WHERE $condition" }
	my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
	my $res=$sth->execute or $@ = $dbh->errstr;
	$dbh->commit;
	$dbh->disconnect or warn $dbh->errstr;
	return $res;
}

# Preloaded methods go here.

=head2 update_Grammar

UPDATE

=cut

sub update_Grammar {
	my ($set, $condition) = @_;
	my @fields;
	my @values;

	while ($set =~ /\b(\w+)\s*=\s*['"](.*?)['"]/g) { push @fields,$1; push @values,$2 }
	if ( scalar(@fields) != scalar(@values) ) { $@ = "Invalid assignment in the set statement!"; return undef }
	my $i = 0;
	my $fgn;
	my $dbh = DBI->connect("dbi:SQLite:dbname=/Applications/MAMP/cgi-bin/Projecto/XAGra/Data/xagra.db","Hugo","Xagra", { RaiseError => 1, AutoCommit => 0, unicode => 1 }) or die $DBI::errstr;

	foreach ( @fields ) {
		switch ( $db->{Grammar}->{'fields'}->{$_}->{'type'} ) {
			case /\bvarchar\b/i {
				if ( uc($db->{Grammar}->{'fields'}->{$_}->{'size'}) ne 'NULL' && length($values[$i]) > $db->{Grammar}->{'fields'}->{$_}->{'size'} ) {
					$dbh->disconnect or warn $dbh->errstr;
					$@ = "Varchar too large, $_ field can only have $db->{Grammar}->{'fields'}->{$_}->{'size'} characters!";
					return undef
				}
			}
			case /\binteger\b/i { if ( $values[$i] !~ /^\d+$/ ) { $dbh->disconnect or warn $dbh->errstr; $@ = "Invalid type found, $_ field is of type INTEGER!"; return undef } }
			case /\breal\b/i { if ( $values[$i] !~ /^\d+(\.\d+)?$/ ) { $dbh->disconnect or warn $dbh->errstr; $@ = "Invalid type found, $_ field is of type REAL!"; return undef } }
			else {}
		}
		OPT: foreach my $opt ( @{$db->{Grammar}->{'fields'}->{$_}->{'options'}} ) {
			switch ($opt) {
				case /\beditable\b/i       { $dbh->disconnect or warn $dbh->errstr; $@ = "$_ is not an editable field!"; return undef }
				case /\bvisible\b/i        { next }
				case /\bnull\b/i           { next }
				case /\bmasked\b/i         { next }
				case /\bauto_increment\b/i {
					my $sql = "SELECT $_ FROM Grammar WHERE $_='$values[$i]'";
					my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
					$sth->execute or $@ = $dbh->errstr;
					my $rv = $sth->fetchall_hashref($_);
					if ( exists $rv->{$values[$i]} ) {
						$dbh->disconnect or warn $dbh->errstr;
						$@ = "$_ is an Auto increment field, $values[$i] value already found on the Grammar table!";
						return undef
					}
					else { next }
				}
				case /\boptional\b/i       {
					if ( uc($values[$i]) eq 'NULL' ) { $dbh->disconnect or warn $dbh->errstr; $@ = "$_ cannot be a null value!"; return undef }
					else { next }
				}
				case /\bunique\b/i         {
					my $sql = "SELECT $_ FROM Grammar WHERE $_='$values[$i]'";
					my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
					$sth->execute or $@ = $dbh->errstr;
					my $rv = $sth->fetchall_hashref($_);
					if ( exists $rv->{$values[$i]} ) {
						$dbh->disconnect or warn $dbh->errstr;
						$@ = "$_ must have an Unique value, $values[$i] value already found on the Grammar table!";
						return undef
					}
					else { next }
				}
				else { next }
			}
		}
		if ( exists $db->{Grammar}->{'fgnkeys'}->{$_} && exists $db->{Grammar}->{'primkeys'}->{$_} ) {}
		elsif ( exists $db->{Grammar}->{'fgnkeys'}->{$_} ) {
			my $sql = "SELECT $_ FROM Grammar WHERE $condition";
			my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
			$sth->execute or $@ = $dbh->errstr;
			my $rv = $sth->fetchall_hashref($_);
			foreach my $key ( keys %{$rv} ) {
				$sql = "SELECT $_ FROM $db->{Grammar}->{'fgnkeys'}->{$_} WHERE $_='$key'";
				$sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
				$sth->execute or $@ = $dbh->errstr;
				$rv = $sth->fetchall_hashref($_);
				if ( !exists $rv->{$values[$i]} ) {
					$dbh->disconnect or warn $dbh->errstr;
					$@ = "Foreign key $_ cannot be updated because '$values[$i]' key does not exist on the $db->{Grammar}->{'fgnkeys'}->{$_} table!";
					return undef
				}
				else { next }
			}
		}
		if ( exists $db->{Grammar}->{'fgnkeys'}->{$_} && exists $db->{Grammar}->{'primkeys'}->{$_} ) {}
		elsif ( exists $db->{Grammar}->{'primkeys'}->{$_} ) {
			my $sql = "SELECT $_ FROM Grammar WHERE $_='$values[$i]'";
			my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
			$sth->execute or $@ = $dbh->errstr;
			my $rv = $sth->fetchall_hashref($_);
			if ( exists $rv->{$values[$i]} ) {
				$dbh->disconnect or warn $dbh->errstr;
				$@ = "Primary key $_ cannot be updated because '$values[$i]' key already exists on the Grammar table!";
				return undef
			}
			else {
				foreach my $tb ( keys %{$db} ) {
					if ( exists $db->{$tb}->{'fgnkeys'}->{$_} ) {
						$fgn->{$_} = {
							value => $values[$i],
							table => $tb
						};
					}
				}
			}
		}
		$i++;
	}
	foreach ( keys %{$fgn} ) {
		my $sql = "SELECT $_ FROM Grammar WHERE $condition";
		my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
		$sth->execute or $@ = $dbh->errstr;
		my $rv = $sth->fetchall_hashref($_);
		foreach my $key ( keys %{$rv} ) {
			$sql = "UPDATE $fgn->{$_}->{'table'} SET $_=? WHERE $_='$key'";
			$sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
			$sth->execute($fgn->{$_}->{'value'}) or $@ = $dbh->errstr;
		}
		$dbh->commit
	}
	my $sql = "UPDATE Grammar SET $set WHERE $condition";
	my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
	my $res=$sth->execute or $@ = $dbh->errstr;
	$dbh->commit;
	$dbh->disconnect or warn $dbh->errstr;
	return $res;
}

# Preloaded methods go here.

=head2 select_Symbol_Grammar

SELECT

=cut

sub select_Symbol_Grammar {
	my ($condition, @fields) = @_;

	my $dbh = DBI->connect("dbi:SQLite:dbname=/Applications/MAMP/cgi-bin/Projecto/XAGra/Data/xagra.db","Hugo","Xagra",{ RaiseError => 1, AutoCommit => 0, unicode => 1 }) or die $DBI::errstr;
	foreach (@fields) {
		if ( !exists $db->{Symbol_Grammar}->{'fields'}->{$_} ) {
			$dbh->disconnect or warn $dbh->errstr;
			$@ = "Unknown field '$_' found while selecting data from Symbol_Grammar table!";
			return undef
		}
		else { next }
	}
	my $sql;
	if ( 'undef' eq $condition ) { $sql = 'SELECT '.(join ',',@fields)." FROM Symbol_Grammar" }
	else { $sql = 'SELECT '.(join ',',@fields)." FROM Symbol_Grammar WHERE $condition" }

	my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
	$sth->execute or $@ = $dbh->errstr;
	my $rv = $sth->fetchall_hashref($fields[0]);
	$dbh->disconnect or warn $dbh->errstr;
	return $rv;
}

# Preloaded methods go here.

=head2 insert_Symbol_Grammar

INSERT

=cut

sub insert_Symbol_Grammar {
	my @fields = @_;
	my @tfield = keys %{$db->{Symbol_Grammar}->{'fields'}};
	my $diff = scalar(@tfield) - scalar(@fields);

	if ( $diff < 0 ) { $@ = "Invalid number of fields submitted!"; return undef }
	my $i = 0;
	my @newfld;
	my $dbh = DBI->connect("dbi:SQLite:dbname=/Applications/MAMP/cgi-bin/Projecto/XAGra/Data/xagra.db","Hugo","Xagra",{ RaiseError => 1, AutoCommit => 0, unicode => 1 }) or die $DBI::errstr;
	foreach ( @tfield ) {
		my $miss=0;
		switch ( $db->{Symbol_Grammar}->{'fields'}->{$_}->{'type'} ) {
			case /\bvarchar\b/i {
				if ( uc($db->{Symbol_Grammar}->{'fields'}->{$_}->{'size'}) ne 'NULL' && length($fields[$i]) > $db->{Symbol_Grammar}->{'fields'}->{$_}->{'size'} ) {
					$dbh->disconnect or warn $dbh->errstr;
					$@ = "Varchar too large, $_ field can only have $db->{Symbol_Grammar}->{'fields'}->{$_}->{'size'} characters!";
					return undef
				}
			}
			case /\binteger\b/i { if ( $fields[$i] !~ /^\d+$/ ) { $dbh->disconnect or warn $dbh->errstr; $@ = "Invalid type found, $_ field is of type INTEGER!"; return undef } }
			case /\breal\b/i { if ( $fields[$i] !~ /^\d+(\.\d+)?$/ ) { $dbh->disconnect or warn $dbh->errstr; $@ = "Invalid type found, $_ field is of type REAL!"; return undef } }
			else {}
		}
		OPT: foreach my $opt ( @{$db->{Symbol_Grammar}->{'fields'}->{$_}->{'options'}} ) {
			switch ($opt) {
				case /\beditable\b/i       { next }
				case /\bvisible\b/i        { next }
				case /\bnull\b/i           { next }
				case /\bmasked\b/i         { next }
				case /\bauto_increment\b/i {
					if ( 0 == $diff ) {
						my $sql = "SELECT $_ FROM Symbol_Grammar WHERE $_='$fields[$i]'";
						my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
						$sth->execute or $@ = $dbh->errstr;
						my $rv = $sth->fetchall_hashref($_);
						if ( exists $rv->{$fields[$i]} ) {
							$dbh->disconnect or warn $dbh->errstr;
							$@ = "$_ is an Auto increment field, $fields[$i] value already found on the Symbol_Grammar table!";
							return undef
						}
						else { next }
					}
					else { $miss=1; last OPT }
				}
				case /\boptional\b/i       {
					if ( uc($fields[$i]) eq 'NULL' ) { $dbh->disconnect or warn $dbh->errstr; $@ = "$_ cannot be a null value!"; return undef }
					else { next }
				}
				case /\bunique\b/i         {
					my $sql = "SELECT $_ FROM Symbol_Grammar WHERE $_='$fields[$i]'";
					my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
					$sth->execute or $@ = $dbh->errstr;
					my $rv = $sth->fetchall_hashref($_);
					if ( exists $rv->{$fields[$i]} ) {
						$dbh->disconnect or warn $dbh->errstr;
						$@ = "$_ must have an Unique value, $fields[$i] value already found on the Symbol_Grammar table!";
						return undef
					}
					else { next }
				}
				else { next }
			}
		}
		if ( 1 == $miss ) { $diff-- }
		else {
			if ( exists $db->{Symbol_Grammar}->{'fgnkeys'}->{$_} && exists $db->{Symbol_Grammar}->{'primkeys'}->{$_} ) {}
			elsif ( exists $db->{Symbol_Grammar}->{'fgnkeys'}->{$_} ) {
				my $sql = "SELECT $_ FROM $db->{Symbol_Grammar}->{'fgnkeys'}->{$_} WHERE $_='$fields[$i]'";
				my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
				$sth->execute or $@ = $dbh->errstr;
				my $rv = $sth->fetchall_hashref($_);
				if ( !exists $rv->{$fields[$i]} ) {
					$dbh->disconnect or warn $dbh->errstr;
					$@ = "Foreign key $_ cannot be added because '$fields[$i]' key does not exist on the $db->{Symbol_Grammar}->{'fgnkeys'}->{$_} table!";
					return undef
				}
			}
			if ( exists $db->{Symbol_Grammar}->{'fgnkeys'}->{$_} && exists $db->{Symbol_Grammar}->{'primkeys'}->{$_} ) {}
			elsif ( exists $db->{Symbol_Grammar}->{'primkeys'}->{$_} ) {
				my $sql = "SELECT $_ FROM Symbol_Grammar WHERE $_='$fields[$i]'";
				my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
				$sth->execute or $@ = $dbh->errstr;
				my $rv = $sth->fetchall_hashref($_);
				if ( exists $rv->{$fields[$i]} ) {
					$dbh->disconnect or warn $dbh->errstr;
					$@ = "Primary key $_ cannot be added because '$fields[$i]' key already exists on the Symbol_Grammar table!";
					return undef
				}
			}
			$i++;
			push @newfld, $_
		}
	}
	if ( $diff != 0 ) { $dbh->disconnect or warn $dbh->errstr; $@ = "Invalid number of fields submitted!"; return undef }
	my $sql = 'INSERT INTO Symbol_Grammar('.(join ',',@newfld).') VALUES ('.(join ',',split / /, '? ' x scalar(@fields)).')';
	my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
	my $res=$sth->execute(@fields) or $@ = $dbh->errstr;
	$dbh->commit;
	$dbh->disconnect or warn $dbh->errstr;
	return $res;
}

# Preloaded methods go here.

=head2 delete_Symbol_Grammar

DELETE

=cut

sub delete_Symbol_Grammar {
	my $condition = shift;
	my $i=1;
	my $dbh = DBI->connect("dbi:SQLite:dbname=/Applications/MAMP/cgi-bin/Projecto/XAGra/Data/xagra.db","Hugo","Xagra",{ RaiseError => 1, AutoCommit => 0, unicode => 1 }) or die $DBI::errstr;

	foreach ( keys %{$db->{Symbol_Grammar}->{'primkeys'}} ) {
		foreach my $tb ( keys %{$db} ) {
			if ( exists $db->{$tb}->{'fgnkeys'}->{$_} ) {
				my $notnull = 0;
				foreach my $opt ( @{$db->{$tb}->{'fields'}->{$_}->{'options'}} ) {
					if ( $opt =~ /\boptional\b/i ) { $notnull = 1; last }
					else { next }
				}
				unless ( 1 == $notnull ) {
					my $sql;
					if ( 'undef' eq $condition ) { $sql = "SELECT $_ FROM Symbol_Grammar" }
					else { $sql = "SELECT $_ FROM Symbol_Grammar WHERE $condition" }
					my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
					$sth->execute or $@ = $dbh->errstr;
					my $rv = $sth->fetchall_hashref($_);
					foreach my $key ( keys %{$rv} ) {
						my $sql = "UPDATE $tb SET $_=? WHERE $_='$key'";
						my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
						my $str = 'NULL'.$i++;
						$sth->execute($str) or $@ = $dbh->errstr;
					}
					$dbh->commit
				}
			}
		}
	}
	my $sql;
	if ( 'undef' eq $condition ) { $sql = "DELETE FROM Symbol_Grammar" }
	else { $sql = "DELETE FROM Symbol_Grammar WHERE $condition" }
	my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
	my $res=$sth->execute or $@ = $dbh->errstr;
	$dbh->commit;
	$dbh->disconnect or warn $dbh->errstr;
	return $res;
}

# Preloaded methods go here.

=head2 update_Symbol_Grammar

UPDATE

=cut

sub update_Symbol_Grammar {
	my ($set, $condition) = @_;
	my @fields;
	my @values;

	while ($set =~ /\b(\w+)\s*=\s*['"](.*?)['"]/g) { push @fields,$1; push @values,$2 }
	if ( scalar(@fields) != scalar(@values) ) { $@ = "Invalid assignment in the set statement!"; return undef }
	my $i = 0;
	my $fgn;
	my $dbh = DBI->connect("dbi:SQLite:dbname=/Applications/MAMP/cgi-bin/Projecto/XAGra/Data/xagra.db","Hugo","Xagra", { RaiseError => 1, AutoCommit => 0, unicode => 1 }) or die $DBI::errstr;

	foreach ( @fields ) {
		switch ( $db->{Symbol_Grammar}->{'fields'}->{$_}->{'type'} ) {
			case /\bvarchar\b/i {
				if ( uc($db->{Symbol_Grammar}->{'fields'}->{$_}->{'size'}) ne 'NULL' && length($values[$i]) > $db->{Symbol_Grammar}->{'fields'}->{$_}->{'size'} ) {
					$dbh->disconnect or warn $dbh->errstr;
					$@ = "Varchar too large, $_ field can only have $db->{Symbol_Grammar}->{'fields'}->{$_}->{'size'} characters!";
					return undef
				}
			}
			case /\binteger\b/i { if ( $values[$i] !~ /^\d+$/ ) { $dbh->disconnect or warn $dbh->errstr; $@ = "Invalid type found, $_ field is of type INTEGER!"; return undef } }
			case /\breal\b/i { if ( $values[$i] !~ /^\d+(\.\d+)?$/ ) { $dbh->disconnect or warn $dbh->errstr; $@ = "Invalid type found, $_ field is of type REAL!"; return undef } }
			else {}
		}
		OPT: foreach my $opt ( @{$db->{Symbol_Grammar}->{'fields'}->{$_}->{'options'}} ) {
			switch ($opt) {
				case /\beditable\b/i       { $dbh->disconnect or warn $dbh->errstr; $@ = "$_ is not an editable field!"; return undef }
				case /\bvisible\b/i        { next }
				case /\bnull\b/i           { next }
				case /\bmasked\b/i         { next }
				case /\bauto_increment\b/i {
					my $sql = "SELECT $_ FROM Symbol_Grammar WHERE $_='$values[$i]'";
					my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
					$sth->execute or $@ = $dbh->errstr;
					my $rv = $sth->fetchall_hashref($_);
					if ( exists $rv->{$values[$i]} ) {
						$dbh->disconnect or warn $dbh->errstr;
						$@ = "$_ is an Auto increment field, $values[$i] value already found on the Symbol_Grammar table!";
						return undef
					}
					else { next }
				}
				case /\boptional\b/i       {
					if ( uc($values[$i]) eq 'NULL' ) { $dbh->disconnect or warn $dbh->errstr; $@ = "$_ cannot be a null value!"; return undef }
					else { next }
				}
				case /\bunique\b/i         {
					my $sql = "SELECT $_ FROM Symbol_Grammar WHERE $_='$values[$i]'";
					my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
					$sth->execute or $@ = $dbh->errstr;
					my $rv = $sth->fetchall_hashref($_);
					if ( exists $rv->{$values[$i]} ) {
						$dbh->disconnect or warn $dbh->errstr;
						$@ = "$_ must have an Unique value, $values[$i] value already found on the Symbol_Grammar table!";
						return undef
					}
					else { next }
				}
				else { next }
			}
		}
		if ( exists $db->{Symbol_Grammar}->{'fgnkeys'}->{$_} && exists $db->{Symbol_Grammar}->{'primkeys'}->{$_} ) {}
		elsif ( exists $db->{Symbol_Grammar}->{'fgnkeys'}->{$_} ) {
			my $sql = "SELECT $_ FROM Symbol_Grammar WHERE $condition";
			my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
			$sth->execute or $@ = $dbh->errstr;
			my $rv = $sth->fetchall_hashref($_);
			foreach my $key ( keys %{$rv} ) {
				$sql = "SELECT $_ FROM $db->{Symbol_Grammar}->{'fgnkeys'}->{$_} WHERE $_='$key'";
				$sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
				$sth->execute or $@ = $dbh->errstr;
				$rv = $sth->fetchall_hashref($_);
				if ( !exists $rv->{$values[$i]} ) {
					$dbh->disconnect or warn $dbh->errstr;
					$@ = "Foreign key $_ cannot be updated because '$values[$i]' key does not exist on the $db->{Symbol_Grammar}->{'fgnkeys'}->{$_} table!";
					return undef
				}
				else { next }
			}
		}
		if ( exists $db->{Symbol_Grammar}->{'fgnkeys'}->{$_} && exists $db->{Symbol_Grammar}->{'primkeys'}->{$_} ) {}
		elsif ( exists $db->{Symbol_Grammar}->{'primkeys'}->{$_} ) {
			my $sql = "SELECT $_ FROM Symbol_Grammar WHERE $_='$values[$i]'";
			my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
			$sth->execute or $@ = $dbh->errstr;
			my $rv = $sth->fetchall_hashref($_);
			if ( exists $rv->{$values[$i]} ) {
				$dbh->disconnect or warn $dbh->errstr;
				$@ = "Primary key $_ cannot be updated because '$values[$i]' key already exists on the Symbol_Grammar table!";
				return undef
			}
			else {
				foreach my $tb ( keys %{$db} ) {
					if ( exists $db->{$tb}->{'fgnkeys'}->{$_} ) {
						$fgn->{$_} = {
							value => $values[$i],
							table => $tb
						};
					}
				}
			}
		}
		$i++;
	}
	foreach ( keys %{$fgn} ) {
		my $sql = "SELECT $_ FROM Symbol_Grammar WHERE $condition";
		my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
		$sth->execute or $@ = $dbh->errstr;
		my $rv = $sth->fetchall_hashref($_);
		foreach my $key ( keys %{$rv} ) {
			$sql = "UPDATE $fgn->{$_}->{'table'} SET $_=? WHERE $_='$key'";
			$sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
			$sth->execute($fgn->{$_}->{'value'}) or $@ = $dbh->errstr;
		}
		$dbh->commit
	}
	my $sql = "UPDATE Symbol_Grammar SET $set WHERE $condition";
	my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
	my $res=$sth->execute or $@ = $dbh->errstr;
	$dbh->commit;
	$dbh->disconnect or warn $dbh->errstr;
	return $res;
}

# Preloaded methods go here.

=head2 select_Function_Grammar

SELECT

=cut

sub select_Function_Grammar {
	my ($condition, @fields) = @_;

	my $dbh = DBI->connect("dbi:SQLite:dbname=/Applications/MAMP/cgi-bin/Projecto/XAGra/Data/xagra.db","Hugo","Xagra",{ RaiseError => 1, AutoCommit => 0, unicode => 1 }) or die $DBI::errstr;
	foreach (@fields) {
		if ( !exists $db->{Function_Grammar}->{'fields'}->{$_} ) {
			$dbh->disconnect or warn $dbh->errstr;
			$@ = "Unknown field '$_' found while selecting data from Function_Grammar table!";
			return undef
		}
		else { next }
	}
	my $sql;
	if ( 'undef' eq $condition ) { $sql = 'SELECT '.(join ',',@fields)." FROM Function_Grammar" }
	else { $sql = 'SELECT '.(join ',',@fields)." FROM Function_Grammar WHERE $condition" }

	my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
	$sth->execute or $@ = $dbh->errstr;
	my $rv = $sth->fetchall_hashref($fields[0]);
	$dbh->disconnect or warn $dbh->errstr;
	return $rv;
}

# Preloaded methods go here.

=head2 insert_Function_Grammar

INSERT

=cut

sub insert_Function_Grammar {
	my @fields = @_;
	my @tfield = keys %{$db->{Function_Grammar}->{'fields'}};
	my $diff = scalar(@tfield) - scalar(@fields);

	if ( $diff < 0 ) { $@ = "Invalid number of fields submitted!"; return undef }
	my $i = 0;
	my @newfld;
	my $dbh = DBI->connect("dbi:SQLite:dbname=/Applications/MAMP/cgi-bin/Projecto/XAGra/Data/xagra.db","Hugo","Xagra",{ RaiseError => 1, AutoCommit => 0, unicode => 1 }) or die $DBI::errstr;
	foreach ( @tfield ) {
		my $miss=0;
		switch ( $db->{Function_Grammar}->{'fields'}->{$_}->{'type'} ) {
			case /\bvarchar\b/i {
				if ( uc($db->{Function_Grammar}->{'fields'}->{$_}->{'size'}) ne 'NULL' && length($fields[$i]) > $db->{Function_Grammar}->{'fields'}->{$_}->{'size'} ) {
					$dbh->disconnect or warn $dbh->errstr;
					$@ = "Varchar too large, $_ field can only have $db->{Function_Grammar}->{'fields'}->{$_}->{'size'} characters!";
					return undef
				}
			}
			case /\binteger\b/i { if ( $fields[$i] !~ /^\d+$/ ) { $dbh->disconnect or warn $dbh->errstr; $@ = "Invalid type found, $_ field is of type INTEGER!"; return undef } }
			case /\breal\b/i { if ( $fields[$i] !~ /^\d+(\.\d+)?$/ ) { $dbh->disconnect or warn $dbh->errstr; $@ = "Invalid type found, $_ field is of type REAL!"; return undef } }
			else {}
		}
		OPT: foreach my $opt ( @{$db->{Function_Grammar}->{'fields'}->{$_}->{'options'}} ) {
			switch ($opt) {
				case /\beditable\b/i       { next }
				case /\bvisible\b/i        { next }
				case /\bnull\b/i           { next }
				case /\bmasked\b/i         { next }
				case /\bauto_increment\b/i {
					if ( 0 == $diff ) {
						my $sql = "SELECT $_ FROM Function_Grammar WHERE $_='$fields[$i]'";
						my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
						$sth->execute or $@ = $dbh->errstr;
						my $rv = $sth->fetchall_hashref($_);
						if ( exists $rv->{$fields[$i]} ) {
							$dbh->disconnect or warn $dbh->errstr;
							$@ = "$_ is an Auto increment field, $fields[$i] value already found on the Function_Grammar table!";
							return undef
						}
						else { next }
					}
					else { $miss=1; last OPT }
				}
				case /\boptional\b/i       {
					if ( uc($fields[$i]) eq 'NULL' ) { $dbh->disconnect or warn $dbh->errstr; $@ = "$_ cannot be a null value!"; return undef }
					else { next }
				}
				case /\bunique\b/i         {
					my $sql = "SELECT $_ FROM Function_Grammar WHERE $_='$fields[$i]'";
					my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
					$sth->execute or $@ = $dbh->errstr;
					my $rv = $sth->fetchall_hashref($_);
					if ( exists $rv->{$fields[$i]} ) {
						$dbh->disconnect or warn $dbh->errstr;
						$@ = "$_ must have an Unique value, $fields[$i] value already found on the Function_Grammar table!";
						return undef
					}
					else { next }
				}
				else { next }
			}
		}
		if ( 1 == $miss ) { $diff-- }
		else {
			if ( exists $db->{Function_Grammar}->{'fgnkeys'}->{$_} && exists $db->{Function_Grammar}->{'primkeys'}->{$_} ) {}
			elsif ( exists $db->{Function_Grammar}->{'fgnkeys'}->{$_} ) {
				my $sql = "SELECT $_ FROM $db->{Function_Grammar}->{'fgnkeys'}->{$_} WHERE $_='$fields[$i]'";
				my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
				$sth->execute or $@ = $dbh->errstr;
				my $rv = $sth->fetchall_hashref($_);
				if ( !exists $rv->{$fields[$i]} ) {
					$dbh->disconnect or warn $dbh->errstr;
					$@ = "Foreign key $_ cannot be added because '$fields[$i]' key does not exist on the $db->{Function_Grammar}->{'fgnkeys'}->{$_} table!";
					return undef
				}
			}
			if ( exists $db->{Function_Grammar}->{'fgnkeys'}->{$_} && exists $db->{Function_Grammar}->{'primkeys'}->{$_} ) {}
			elsif ( exists $db->{Function_Grammar}->{'primkeys'}->{$_} ) {
				my $sql = "SELECT $_ FROM Function_Grammar WHERE $_='$fields[$i]'";
				my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
				$sth->execute or $@ = $dbh->errstr;
				my $rv = $sth->fetchall_hashref($_);
				if ( exists $rv->{$fields[$i]} ) {
					$dbh->disconnect or warn $dbh->errstr;
					$@ = "Primary key $_ cannot be added because '$fields[$i]' key already exists on the Function_Grammar table!";
					return undef
				}
			}
			$i++;
			push @newfld, $_
		}
	}
	if ( $diff != 0 ) { $dbh->disconnect or warn $dbh->errstr; $@ = "Invalid number of fields submitted!"; return undef }
	my $sql = 'INSERT INTO Function_Grammar('.(join ',',@newfld).') VALUES ('.(join ',',split / /, '? ' x scalar(@fields)).')';
	my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
	my $res=$sth->execute(@fields) or $@ = $dbh->errstr;
	$dbh->commit;
	$dbh->disconnect or warn $dbh->errstr;
	return $res;
}

# Preloaded methods go here.

=head2 delete_Function_Grammar

DELETE

=cut

sub delete_Function_Grammar {
	my $condition = shift;
	my $i=1;
	my $dbh = DBI->connect("dbi:SQLite:dbname=/Applications/MAMP/cgi-bin/Projecto/XAGra/Data/xagra.db","Hugo","Xagra",{ RaiseError => 1, AutoCommit => 0, unicode => 1 }) or die $DBI::errstr;

	foreach ( keys %{$db->{Function_Grammar}->{'primkeys'}} ) {
		foreach my $tb ( keys %{$db} ) {
			if ( exists $db->{$tb}->{'fgnkeys'}->{$_} ) {
				my $notnull = 0;
				foreach my $opt ( @{$db->{$tb}->{'fields'}->{$_}->{'options'}} ) {
					if ( $opt =~ /\boptional\b/i ) { $notnull = 1; last }
					else { next }
				}
				unless ( 1 == $notnull ) {
					my $sql;
					if ( 'undef' eq $condition ) { $sql = "SELECT $_ FROM Function_Grammar" }
					else { $sql = "SELECT $_ FROM Function_Grammar WHERE $condition" }
					my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
					$sth->execute or $@ = $dbh->errstr;
					my $rv = $sth->fetchall_hashref($_);
					foreach my $key ( keys %{$rv} ) {
						my $sql = "UPDATE $tb SET $_=? WHERE $_='$key'";
						my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
						my $str = 'NULL'.$i++;
						$sth->execute($str) or $@ = $dbh->errstr;
					}
					$dbh->commit
				}
			}
		}
	}
	my $sql;
	if ( 'undef' eq $condition ) { $sql = "DELETE FROM Function_Grammar" }
	else { $sql = "DELETE FROM Function_Grammar WHERE $condition" }
	my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
	my $res=$sth->execute or $@ = $dbh->errstr;
	$dbh->commit;
	$dbh->disconnect or warn $dbh->errstr;
	return $res;
}

# Preloaded methods go here.

=head2 update_Function_Grammar

UPDATE

=cut

sub update_Function_Grammar {
	my ($set, $condition) = @_;
	my @fields;
	my @values;

	while ($set =~ /\b(\w+)\s*=\s*['"](.*?)['"]/g) { push @fields,$1; push @values,$2 }
	if ( scalar(@fields) != scalar(@values) ) { $@ = "Invalid assignment in the set statement!"; return undef }
	my $i = 0;
	my $fgn;
	my $dbh = DBI->connect("dbi:SQLite:dbname=/Applications/MAMP/cgi-bin/Projecto/XAGra/Data/xagra.db","Hugo","Xagra", { RaiseError => 1, AutoCommit => 0, unicode => 1 }) or die $DBI::errstr;

	foreach ( @fields ) {
		switch ( $db->{Function_Grammar}->{'fields'}->{$_}->{'type'} ) {
			case /\bvarchar\b/i {
				if ( uc($db->{Function_Grammar}->{'fields'}->{$_}->{'size'}) ne 'NULL' && length($values[$i]) > $db->{Function_Grammar}->{'fields'}->{$_}->{'size'} ) {
					$dbh->disconnect or warn $dbh->errstr;
					$@ = "Varchar too large, $_ field can only have $db->{Function_Grammar}->{'fields'}->{$_}->{'size'} characters!";
					return undef
				}
			}
			case /\binteger\b/i { if ( $values[$i] !~ /^\d+$/ ) { $dbh->disconnect or warn $dbh->errstr; $@ = "Invalid type found, $_ field is of type INTEGER!"; return undef } }
			case /\breal\b/i { if ( $values[$i] !~ /^\d+(\.\d+)?$/ ) { $dbh->disconnect or warn $dbh->errstr; $@ = "Invalid type found, $_ field is of type REAL!"; return undef } }
			else {}
		}
		OPT: foreach my $opt ( @{$db->{Function_Grammar}->{'fields'}->{$_}->{'options'}} ) {
			switch ($opt) {
				case /\beditable\b/i       { $dbh->disconnect or warn $dbh->errstr; $@ = "$_ is not an editable field!"; return undef }
				case /\bvisible\b/i        { next }
				case /\bnull\b/i           { next }
				case /\bmasked\b/i         { next }
				case /\bauto_increment\b/i {
					my $sql = "SELECT $_ FROM Function_Grammar WHERE $_='$values[$i]'";
					my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
					$sth->execute or $@ = $dbh->errstr;
					my $rv = $sth->fetchall_hashref($_);
					if ( exists $rv->{$values[$i]} ) {
						$dbh->disconnect or warn $dbh->errstr;
						$@ = "$_ is an Auto increment field, $values[$i] value already found on the Function_Grammar table!";
						return undef
					}
					else { next }
				}
				case /\boptional\b/i       {
					if ( uc($values[$i]) eq 'NULL' ) { $dbh->disconnect or warn $dbh->errstr; $@ = "$_ cannot be a null value!"; return undef }
					else { next }
				}
				case /\bunique\b/i         {
					my $sql = "SELECT $_ FROM Function_Grammar WHERE $_='$values[$i]'";
					my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
					$sth->execute or $@ = $dbh->errstr;
					my $rv = $sth->fetchall_hashref($_);
					if ( exists $rv->{$values[$i]} ) {
						$dbh->disconnect or warn $dbh->errstr;
						$@ = "$_ must have an Unique value, $values[$i] value already found on the Function_Grammar table!";
						return undef
					}
					else { next }
				}
				else { next }
			}
		}
		if ( exists $db->{Function_Grammar}->{'fgnkeys'}->{$_} && exists $db->{Function_Grammar}->{'primkeys'}->{$_} ) {}
		elsif ( exists $db->{Function_Grammar}->{'fgnkeys'}->{$_} ) {
			my $sql = "SELECT $_ FROM Function_Grammar WHERE $condition";
			my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
			$sth->execute or $@ = $dbh->errstr;
			my $rv = $sth->fetchall_hashref($_);
			foreach my $key ( keys %{$rv} ) {
				$sql = "SELECT $_ FROM $db->{Function_Grammar}->{'fgnkeys'}->{$_} WHERE $_='$key'";
				$sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
				$sth->execute or $@ = $dbh->errstr;
				$rv = $sth->fetchall_hashref($_);
				if ( !exists $rv->{$values[$i]} ) {
					$dbh->disconnect or warn $dbh->errstr;
					$@ = "Foreign key $_ cannot be updated because '$values[$i]' key does not exist on the $db->{Function_Grammar}->{'fgnkeys'}->{$_} table!";
					return undef
				}
				else { next }
			}
		}
		if ( exists $db->{Function_Grammar}->{'fgnkeys'}->{$_} && exists $db->{Function_Grammar}->{'primkeys'}->{$_} ) {}
		elsif ( exists $db->{Function_Grammar}->{'primkeys'}->{$_} ) {
			my $sql = "SELECT $_ FROM Function_Grammar WHERE $_='$values[$i]'";
			my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
			$sth->execute or $@ = $dbh->errstr;
			my $rv = $sth->fetchall_hashref($_);
			if ( exists $rv->{$values[$i]} ) {
				$dbh->disconnect or warn $dbh->errstr;
				$@ = "Primary key $_ cannot be updated because '$values[$i]' key already exists on the Function_Grammar table!";
				return undef
			}
			else {
				foreach my $tb ( keys %{$db} ) {
					if ( exists $db->{$tb}->{'fgnkeys'}->{$_} ) {
						$fgn->{$_} = {
							value => $values[$i],
							table => $tb
						};
					}
				}
			}
		}
		$i++;
	}
	foreach ( keys %{$fgn} ) {
		my $sql = "SELECT $_ FROM Function_Grammar WHERE $condition";
		my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
		$sth->execute or $@ = $dbh->errstr;
		my $rv = $sth->fetchall_hashref($_);
		foreach my $key ( keys %{$rv} ) {
			$sql = "UPDATE $fgn->{$_}->{'table'} SET $_=? WHERE $_='$key'";
			$sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
			$sth->execute($fgn->{$_}->{'value'}) or $@ = $dbh->errstr;
		}
		$dbh->commit
	}
	my $sql = "UPDATE Function_Grammar SET $set WHERE $condition";
	my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
	my $res=$sth->execute or $@ = $dbh->errstr;
	$dbh->commit;
	$dbh->disconnect or warn $dbh->errstr;
	return $res;
}

# Preloaded methods go here.

=head2 select_Production

SELECT

=cut

sub select_Production {
	my ($condition, @fields) = @_;

	my $dbh = DBI->connect("dbi:SQLite:dbname=/Applications/MAMP/cgi-bin/Projecto/XAGra/Data/xagra.db","Hugo","Xagra",{ RaiseError => 1, AutoCommit => 0, unicode => 1 }) or die $DBI::errstr;
	foreach (@fields) {
		if ( !exists $db->{Production}->{'fields'}->{$_} ) {
			$dbh->disconnect or warn $dbh->errstr;
			$@ = "Unknown field '$_' found while selecting data from Production table!";
			return undef
		}
		else { next }
	}
	my $sql;
	if ( 'undef' eq $condition ) { $sql = 'SELECT '.(join ',',@fields)." FROM Production" }
	else { $sql = 'SELECT '.(join ',',@fields)." FROM Production WHERE $condition" }

	my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
	$sth->execute or $@ = $dbh->errstr;
	my $rv = $sth->fetchall_hashref($fields[0]);
	$dbh->disconnect or warn $dbh->errstr;
	return $rv;
}

# Preloaded methods go here.

=head2 insert_Production

INSERT

=cut

sub insert_Production {
	my @fields = @_;
	my @tfield = keys %{$db->{Production}->{'fields'}};
	my $diff = scalar(@tfield) - scalar(@fields);

	if ( $diff < 0 ) { $@ = "Invalid number of fields submitted!"; return undef }
	my $i = 0;
	my @newfld;
	my $dbh = DBI->connect("dbi:SQLite:dbname=/Applications/MAMP/cgi-bin/Projecto/XAGra/Data/xagra.db","Hugo","Xagra",{ RaiseError => 1, AutoCommit => 0, unicode => 1 }) or die $DBI::errstr;
	foreach ( @tfield ) {
		my $miss=0;
		switch ( $db->{Production}->{'fields'}->{$_}->{'type'} ) {
			case /\bvarchar\b/i {
				if ( uc($db->{Production}->{'fields'}->{$_}->{'size'}) ne 'NULL' && length($fields[$i]) > $db->{Production}->{'fields'}->{$_}->{'size'} ) {
					$dbh->disconnect or warn $dbh->errstr;
					$@ = "Varchar too large, $_ field can only have $db->{Production}->{'fields'}->{$_}->{'size'} characters!";
					return undef
				}
			}
			case /\binteger\b/i { if ( $fields[$i] !~ /^\d+$/ ) { $dbh->disconnect or warn $dbh->errstr; $@ = "Invalid type found, $_ field is of type INTEGER!"; return undef } }
			case /\breal\b/i { if ( $fields[$i] !~ /^\d+(\.\d+)?$/ ) { $dbh->disconnect or warn $dbh->errstr; $@ = "Invalid type found, $_ field is of type REAL!"; return undef } }
			else {}
		}
		OPT: foreach my $opt ( @{$db->{Production}->{'fields'}->{$_}->{'options'}} ) {
			switch ($opt) {
				case /\beditable\b/i       { next }
				case /\bvisible\b/i        { next }
				case /\bnull\b/i           { next }
				case /\bmasked\b/i         { next }
				case /\bauto_increment\b/i {
					if ( 0 == $diff ) {
						my $sql = "SELECT $_ FROM Production WHERE $_='$fields[$i]'";
						my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
						$sth->execute or $@ = $dbh->errstr;
						my $rv = $sth->fetchall_hashref($_);
						if ( exists $rv->{$fields[$i]} ) {
							$dbh->disconnect or warn $dbh->errstr;
							$@ = "$_ is an Auto increment field, $fields[$i] value already found on the Production table!";
							return undef
						}
						else { next }
					}
					else { $miss=1; last OPT }
				}
				case /\boptional\b/i       {
					if ( uc($fields[$i]) eq 'NULL' ) { $dbh->disconnect or warn $dbh->errstr; $@ = "$_ cannot be a null value!"; return undef }
					else { next }
				}
				case /\bunique\b/i         {
					my $sql = "SELECT $_ FROM Production WHERE $_='$fields[$i]'";
					my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
					$sth->execute or $@ = $dbh->errstr;
					my $rv = $sth->fetchall_hashref($_);
					if ( exists $rv->{$fields[$i]} ) {
						$dbh->disconnect or warn $dbh->errstr;
						$@ = "$_ must have an Unique value, $fields[$i] value already found on the Production table!";
						return undef
					}
					else { next }
				}
				else { next }
			}
		}
		if ( 1 == $miss ) { $diff-- }
		else {
			if ( exists $db->{Production}->{'fgnkeys'}->{$_} && exists $db->{Production}->{'primkeys'}->{$_} ) {}
			elsif ( exists $db->{Production}->{'fgnkeys'}->{$_} ) {
				my $sql = "SELECT $_ FROM $db->{Production}->{'fgnkeys'}->{$_} WHERE $_='$fields[$i]'";
				my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
				$sth->execute or $@ = $dbh->errstr;
				my $rv = $sth->fetchall_hashref($_);
				if ( !exists $rv->{$fields[$i]} ) {
					$dbh->disconnect or warn $dbh->errstr;
					$@ = "Foreign key $_ cannot be added because '$fields[$i]' key does not exist on the $db->{Production}->{'fgnkeys'}->{$_} table!";
					return undef
				}
			}
			if ( exists $db->{Production}->{'fgnkeys'}->{$_} && exists $db->{Production}->{'primkeys'}->{$_} ) {}
			elsif ( exists $db->{Production}->{'primkeys'}->{$_} ) {
				my $sql = "SELECT $_ FROM Production WHERE $_='$fields[$i]'";
				my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
				$sth->execute or $@ = $dbh->errstr;
				my $rv = $sth->fetchall_hashref($_);
				if ( exists $rv->{$fields[$i]} ) {
					$dbh->disconnect or warn $dbh->errstr;
					$@ = "Primary key $_ cannot be added because '$fields[$i]' key already exists on the Production table!";
					return undef
				}
			}
			$i++;
			push @newfld, $_
		}
	}
	if ( $diff != 0 ) { $dbh->disconnect or warn $dbh->errstr; $@ = "Invalid number of fields submitted!"; return undef }
	my $sql = 'INSERT INTO Production('.(join ',',@newfld).') VALUES ('.(join ',',split / /, '? ' x scalar(@fields)).')';
	my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
	my $res=$sth->execute(@fields) or $@ = $dbh->errstr;
	$dbh->commit;
	$dbh->disconnect or warn $dbh->errstr;
	return $res;
}

# Preloaded methods go here.

=head2 delete_Production

DELETE

=cut

sub delete_Production {
	my $condition = shift;
	my $i=1;
	my $dbh = DBI->connect("dbi:SQLite:dbname=/Applications/MAMP/cgi-bin/Projecto/XAGra/Data/xagra.db","Hugo","Xagra",{ RaiseError => 1, AutoCommit => 0, unicode => 1 }) or die $DBI::errstr;

	foreach ( keys %{$db->{Production}->{'primkeys'}} ) {
		foreach my $tb ( keys %{$db} ) {
			if ( exists $db->{$tb}->{'fgnkeys'}->{$_} ) {
				my $notnull = 0;
				foreach my $opt ( @{$db->{$tb}->{'fields'}->{$_}->{'options'}} ) {
					if ( $opt =~ /\boptional\b/i ) { $notnull = 1; last }
					else { next }
				}
				unless ( 1 == $notnull ) {
					my $sql;
					if ( 'undef' eq $condition ) { $sql = "SELECT $_ FROM Production" }
					else { $sql = "SELECT $_ FROM Production WHERE $condition" }
					my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
					$sth->execute or $@ = $dbh->errstr;
					my $rv = $sth->fetchall_hashref($_);
					foreach my $key ( keys %{$rv} ) {
						my $sql = "UPDATE $tb SET $_=? WHERE $_='$key'";
						my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
						my $str = 'NULL'.$i++;
						$sth->execute($str) or $@ = $dbh->errstr;
					}
					$dbh->commit
				}
			}
		}
	}
	my $sql;
	if ( 'undef' eq $condition ) { $sql = "DELETE FROM Production" }
	else { $sql = "DELETE FROM Production WHERE $condition" }
	my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
	my $res=$sth->execute or $@ = $dbh->errstr;
	$dbh->commit;
	$dbh->disconnect or warn $dbh->errstr;
	return $res;
}

# Preloaded methods go here.

=head2 update_Production

UPDATE

=cut

sub update_Production {
	my ($set, $condition) = @_;
	my @fields;
	my @values;

	while ($set =~ /\b(\w+)\s*=\s*['"](.*?)['"]/g) { push @fields,$1; push @values,$2 }
	if ( scalar(@fields) != scalar(@values) ) { $@ = "Invalid assignment in the set statement!"; return undef }
	my $i = 0;
	my $fgn;
	my $dbh = DBI->connect("dbi:SQLite:dbname=/Applications/MAMP/cgi-bin/Projecto/XAGra/Data/xagra.db","Hugo","Xagra", { RaiseError => 1, AutoCommit => 0, unicode => 1 }) or die $DBI::errstr;

	foreach ( @fields ) {
		switch ( $db->{Production}->{'fields'}->{$_}->{'type'} ) {
			case /\bvarchar\b/i {
				if ( uc($db->{Production}->{'fields'}->{$_}->{'size'}) ne 'NULL' && length($values[$i]) > $db->{Production}->{'fields'}->{$_}->{'size'} ) {
					$dbh->disconnect or warn $dbh->errstr;
					$@ = "Varchar too large, $_ field can only have $db->{Production}->{'fields'}->{$_}->{'size'} characters!";
					return undef
				}
			}
			case /\binteger\b/i { if ( $values[$i] !~ /^\d+$/ ) { $dbh->disconnect or warn $dbh->errstr; $@ = "Invalid type found, $_ field is of type INTEGER!"; return undef } }
			case /\breal\b/i { if ( $values[$i] !~ /^\d+(\.\d+)?$/ ) { $dbh->disconnect or warn $dbh->errstr; $@ = "Invalid type found, $_ field is of type REAL!"; return undef } }
			else {}
		}
		OPT: foreach my $opt ( @{$db->{Production}->{'fields'}->{$_}->{'options'}} ) {
			switch ($opt) {
				case /\beditable\b/i       { $dbh->disconnect or warn $dbh->errstr; $@ = "$_ is not an editable field!"; return undef }
				case /\bvisible\b/i        { next }
				case /\bnull\b/i           { next }
				case /\bmasked\b/i         { next }
				case /\bauto_increment\b/i {
					my $sql = "SELECT $_ FROM Production WHERE $_='$values[$i]'";
					my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
					$sth->execute or $@ = $dbh->errstr;
					my $rv = $sth->fetchall_hashref($_);
					if ( exists $rv->{$values[$i]} ) {
						$dbh->disconnect or warn $dbh->errstr;
						$@ = "$_ is an Auto increment field, $values[$i] value already found on the Production table!";
						return undef
					}
					else { next }
				}
				case /\boptional\b/i       {
					if ( uc($values[$i]) eq 'NULL' ) { $dbh->disconnect or warn $dbh->errstr; $@ = "$_ cannot be a null value!"; return undef }
					else { next }
				}
				case /\bunique\b/i         {
					my $sql = "SELECT $_ FROM Production WHERE $_='$values[$i]'";
					my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
					$sth->execute or $@ = $dbh->errstr;
					my $rv = $sth->fetchall_hashref($_);
					if ( exists $rv->{$values[$i]} ) {
						$dbh->disconnect or warn $dbh->errstr;
						$@ = "$_ must have an Unique value, $values[$i] value already found on the Production table!";
						return undef
					}
					else { next }
				}
				else { next }
			}
		}
		if ( exists $db->{Production}->{'fgnkeys'}->{$_} && exists $db->{Production}->{'primkeys'}->{$_} ) {}
		elsif ( exists $db->{Production}->{'fgnkeys'}->{$_} ) {
			my $sql = "SELECT $_ FROM Production WHERE $condition";
			my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
			$sth->execute or $@ = $dbh->errstr;
			my $rv = $sth->fetchall_hashref($_);
			foreach my $key ( keys %{$rv} ) {
				$sql = "SELECT $_ FROM $db->{Production}->{'fgnkeys'}->{$_} WHERE $_='$key'";
				$sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
				$sth->execute or $@ = $dbh->errstr;
				$rv = $sth->fetchall_hashref($_);
				if ( !exists $rv->{$values[$i]} ) {
					$dbh->disconnect or warn $dbh->errstr;
					$@ = "Foreign key $_ cannot be updated because '$values[$i]' key does not exist on the $db->{Production}->{'fgnkeys'}->{$_} table!";
					return undef
				}
				else { next }
			}
		}
		if ( exists $db->{Production}->{'fgnkeys'}->{$_} && exists $db->{Production}->{'primkeys'}->{$_} ) {}
		elsif ( exists $db->{Production}->{'primkeys'}->{$_} ) {
			my $sql = "SELECT $_ FROM Production WHERE $_='$values[$i]'";
			my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
			$sth->execute or $@ = $dbh->errstr;
			my $rv = $sth->fetchall_hashref($_);
			if ( exists $rv->{$values[$i]} ) {
				$dbh->disconnect or warn $dbh->errstr;
				$@ = "Primary key $_ cannot be updated because '$values[$i]' key already exists on the Production table!";
				return undef
			}
			else {
				foreach my $tb ( keys %{$db} ) {
					if ( exists $db->{$tb}->{'fgnkeys'}->{$_} ) {
						$fgn->{$_} = {
							value => $values[$i],
							table => $tb
						};
					}
				}
			}
		}
		$i++;
	}
	foreach ( keys %{$fgn} ) {
		my $sql = "SELECT $_ FROM Production WHERE $condition";
		my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
		$sth->execute or $@ = $dbh->errstr;
		my $rv = $sth->fetchall_hashref($_);
		foreach my $key ( keys %{$rv} ) {
			$sql = "UPDATE $fgn->{$_}->{'table'} SET $_=? WHERE $_='$key'";
			$sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
			$sth->execute($fgn->{$_}->{'value'}) or $@ = $dbh->errstr;
		}
		$dbh->commit
	}
	my $sql = "UPDATE Production SET $set WHERE $condition";
	my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
	my $res=$sth->execute or $@ = $dbh->errstr;
	$dbh->commit;
	$dbh->disconnect or warn $dbh->errstr;
	return $res;
}

# Preloaded methods go here.

=head2 select_Attribute_Grammar

SELECT

=cut

sub select_Attribute_Grammar {
	my ($condition, @fields) = @_;

	my $dbh = DBI->connect("dbi:SQLite:dbname=/Applications/MAMP/cgi-bin/Projecto/XAGra/Data/xagra.db","Hugo","Xagra",{ RaiseError => 1, AutoCommit => 0, unicode => 1 }) or die $DBI::errstr;
	foreach (@fields) {
		if ( !exists $db->{Attribute_Grammar}->{'fields'}->{$_} ) {
			$dbh->disconnect or warn $dbh->errstr;
			$@ = "Unknown field '$_' found while selecting data from Attribute_Grammar table!";
			return undef
		}
		else { next }
	}
	my $sql;
	if ( 'undef' eq $condition ) { $sql = 'SELECT '.(join ',',@fields)." FROM Attribute_Grammar" }
	else { $sql = 'SELECT '.(join ',',@fields)." FROM Attribute_Grammar WHERE $condition" }

	my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
	$sth->execute or $@ = $dbh->errstr;
	my $rv = $sth->fetchall_hashref($fields[0]);
	$dbh->disconnect or warn $dbh->errstr;
	return $rv;
}

# Preloaded methods go here.

=head2 insert_Attribute_Grammar

INSERT

=cut

sub insert_Attribute_Grammar {
	my @fields = @_;
	my @tfield = keys %{$db->{Attribute_Grammar}->{'fields'}};
	my $diff = scalar(@tfield) - scalar(@fields);

	if ( $diff < 0 ) { $@ = "Invalid number of fields submitted!"; return undef }
	my $i = 0;
	my @newfld;
	my $dbh = DBI->connect("dbi:SQLite:dbname=/Applications/MAMP/cgi-bin/Projecto/XAGra/Data/xagra.db","Hugo","Xagra",{ RaiseError => 1, AutoCommit => 0, unicode => 1 }) or die $DBI::errstr;
	foreach ( @tfield ) {
		my $miss=0;
		switch ( $db->{Attribute_Grammar}->{'fields'}->{$_}->{'type'} ) {
			case /\bvarchar\b/i {
				if ( uc($db->{Attribute_Grammar}->{'fields'}->{$_}->{'size'}) ne 'NULL' && length($fields[$i]) > $db->{Attribute_Grammar}->{'fields'}->{$_}->{'size'} ) {
					$dbh->disconnect or warn $dbh->errstr;
					$@ = "Varchar too large, $_ field can only have $db->{Attribute_Grammar}->{'fields'}->{$_}->{'size'} characters!";
					return undef
				}
			}
			case /\binteger\b/i { if ( $fields[$i] !~ /^\d+$/ ) { $dbh->disconnect or warn $dbh->errstr; $@ = "Invalid type found, $_ field is of type INTEGER!"; return undef } }
			case /\breal\b/i { if ( $fields[$i] !~ /^\d+(\.\d+)?$/ ) { $dbh->disconnect or warn $dbh->errstr; $@ = "Invalid type found, $_ field is of type REAL!"; return undef } }
			else {}
		}
		OPT: foreach my $opt ( @{$db->{Attribute_Grammar}->{'fields'}->{$_}->{'options'}} ) {
			switch ($opt) {
				case /\beditable\b/i       { next }
				case /\bvisible\b/i        { next }
				case /\bnull\b/i           { next }
				case /\bmasked\b/i         { next }
				case /\bauto_increment\b/i {
					if ( 0 == $diff ) {
						my $sql = "SELECT $_ FROM Attribute_Grammar WHERE $_='$fields[$i]'";
						my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
						$sth->execute or $@ = $dbh->errstr;
						my $rv = $sth->fetchall_hashref($_);
						if ( exists $rv->{$fields[$i]} ) {
							$dbh->disconnect or warn $dbh->errstr;
							$@ = "$_ is an Auto increment field, $fields[$i] value already found on the Attribute_Grammar table!";
							return undef
						}
						else { next }
					}
					else { $miss=1; last OPT }
				}
				case /\boptional\b/i       {
					if ( uc($fields[$i]) eq 'NULL' ) { $dbh->disconnect or warn $dbh->errstr; $@ = "$_ cannot be a null value!"; return undef }
					else { next }
				}
				case /\bunique\b/i         {
					my $sql = "SELECT $_ FROM Attribute_Grammar WHERE $_='$fields[$i]'";
					my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
					$sth->execute or $@ = $dbh->errstr;
					my $rv = $sth->fetchall_hashref($_);
					if ( exists $rv->{$fields[$i]} ) {
						$dbh->disconnect or warn $dbh->errstr;
						$@ = "$_ must have an Unique value, $fields[$i] value already found on the Attribute_Grammar table!";
						return undef
					}
					else { next }
				}
				else { next }
			}
		}
		if ( 1 == $miss ) { $diff-- }
		else {
			if ( exists $db->{Attribute_Grammar}->{'fgnkeys'}->{$_} && exists $db->{Attribute_Grammar}->{'primkeys'}->{$_} ) {}
			elsif ( exists $db->{Attribute_Grammar}->{'fgnkeys'}->{$_} ) {
				my $sql = "SELECT $_ FROM $db->{Attribute_Grammar}->{'fgnkeys'}->{$_} WHERE $_='$fields[$i]'";
				my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
				$sth->execute or $@ = $dbh->errstr;
				my $rv = $sth->fetchall_hashref($_);
				if ( !exists $rv->{$fields[$i]} ) {
					$dbh->disconnect or warn $dbh->errstr;
					$@ = "Foreign key $_ cannot be added because '$fields[$i]' key does not exist on the $db->{Attribute_Grammar}->{'fgnkeys'}->{$_} table!";
					return undef
				}
			}
			if ( exists $db->{Attribute_Grammar}->{'fgnkeys'}->{$_} && exists $db->{Attribute_Grammar}->{'primkeys'}->{$_} ) {}
			elsif ( exists $db->{Attribute_Grammar}->{'primkeys'}->{$_} ) {
				my $sql = "SELECT $_ FROM Attribute_Grammar WHERE $_='$fields[$i]'";
				my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
				$sth->execute or $@ = $dbh->errstr;
				my $rv = $sth->fetchall_hashref($_);
				if ( exists $rv->{$fields[$i]} ) {
					$dbh->disconnect or warn $dbh->errstr;
					$@ = "Primary key $_ cannot be added because '$fields[$i]' key already exists on the Attribute_Grammar table!";
					return undef
				}
			}
			$i++;
			push @newfld, $_
		}
	}
	if ( $diff != 0 ) { $dbh->disconnect or warn $dbh->errstr; $@ = "Invalid number of fields submitted!"; return undef }
	my $sql = 'INSERT INTO Attribute_Grammar('.(join ',',@newfld).') VALUES ('.(join ',',split / /, '? ' x scalar(@fields)).')';
	my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
	my $res=$sth->execute(@fields) or $@ = $dbh->errstr;
	$dbh->commit;
	$dbh->disconnect or warn $dbh->errstr;
	return $res;
}

# Preloaded methods go here.

=head2 delete_Attribute_Grammar

DELETE

=cut

sub delete_Attribute_Grammar {
	my $condition = shift;
	my $i=1;
	my $dbh = DBI->connect("dbi:SQLite:dbname=/Applications/MAMP/cgi-bin/Projecto/XAGra/Data/xagra.db","Hugo","Xagra",{ RaiseError => 1, AutoCommit => 0, unicode => 1 }) or die $DBI::errstr;

	foreach ( keys %{$db->{Attribute_Grammar}->{'primkeys'}} ) {
		foreach my $tb ( keys %{$db} ) {
			if ( exists $db->{$tb}->{'fgnkeys'}->{$_} ) {
				my $notnull = 0;
				foreach my $opt ( @{$db->{$tb}->{'fields'}->{$_}->{'options'}} ) {
					if ( $opt =~ /\boptional\b/i ) { $notnull = 1; last }
					else { next }
				}
				unless ( 1 == $notnull ) {
					my $sql;
					if ( 'undef' eq $condition ) { $sql = "SELECT $_ FROM Attribute_Grammar" }
					else { $sql = "SELECT $_ FROM Attribute_Grammar WHERE $condition" }
					my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
					$sth->execute or $@ = $dbh->errstr;
					my $rv = $sth->fetchall_hashref($_);
					foreach my $key ( keys %{$rv} ) {
						my $sql = "UPDATE $tb SET $_=? WHERE $_='$key'";
						my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
						my $str = 'NULL'.$i++;
						$sth->execute($str) or $@ = $dbh->errstr;
					}
					$dbh->commit
				}
			}
		}
	}
	my $sql;
	if ( 'undef' eq $condition ) { $sql = "DELETE FROM Attribute_Grammar" }
	else { $sql = "DELETE FROM Attribute_Grammar WHERE $condition" }
	my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
	my $res=$sth->execute or $@ = $dbh->errstr;
	$dbh->commit;
	$dbh->disconnect or warn $dbh->errstr;
	return $res;
}

# Preloaded methods go here.

=head2 update_Attribute_Grammar

UPDATE

=cut

sub update_Attribute_Grammar {
	my ($set, $condition) = @_;
	my @fields;
	my @values;

	while ($set =~ /\b(\w+)\s*=\s*['"](.*?)['"]/g) { push @fields,$1; push @values,$2 }
	if ( scalar(@fields) != scalar(@values) ) { $@ = "Invalid assignment in the set statement!"; return undef }
	my $i = 0;
	my $fgn;
	my $dbh = DBI->connect("dbi:SQLite:dbname=/Applications/MAMP/cgi-bin/Projecto/XAGra/Data/xagra.db","Hugo","Xagra", { RaiseError => 1, AutoCommit => 0, unicode => 1 }) or die $DBI::errstr;

	foreach ( @fields ) {
		switch ( $db->{Attribute_Grammar}->{'fields'}->{$_}->{'type'} ) {
			case /\bvarchar\b/i {
				if ( uc($db->{Attribute_Grammar}->{'fields'}->{$_}->{'size'}) ne 'NULL' && length($values[$i]) > $db->{Attribute_Grammar}->{'fields'}->{$_}->{'size'} ) {
					$dbh->disconnect or warn $dbh->errstr;
					$@ = "Varchar too large, $_ field can only have $db->{Attribute_Grammar}->{'fields'}->{$_}->{'size'} characters!";
					return undef
				}
			}
			case /\binteger\b/i { if ( $values[$i] !~ /^\d+$/ ) { $dbh->disconnect or warn $dbh->errstr; $@ = "Invalid type found, $_ field is of type INTEGER!"; return undef } }
			case /\breal\b/i { if ( $values[$i] !~ /^\d+(\.\d+)?$/ ) { $dbh->disconnect or warn $dbh->errstr; $@ = "Invalid type found, $_ field is of type REAL!"; return undef } }
			else {}
		}
		OPT: foreach my $opt ( @{$db->{Attribute_Grammar}->{'fields'}->{$_}->{'options'}} ) {
			switch ($opt) {
				case /\beditable\b/i       { $dbh->disconnect or warn $dbh->errstr; $@ = "$_ is not an editable field!"; return undef }
				case /\bvisible\b/i        { next }
				case /\bnull\b/i           { next }
				case /\bmasked\b/i         { next }
				case /\bauto_increment\b/i {
					my $sql = "SELECT $_ FROM Attribute_Grammar WHERE $_='$values[$i]'";
					my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
					$sth->execute or $@ = $dbh->errstr;
					my $rv = $sth->fetchall_hashref($_);
					if ( exists $rv->{$values[$i]} ) {
						$dbh->disconnect or warn $dbh->errstr;
						$@ = "$_ is an Auto increment field, $values[$i] value already found on the Attribute_Grammar table!";
						return undef
					}
					else { next }
				}
				case /\boptional\b/i       {
					if ( uc($values[$i]) eq 'NULL' ) { $dbh->disconnect or warn $dbh->errstr; $@ = "$_ cannot be a null value!"; return undef }
					else { next }
				}
				case /\bunique\b/i         {
					my $sql = "SELECT $_ FROM Attribute_Grammar WHERE $_='$values[$i]'";
					my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
					$sth->execute or $@ = $dbh->errstr;
					my $rv = $sth->fetchall_hashref($_);
					if ( exists $rv->{$values[$i]} ) {
						$dbh->disconnect or warn $dbh->errstr;
						$@ = "$_ must have an Unique value, $values[$i] value already found on the Attribute_Grammar table!";
						return undef
					}
					else { next }
				}
				else { next }
			}
		}
		if ( exists $db->{Attribute_Grammar}->{'fgnkeys'}->{$_} && exists $db->{Attribute_Grammar}->{'primkeys'}->{$_} ) {}
		elsif ( exists $db->{Attribute_Grammar}->{'fgnkeys'}->{$_} ) {
			my $sql = "SELECT $_ FROM Attribute_Grammar WHERE $condition";
			my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
			$sth->execute or $@ = $dbh->errstr;
			my $rv = $sth->fetchall_hashref($_);
			foreach my $key ( keys %{$rv} ) {
				$sql = "SELECT $_ FROM $db->{Attribute_Grammar}->{'fgnkeys'}->{$_} WHERE $_='$key'";
				$sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
				$sth->execute or $@ = $dbh->errstr;
				$rv = $sth->fetchall_hashref($_);
				if ( !exists $rv->{$values[$i]} ) {
					$dbh->disconnect or warn $dbh->errstr;
					$@ = "Foreign key $_ cannot be updated because '$values[$i]' key does not exist on the $db->{Attribute_Grammar}->{'fgnkeys'}->{$_} table!";
					return undef
				}
				else { next }
			}
		}
		if ( exists $db->{Attribute_Grammar}->{'fgnkeys'}->{$_} && exists $db->{Attribute_Grammar}->{'primkeys'}->{$_} ) {}
		elsif ( exists $db->{Attribute_Grammar}->{'primkeys'}->{$_} ) {
			my $sql = "SELECT $_ FROM Attribute_Grammar WHERE $_='$values[$i]'";
			my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
			$sth->execute or $@ = $dbh->errstr;
			my $rv = $sth->fetchall_hashref($_);
			if ( exists $rv->{$values[$i]} ) {
				$dbh->disconnect or warn $dbh->errstr;
				$@ = "Primary key $_ cannot be updated because '$values[$i]' key already exists on the Attribute_Grammar table!";
				return undef
			}
			else {
				foreach my $tb ( keys %{$db} ) {
					if ( exists $db->{$tb}->{'fgnkeys'}->{$_} ) {
						$fgn->{$_} = {
							value => $values[$i],
							table => $tb
						};
					}
				}
			}
		}
		$i++;
	}
	foreach ( keys %{$fgn} ) {
		my $sql = "SELECT $_ FROM Attribute_Grammar WHERE $condition";
		my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
		$sth->execute or $@ = $dbh->errstr;
		my $rv = $sth->fetchall_hashref($_);
		foreach my $key ( keys %{$rv} ) {
			$sql = "UPDATE $fgn->{$_}->{'table'} SET $_=? WHERE $_='$key'";
			$sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
			$sth->execute($fgn->{$_}->{'value'}) or $@ = $dbh->errstr;
		}
		$dbh->commit
	}
	my $sql = "UPDATE Attribute_Grammar SET $set WHERE $condition";
	my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
	my $res=$sth->execute or $@ = $dbh->errstr;
	$dbh->commit;
	$dbh->disconnect or warn $dbh->errstr;
	return $res;
}

# Preloaded methods go here.

=head2 select_Attribute

SELECT

=cut

sub select_Attribute {
	my ($condition, @fields) = @_;

	my $dbh = DBI->connect("dbi:SQLite:dbname=/Applications/MAMP/cgi-bin/Projecto/XAGra/Data/xagra.db","Hugo","Xagra",{ RaiseError => 1, AutoCommit => 0, unicode => 1 }) or die $DBI::errstr;
	foreach (@fields) {
		if ( !exists $db->{Attribute}->{'fields'}->{$_} ) {
			$dbh->disconnect or warn $dbh->errstr;
			$@ = "Unknown field '$_' found while selecting data from Attribute table!";
			return undef
		}
		else { next }
	}
	my $sql;
	if ( 'undef' eq $condition ) { $sql = 'SELECT '.(join ',',@fields)." FROM Attribute" }
	else { $sql = 'SELECT '.(join ',',@fields)." FROM Attribute WHERE $condition" }

	my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
	$sth->execute or $@ = $dbh->errstr;
	my $rv = $sth->fetchall_hashref($fields[0]);
	$dbh->disconnect or warn $dbh->errstr;
	return $rv;
}

# Preloaded methods go here.

=head2 insert_Attribute

INSERT

=cut

sub insert_Attribute {
	my @fields = @_;
	my @tfield = keys %{$db->{Attribute}->{'fields'}};
	my $diff = scalar(@tfield) - scalar(@fields);

	if ( $diff < 0 ) { $@ = "Invalid number of fields submitted!"; return undef }
	my $i = 0;
	my @newfld;
	my $dbh = DBI->connect("dbi:SQLite:dbname=/Applications/MAMP/cgi-bin/Projecto/XAGra/Data/xagra.db","Hugo","Xagra",{ RaiseError => 1, AutoCommit => 0, unicode => 1 }) or die $DBI::errstr;
	foreach ( @tfield ) {
		my $miss=0;
		switch ( $db->{Attribute}->{'fields'}->{$_}->{'type'} ) {
			case /\bvarchar\b/i {
				if ( uc($db->{Attribute}->{'fields'}->{$_}->{'size'}) ne 'NULL' && length($fields[$i]) > $db->{Attribute}->{'fields'}->{$_}->{'size'} ) {
					$dbh->disconnect or warn $dbh->errstr;
					$@ = "Varchar too large, $_ field can only have $db->{Attribute}->{'fields'}->{$_}->{'size'} characters!";
					return undef
				}
			}
			case /\binteger\b/i { if ( $fields[$i] !~ /^\d+$/ ) { $dbh->disconnect or warn $dbh->errstr; $@ = "Invalid type found, $_ field is of type INTEGER!"; return undef } }
			case /\breal\b/i { if ( $fields[$i] !~ /^\d+(\.\d+)?$/ ) { $dbh->disconnect or warn $dbh->errstr; $@ = "Invalid type found, $_ field is of type REAL!"; return undef } }
			else {}
		}
		OPT: foreach my $opt ( @{$db->{Attribute}->{'fields'}->{$_}->{'options'}} ) {
			switch ($opt) {
				case /\beditable\b/i       { next }
				case /\bvisible\b/i        { next }
				case /\bnull\b/i           { next }
				case /\bmasked\b/i         { next }
				case /\bauto_increment\b/i {
					if ( 0 == $diff ) {
						my $sql = "SELECT $_ FROM Attribute WHERE $_='$fields[$i]'";
						my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
						$sth->execute or $@ = $dbh->errstr;
						my $rv = $sth->fetchall_hashref($_);
						if ( exists $rv->{$fields[$i]} ) {
							$dbh->disconnect or warn $dbh->errstr;
							$@ = "$_ is an Auto increment field, $fields[$i] value already found on the Attribute table!";
							return undef
						}
						else { next }
					}
					else { $miss=1; last OPT }
				}
				case /\boptional\b/i       {
					if ( uc($fields[$i]) eq 'NULL' ) { $dbh->disconnect or warn $dbh->errstr; $@ = "$_ cannot be a null value!"; return undef }
					else { next }
				}
				case /\bunique\b/i         {
					my $sql = "SELECT $_ FROM Attribute WHERE $_='$fields[$i]'";
					my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
					$sth->execute or $@ = $dbh->errstr;
					my $rv = $sth->fetchall_hashref($_);
					if ( exists $rv->{$fields[$i]} ) {
						$dbh->disconnect or warn $dbh->errstr;
						$@ = "$_ must have an Unique value, $fields[$i] value already found on the Attribute table!";
						return undef
					}
					else { next }
				}
				else { next }
			}
		}
		if ( 1 == $miss ) { $diff-- }
		else {
			if ( exists $db->{Attribute}->{'fgnkeys'}->{$_} && exists $db->{Attribute}->{'primkeys'}->{$_} ) {}
			elsif ( exists $db->{Attribute}->{'fgnkeys'}->{$_} ) {
				my $sql = "SELECT $_ FROM $db->{Attribute}->{'fgnkeys'}->{$_} WHERE $_='$fields[$i]'";
				my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
				$sth->execute or $@ = $dbh->errstr;
				my $rv = $sth->fetchall_hashref($_);
				if ( !exists $rv->{$fields[$i]} ) {
					$dbh->disconnect or warn $dbh->errstr;
					$@ = "Foreign key $_ cannot be added because '$fields[$i]' key does not exist on the $db->{Attribute}->{'fgnkeys'}->{$_} table!";
					return undef
				}
			}
			if ( exists $db->{Attribute}->{'fgnkeys'}->{$_} && exists $db->{Attribute}->{'primkeys'}->{$_} ) {}
			elsif ( exists $db->{Attribute}->{'primkeys'}->{$_} ) {
				my $sql = "SELECT $_ FROM Attribute WHERE $_='$fields[$i]'";
				my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
				$sth->execute or $@ = $dbh->errstr;
				my $rv = $sth->fetchall_hashref($_);
				if ( exists $rv->{$fields[$i]} ) {
					$dbh->disconnect or warn $dbh->errstr;
					$@ = "Primary key $_ cannot be added because '$fields[$i]' key already exists on the Attribute table!";
					return undef
				}
			}
			$i++;
			push @newfld, $_
		}
	}
	if ( $diff != 0 ) { $dbh->disconnect or warn $dbh->errstr; $@ = "Invalid number of fields submitted!"; return undef }
	my $sql = 'INSERT INTO Attribute('.(join ',',@newfld).') VALUES ('.(join ',',split / /, '? ' x scalar(@fields)).')';
	my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
	my $res=$sth->execute(@fields) or $@ = $dbh->errstr;
	$dbh->commit;
	$dbh->disconnect or warn $dbh->errstr;
	return $res;
}

# Preloaded methods go here.

=head2 delete_Attribute

DELETE

=cut

sub delete_Attribute {
	my $condition = shift;
	my $i=1;
	my $dbh = DBI->connect("dbi:SQLite:dbname=/Applications/MAMP/cgi-bin/Projecto/XAGra/Data/xagra.db","Hugo","Xagra",{ RaiseError => 1, AutoCommit => 0, unicode => 1 }) or die $DBI::errstr;

	foreach ( keys %{$db->{Attribute}->{'primkeys'}} ) {
		foreach my $tb ( keys %{$db} ) {
			if ( exists $db->{$tb}->{'fgnkeys'}->{$_} ) {
				my $notnull = 0;
				foreach my $opt ( @{$db->{$tb}->{'fields'}->{$_}->{'options'}} ) {
					if ( $opt =~ /\boptional\b/i ) { $notnull = 1; last }
					else { next }
				}
				unless ( 1 == $notnull ) {
					my $sql;
					if ( 'undef' eq $condition ) { $sql = "SELECT $_ FROM Attribute" }
					else { $sql = "SELECT $_ FROM Attribute WHERE $condition" }
					my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
					$sth->execute or $@ = $dbh->errstr;
					my $rv = $sth->fetchall_hashref($_);
					foreach my $key ( keys %{$rv} ) {
						my $sql = "UPDATE $tb SET $_=? WHERE $_='$key'";
						my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
						my $str = 'NULL'.$i++;
						$sth->execute($str) or $@ = $dbh->errstr;
					}
					$dbh->commit
				}
			}
		}
	}
	my $sql;
	if ( 'undef' eq $condition ) { $sql = "DELETE FROM Attribute" }
	else { $sql = "DELETE FROM Attribute WHERE $condition" }
	my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
	my $res=$sth->execute or $@ = $dbh->errstr;
	$dbh->commit;
	$dbh->disconnect or warn $dbh->errstr;
	return $res;
}

# Preloaded methods go here.

=head2 update_Attribute

UPDATE

=cut

sub update_Attribute {
	my ($set, $condition) = @_;
	my @fields;
	my @values;

	while ($set =~ /\b(\w+)\s*=\s*['"](.*?)['"]/g) { push @fields,$1; push @values,$2 }
	if ( scalar(@fields) != scalar(@values) ) { $@ = "Invalid assignment in the set statement!"; return undef }
	my $i = 0;
	my $fgn;
	my $dbh = DBI->connect("dbi:SQLite:dbname=/Applications/MAMP/cgi-bin/Projecto/XAGra/Data/xagra.db","Hugo","Xagra", { RaiseError => 1, AutoCommit => 0, unicode => 1 }) or die $DBI::errstr;

	foreach ( @fields ) {
		switch ( $db->{Attribute}->{'fields'}->{$_}->{'type'} ) {
			case /\bvarchar\b/i {
				if ( uc($db->{Attribute}->{'fields'}->{$_}->{'size'}) ne 'NULL' && length($values[$i]) > $db->{Attribute}->{'fields'}->{$_}->{'size'} ) {
					$dbh->disconnect or warn $dbh->errstr;
					$@ = "Varchar too large, $_ field can only have $db->{Attribute}->{'fields'}->{$_}->{'size'} characters!";
					return undef
				}
			}
			case /\binteger\b/i { if ( $values[$i] !~ /^\d+$/ ) { $dbh->disconnect or warn $dbh->errstr; $@ = "Invalid type found, $_ field is of type INTEGER!"; return undef } }
			case /\breal\b/i { if ( $values[$i] !~ /^\d+(\.\d+)?$/ ) { $dbh->disconnect or warn $dbh->errstr; $@ = "Invalid type found, $_ field is of type REAL!"; return undef } }
			else {}
		}
		OPT: foreach my $opt ( @{$db->{Attribute}->{'fields'}->{$_}->{'options'}} ) {
			switch ($opt) {
				case /\beditable\b/i       { $dbh->disconnect or warn $dbh->errstr; $@ = "$_ is not an editable field!"; return undef }
				case /\bvisible\b/i        { next }
				case /\bnull\b/i           { next }
				case /\bmasked\b/i         { next }
				case /\bauto_increment\b/i {
					my $sql = "SELECT $_ FROM Attribute WHERE $_='$values[$i]'";
					my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
					$sth->execute or $@ = $dbh->errstr;
					my $rv = $sth->fetchall_hashref($_);
					if ( exists $rv->{$values[$i]} ) {
						$dbh->disconnect or warn $dbh->errstr;
						$@ = "$_ is an Auto increment field, $values[$i] value already found on the Attribute table!";
						return undef
					}
					else { next }
				}
				case /\boptional\b/i       {
					if ( uc($values[$i]) eq 'NULL' ) { $dbh->disconnect or warn $dbh->errstr; $@ = "$_ cannot be a null value!"; return undef }
					else { next }
				}
				case /\bunique\b/i         {
					my $sql = "SELECT $_ FROM Attribute WHERE $_='$values[$i]'";
					my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
					$sth->execute or $@ = $dbh->errstr;
					my $rv = $sth->fetchall_hashref($_);
					if ( exists $rv->{$values[$i]} ) {
						$dbh->disconnect or warn $dbh->errstr;
						$@ = "$_ must have an Unique value, $values[$i] value already found on the Attribute table!";
						return undef
					}
					else { next }
				}
				else { next }
			}
		}
		if ( exists $db->{Attribute}->{'fgnkeys'}->{$_} && exists $db->{Attribute}->{'primkeys'}->{$_} ) {}
		elsif ( exists $db->{Attribute}->{'fgnkeys'}->{$_} ) {
			my $sql = "SELECT $_ FROM Attribute WHERE $condition";
			my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
			$sth->execute or $@ = $dbh->errstr;
			my $rv = $sth->fetchall_hashref($_);
			foreach my $key ( keys %{$rv} ) {
				$sql = "SELECT $_ FROM $db->{Attribute}->{'fgnkeys'}->{$_} WHERE $_='$key'";
				$sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
				$sth->execute or $@ = $dbh->errstr;
				$rv = $sth->fetchall_hashref($_);
				if ( !exists $rv->{$values[$i]} ) {
					$dbh->disconnect or warn $dbh->errstr;
					$@ = "Foreign key $_ cannot be updated because '$values[$i]' key does not exist on the $db->{Attribute}->{'fgnkeys'}->{$_} table!";
					return undef
				}
				else { next }
			}
		}
		if ( exists $db->{Attribute}->{'fgnkeys'}->{$_} && exists $db->{Attribute}->{'primkeys'}->{$_} ) {}
		elsif ( exists $db->{Attribute}->{'primkeys'}->{$_} ) {
			my $sql = "SELECT $_ FROM Attribute WHERE $_='$values[$i]'";
			my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
			$sth->execute or $@ = $dbh->errstr;
			my $rv = $sth->fetchall_hashref($_);
			if ( exists $rv->{$values[$i]} ) {
				$dbh->disconnect or warn $dbh->errstr;
				$@ = "Primary key $_ cannot be updated because '$values[$i]' key already exists on the Attribute table!";
				return undef
			}
			else {
				foreach my $tb ( keys %{$db} ) {
					if ( exists $db->{$tb}->{'fgnkeys'}->{$_} ) {
						$fgn->{$_} = {
							value => $values[$i],
							table => $tb
						};
					}
				}
			}
		}
		$i++;
	}
	foreach ( keys %{$fgn} ) {
		my $sql = "SELECT $_ FROM Attribute WHERE $condition";
		my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
		$sth->execute or $@ = $dbh->errstr;
		my $rv = $sth->fetchall_hashref($_);
		foreach my $key ( keys %{$rv} ) {
			$sql = "UPDATE $fgn->{$_}->{'table'} SET $_=? WHERE $_='$key'";
			$sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
			$sth->execute($fgn->{$_}->{'value'}) or $@ = $dbh->errstr;
		}
		$dbh->commit
	}
	my $sql = "UPDATE Attribute SET $set WHERE $condition";
	my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
	my $res=$sth->execute or $@ = $dbh->errstr;
	$dbh->commit;
	$dbh->disconnect or warn $dbh->errstr;
	return $res;
}

# Preloaded methods go here.

=head2 select_Computation_Production

SELECT

=cut

sub select_Computation_Production {
	my ($condition, @fields) = @_;

	my $dbh = DBI->connect("dbi:SQLite:dbname=/Applications/MAMP/cgi-bin/Projecto/XAGra/Data/xagra.db","Hugo","Xagra",{ RaiseError => 1, AutoCommit => 0, unicode => 1 }) or die $DBI::errstr;
	foreach (@fields) {
		if ( !exists $db->{Computation_Production}->{'fields'}->{$_} ) {
			$dbh->disconnect or warn $dbh->errstr;
			$@ = "Unknown field '$_' found while selecting data from Computation_Production table!";
			return undef
		}
		else { next }
	}
	my $sql;
	if ( 'undef' eq $condition ) { $sql = 'SELECT '.(join ',',@fields)." FROM Computation_Production" }
	else { $sql = 'SELECT '.(join ',',@fields)." FROM Computation_Production WHERE $condition" }

	my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
	$sth->execute or $@ = $dbh->errstr;
	my $rv = $sth->fetchall_hashref($fields[0]);
	$dbh->disconnect or warn $dbh->errstr;
	return $rv;
}

# Preloaded methods go here.

=head2 insert_Computation_Production

INSERT

=cut

sub insert_Computation_Production {
	my @fields = @_;
	my @tfield = keys %{$db->{Computation_Production}->{'fields'}};
	my $diff = scalar(@tfield) - scalar(@fields);

	if ( $diff < 0 ) { $@ = "Invalid number of fields submitted!"; return undef }
	my $i = 0;
	my @newfld;
	my $dbh = DBI->connect("dbi:SQLite:dbname=/Applications/MAMP/cgi-bin/Projecto/XAGra/Data/xagra.db","Hugo","Xagra",{ RaiseError => 1, AutoCommit => 0, unicode => 1 }) or die $DBI::errstr;
	foreach ( @tfield ) {
		my $miss=0;
		switch ( $db->{Computation_Production}->{'fields'}->{$_}->{'type'} ) {
			case /\bvarchar\b/i {
				if ( uc($db->{Computation_Production}->{'fields'}->{$_}->{'size'}) ne 'NULL' && length($fields[$i]) > $db->{Computation_Production}->{'fields'}->{$_}->{'size'} ) {
					$dbh->disconnect or warn $dbh->errstr;
					$@ = "Varchar too large, $_ field can only have $db->{Computation_Production}->{'fields'}->{$_}->{'size'} characters!";
					return undef
				}
			}
			case /\binteger\b/i { if ( $fields[$i] !~ /^\d+$/ ) { $dbh->disconnect or warn $dbh->errstr; $@ = "Invalid type found, $_ field is of type INTEGER!"; return undef } }
			case /\breal\b/i { if ( $fields[$i] !~ /^\d+(\.\d+)?$/ ) { $dbh->disconnect or warn $dbh->errstr; $@ = "Invalid type found, $_ field is of type REAL!"; return undef } }
			else {}
		}
		OPT: foreach my $opt ( @{$db->{Computation_Production}->{'fields'}->{$_}->{'options'}} ) {
			switch ($opt) {
				case /\beditable\b/i       { next }
				case /\bvisible\b/i        { next }
				case /\bnull\b/i           { next }
				case /\bmasked\b/i         { next }
				case /\bauto_increment\b/i {
					if ( 0 == $diff ) {
						my $sql = "SELECT $_ FROM Computation_Production WHERE $_='$fields[$i]'";
						my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
						$sth->execute or $@ = $dbh->errstr;
						my $rv = $sth->fetchall_hashref($_);
						if ( exists $rv->{$fields[$i]} ) {
							$dbh->disconnect or warn $dbh->errstr;
							$@ = "$_ is an Auto increment field, $fields[$i] value already found on the Computation_Production table!";
							return undef
						}
						else { next }
					}
					else { $miss=1; last OPT }
				}
				case /\boptional\b/i       {
					if ( uc($fields[$i]) eq 'NULL' ) { $dbh->disconnect or warn $dbh->errstr; $@ = "$_ cannot be a null value!"; return undef }
					else { next }
				}
				case /\bunique\b/i         {
					my $sql = "SELECT $_ FROM Computation_Production WHERE $_='$fields[$i]'";
					my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
					$sth->execute or $@ = $dbh->errstr;
					my $rv = $sth->fetchall_hashref($_);
					if ( exists $rv->{$fields[$i]} ) {
						$dbh->disconnect or warn $dbh->errstr;
						$@ = "$_ must have an Unique value, $fields[$i] value already found on the Computation_Production table!";
						return undef
					}
					else { next }
				}
				else { next }
			}
		}
		if ( 1 == $miss ) { $diff-- }
		else {
			if ( exists $db->{Computation_Production}->{'fgnkeys'}->{$_} && exists $db->{Computation_Production}->{'primkeys'}->{$_} ) {}
			elsif ( exists $db->{Computation_Production}->{'fgnkeys'}->{$_} ) {
				my $sql = "SELECT $_ FROM $db->{Computation_Production}->{'fgnkeys'}->{$_} WHERE $_='$fields[$i]'";
				my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
				$sth->execute or $@ = $dbh->errstr;
				my $rv = $sth->fetchall_hashref($_);
				if ( !exists $rv->{$fields[$i]} ) {
					$dbh->disconnect or warn $dbh->errstr;
					$@ = "Foreign key $_ cannot be added because '$fields[$i]' key does not exist on the $db->{Computation_Production}->{'fgnkeys'}->{$_} table!";
					return undef
				}
			}
			if ( exists $db->{Computation_Production}->{'fgnkeys'}->{$_} && exists $db->{Computation_Production}->{'primkeys'}->{$_} ) {}
			elsif ( exists $db->{Computation_Production}->{'primkeys'}->{$_} ) {
				my $sql = "SELECT $_ FROM Computation_Production WHERE $_='$fields[$i]'";
				my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
				$sth->execute or $@ = $dbh->errstr;
				my $rv = $sth->fetchall_hashref($_);
				if ( exists $rv->{$fields[$i]} ) {
					$dbh->disconnect or warn $dbh->errstr;
					$@ = "Primary key $_ cannot be added because '$fields[$i]' key already exists on the Computation_Production table!";
					return undef
				}
			}
			$i++;
			push @newfld, $_
		}
	}
	if ( $diff != 0 ) { $dbh->disconnect or warn $dbh->errstr; $@ = "Invalid number of fields submitted!"; return undef }
	my $sql = 'INSERT INTO Computation_Production('.(join ',',@newfld).') VALUES ('.(join ',',split / /, '? ' x scalar(@fields)).')';
	my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
	my $res=$sth->execute(@fields) or $@ = $dbh->errstr;
	$dbh->commit;
	$dbh->disconnect or warn $dbh->errstr;
	return $res;
}

# Preloaded methods go here.

=head2 delete_Computation_Production

DELETE

=cut

sub delete_Computation_Production {
	my $condition = shift;
	my $i=1;
	my $dbh = DBI->connect("dbi:SQLite:dbname=/Applications/MAMP/cgi-bin/Projecto/XAGra/Data/xagra.db","Hugo","Xagra",{ RaiseError => 1, AutoCommit => 0, unicode => 1 }) or die $DBI::errstr;

	foreach ( keys %{$db->{Computation_Production}->{'primkeys'}} ) {
		foreach my $tb ( keys %{$db} ) {
			if ( exists $db->{$tb}->{'fgnkeys'}->{$_} ) {
				my $notnull = 0;
				foreach my $opt ( @{$db->{$tb}->{'fields'}->{$_}->{'options'}} ) {
					if ( $opt =~ /\boptional\b/i ) { $notnull = 1; last }
					else { next }
				}
				unless ( 1 == $notnull ) {
					my $sql;
					if ( 'undef' eq $condition ) { $sql = "SELECT $_ FROM Computation_Production" }
					else { $sql = "SELECT $_ FROM Computation_Production WHERE $condition" }
					my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
					$sth->execute or $@ = $dbh->errstr;
					my $rv = $sth->fetchall_hashref($_);
					foreach my $key ( keys %{$rv} ) {
						my $sql = "UPDATE $tb SET $_=? WHERE $_='$key'";
						my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
						my $str = 'NULL'.$i++;
						$sth->execute($str) or $@ = $dbh->errstr;
					}
					$dbh->commit
				}
			}
		}
	}
	my $sql;
	if ( 'undef' eq $condition ) { $sql = "DELETE FROM Computation_Production" }
	else { $sql = "DELETE FROM Computation_Production WHERE $condition" }
	my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
	my $res=$sth->execute or $@ = $dbh->errstr;
	$dbh->commit;
	$dbh->disconnect or warn $dbh->errstr;
	return $res;
}

# Preloaded methods go here.

=head2 update_Computation_Production

UPDATE

=cut

sub update_Computation_Production {
	my ($set, $condition) = @_;
	my @fields;
	my @values;

	while ($set =~ /\b(\w+)\s*=\s*['"](.*?)['"]/g) { push @fields,$1; push @values,$2 }
	if ( scalar(@fields) != scalar(@values) ) { $@ = "Invalid assignment in the set statement!"; return undef }
	my $i = 0;
	my $fgn;
	my $dbh = DBI->connect("dbi:SQLite:dbname=/Applications/MAMP/cgi-bin/Projecto/XAGra/Data/xagra.db","Hugo","Xagra", { RaiseError => 1, AutoCommit => 0, unicode => 1 }) or die $DBI::errstr;

	foreach ( @fields ) {
		switch ( $db->{Computation_Production}->{'fields'}->{$_}->{'type'} ) {
			case /\bvarchar\b/i {
				if ( uc($db->{Computation_Production}->{'fields'}->{$_}->{'size'}) ne 'NULL' && length($values[$i]) > $db->{Computation_Production}->{'fields'}->{$_}->{'size'} ) {
					$dbh->disconnect or warn $dbh->errstr;
					$@ = "Varchar too large, $_ field can only have $db->{Computation_Production}->{'fields'}->{$_}->{'size'} characters!";
					return undef
				}
			}
			case /\binteger\b/i { if ( $values[$i] !~ /^\d+$/ ) { $dbh->disconnect or warn $dbh->errstr; $@ = "Invalid type found, $_ field is of type INTEGER!"; return undef } }
			case /\breal\b/i { if ( $values[$i] !~ /^\d+(\.\d+)?$/ ) { $dbh->disconnect or warn $dbh->errstr; $@ = "Invalid type found, $_ field is of type REAL!"; return undef } }
			else {}
		}
		OPT: foreach my $opt ( @{$db->{Computation_Production}->{'fields'}->{$_}->{'options'}} ) {
			switch ($opt) {
				case /\beditable\b/i       { $dbh->disconnect or warn $dbh->errstr; $@ = "$_ is not an editable field!"; return undef }
				case /\bvisible\b/i        { next }
				case /\bnull\b/i           { next }
				case /\bmasked\b/i         { next }
				case /\bauto_increment\b/i {
					my $sql = "SELECT $_ FROM Computation_Production WHERE $_='$values[$i]'";
					my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
					$sth->execute or $@ = $dbh->errstr;
					my $rv = $sth->fetchall_hashref($_);
					if ( exists $rv->{$values[$i]} ) {
						$dbh->disconnect or warn $dbh->errstr;
						$@ = "$_ is an Auto increment field, $values[$i] value already found on the Computation_Production table!";
						return undef
					}
					else { next }
				}
				case /\boptional\b/i       {
					if ( uc($values[$i]) eq 'NULL' ) { $dbh->disconnect or warn $dbh->errstr; $@ = "$_ cannot be a null value!"; return undef }
					else { next }
				}
				case /\bunique\b/i         {
					my $sql = "SELECT $_ FROM Computation_Production WHERE $_='$values[$i]'";
					my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
					$sth->execute or $@ = $dbh->errstr;
					my $rv = $sth->fetchall_hashref($_);
					if ( exists $rv->{$values[$i]} ) {
						$dbh->disconnect or warn $dbh->errstr;
						$@ = "$_ must have an Unique value, $values[$i] value already found on the Computation_Production table!";
						return undef
					}
					else { next }
				}
				else { next }
			}
		}
		if ( exists $db->{Computation_Production}->{'fgnkeys'}->{$_} && exists $db->{Computation_Production}->{'primkeys'}->{$_} ) {}
		elsif ( exists $db->{Computation_Production}->{'fgnkeys'}->{$_} ) {
			my $sql = "SELECT $_ FROM Computation_Production WHERE $condition";
			my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
			$sth->execute or $@ = $dbh->errstr;
			my $rv = $sth->fetchall_hashref($_);
			foreach my $key ( keys %{$rv} ) {
				$sql = "SELECT $_ FROM $db->{Computation_Production}->{'fgnkeys'}->{$_} WHERE $_='$key'";
				$sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
				$sth->execute or $@ = $dbh->errstr;
				$rv = $sth->fetchall_hashref($_);
				if ( !exists $rv->{$values[$i]} ) {
					$dbh->disconnect or warn $dbh->errstr;
					$@ = "Foreign key $_ cannot be updated because '$values[$i]' key does not exist on the $db->{Computation_Production}->{'fgnkeys'}->{$_} table!";
					return undef
				}
				else { next }
			}
		}
		if ( exists $db->{Computation_Production}->{'fgnkeys'}->{$_} && exists $db->{Computation_Production}->{'primkeys'}->{$_} ) {}
		elsif ( exists $db->{Computation_Production}->{'primkeys'}->{$_} ) {
			my $sql = "SELECT $_ FROM Computation_Production WHERE $_='$values[$i]'";
			my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
			$sth->execute or $@ = $dbh->errstr;
			my $rv = $sth->fetchall_hashref($_);
			if ( exists $rv->{$values[$i]} ) {
				$dbh->disconnect or warn $dbh->errstr;
				$@ = "Primary key $_ cannot be updated because '$values[$i]' key already exists on the Computation_Production table!";
				return undef
			}
			else {
				foreach my $tb ( keys %{$db} ) {
					if ( exists $db->{$tb}->{'fgnkeys'}->{$_} ) {
						$fgn->{$_} = {
							value => $values[$i],
							table => $tb
						};
					}
				}
			}
		}
		$i++;
	}
	foreach ( keys %{$fgn} ) {
		my $sql = "SELECT $_ FROM Computation_Production WHERE $condition";
		my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
		$sth->execute or $@ = $dbh->errstr;
		my $rv = $sth->fetchall_hashref($_);
		foreach my $key ( keys %{$rv} ) {
			$sql = "UPDATE $fgn->{$_}->{'table'} SET $_=? WHERE $_='$key'";
			$sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
			$sth->execute($fgn->{$_}->{'value'}) or $@ = $dbh->errstr;
		}
		$dbh->commit
	}
	my $sql = "UPDATE Computation_Production SET $set WHERE $condition";
	my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
	my $res=$sth->execute or $@ = $dbh->errstr;
	$dbh->commit;
	$dbh->disconnect or warn $dbh->errstr;
	return $res;
}

# Preloaded methods go here.

=head2 select_Symbol

SELECT

=cut

sub select_Symbol {
	my ($condition, @fields) = @_;

	my $dbh = DBI->connect("dbi:SQLite:dbname=/Applications/MAMP/cgi-bin/Projecto/XAGra/Data/xagra.db","Hugo","Xagra",{ RaiseError => 1, AutoCommit => 0, unicode => 1 }) or die $DBI::errstr;
	foreach (@fields) {
		if ( !exists $db->{Symbol}->{'fields'}->{$_} ) {
			$dbh->disconnect or warn $dbh->errstr;
			$@ = "Unknown field '$_' found while selecting data from Symbol table!";
			return undef
		}
		else { next }
	}
	my $sql;
	if ( 'undef' eq $condition ) { $sql = 'SELECT '.(join ',',@fields)." FROM Symbol" }
	else { $sql = 'SELECT '.(join ',',@fields)." FROM Symbol WHERE $condition" }

	my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
	$sth->execute or $@ = $dbh->errstr;
	my $rv = $sth->fetchall_hashref($fields[0]);
	$dbh->disconnect or warn $dbh->errstr;
	return $rv;
}

# Preloaded methods go here.

=head2 insert_Symbol

INSERT

=cut

sub insert_Symbol {
	my @fields = @_;
	my @tfield = keys %{$db->{Symbol}->{'fields'}};
	my $diff = scalar(@tfield) - scalar(@fields);

	if ( $diff < 0 ) { $@ = "Invalid number of fields submitted!"; return undef }
	my $i = 0;
	my @newfld;
	my $dbh = DBI->connect("dbi:SQLite:dbname=/Applications/MAMP/cgi-bin/Projecto/XAGra/Data/xagra.db","Hugo","Xagra",{ RaiseError => 1, AutoCommit => 0, unicode => 1 }) or die $DBI::errstr;
	foreach ( @tfield ) {
		my $miss=0;
		switch ( $db->{Symbol}->{'fields'}->{$_}->{'type'} ) {
			case /\bvarchar\b/i {
				if ( uc($db->{Symbol}->{'fields'}->{$_}->{'size'}) ne 'NULL' && length($fields[$i]) > $db->{Symbol}->{'fields'}->{$_}->{'size'} ) {
					$dbh->disconnect or warn $dbh->errstr;
					$@ = "Varchar too large, $_ field can only have $db->{Symbol}->{'fields'}->{$_}->{'size'} characters!";
					return undef
				}
			}
			case /\binteger\b/i { if ( $fields[$i] !~ /^\d+$/ ) { $dbh->disconnect or warn $dbh->errstr; $@ = "Invalid type found, $_ field is of type INTEGER!"; return undef } }
			case /\breal\b/i { if ( $fields[$i] !~ /^\d+(\.\d+)?$/ ) { $dbh->disconnect or warn $dbh->errstr; $@ = "Invalid type found, $_ field is of type REAL!"; return undef } }
			else {}
		}
		OPT: foreach my $opt ( @{$db->{Symbol}->{'fields'}->{$_}->{'options'}} ) {
			switch ($opt) {
				case /\beditable\b/i       { next }
				case /\bvisible\b/i        { next }
				case /\bnull\b/i           { next }
				case /\bmasked\b/i         { next }
				case /\bauto_increment\b/i {
					if ( 0 == $diff ) {
						my $sql = "SELECT $_ FROM Symbol WHERE $_='$fields[$i]'";
						my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
						$sth->execute or $@ = $dbh->errstr;
						my $rv = $sth->fetchall_hashref($_);
						if ( exists $rv->{$fields[$i]} ) {
							$dbh->disconnect or warn $dbh->errstr;
							$@ = "$_ is an Auto increment field, $fields[$i] value already found on the Symbol table!";
							return undef
						}
						else { next }
					}
					else { $miss=1; last OPT }
				}
				case /\boptional\b/i       {
					if ( uc($fields[$i]) eq 'NULL' ) { $dbh->disconnect or warn $dbh->errstr; $@ = "$_ cannot be a null value!"; return undef }
					else { next }
				}
				case /\bunique\b/i         {
					my $sql = "SELECT $_ FROM Symbol WHERE $_='$fields[$i]'";
					my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
					$sth->execute or $@ = $dbh->errstr;
					my $rv = $sth->fetchall_hashref($_);
					if ( exists $rv->{$fields[$i]} ) {
						$dbh->disconnect or warn $dbh->errstr;
						$@ = "$_ must have an Unique value, $fields[$i] value already found on the Symbol table!";
						return undef
					}
					else { next }
				}
				else { next }
			}
		}
		if ( 1 == $miss ) { $diff-- }
		else {
			if ( exists $db->{Symbol}->{'fgnkeys'}->{$_} && exists $db->{Symbol}->{'primkeys'}->{$_} ) {}
			elsif ( exists $db->{Symbol}->{'fgnkeys'}->{$_} ) {
				my $sql = "SELECT $_ FROM $db->{Symbol}->{'fgnkeys'}->{$_} WHERE $_='$fields[$i]'";
				my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
				$sth->execute or $@ = $dbh->errstr;
				my $rv = $sth->fetchall_hashref($_);
				if ( !exists $rv->{$fields[$i]} ) {
					$dbh->disconnect or warn $dbh->errstr;
					$@ = "Foreign key $_ cannot be added because '$fields[$i]' key does not exist on the $db->{Symbol}->{'fgnkeys'}->{$_} table!";
					return undef
				}
			}
			if ( exists $db->{Symbol}->{'fgnkeys'}->{$_} && exists $db->{Symbol}->{'primkeys'}->{$_} ) {}
			elsif ( exists $db->{Symbol}->{'primkeys'}->{$_} ) {
				my $sql = "SELECT $_ FROM Symbol WHERE $_='$fields[$i]'";
				my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
				$sth->execute or $@ = $dbh->errstr;
				my $rv = $sth->fetchall_hashref($_);
				if ( exists $rv->{$fields[$i]} ) {
					$dbh->disconnect or warn $dbh->errstr;
					$@ = "Primary key $_ cannot be added because '$fields[$i]' key already exists on the Symbol table!";
					return undef
				}
			}
			$i++;
			push @newfld, $_
		}
	}
	if ( $diff != 0 ) { $dbh->disconnect or warn $dbh->errstr; $@ = "Invalid number of fields submitted!"; return undef }
	my $sql = 'INSERT INTO Symbol('.(join ',',@newfld).') VALUES ('.(join ',',split / /, '? ' x scalar(@fields)).')';
	my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
	my $res=$sth->execute(@fields) or $@ = $dbh->errstr;
	$dbh->commit;
	$dbh->disconnect or warn $dbh->errstr;
	return $res;
}

# Preloaded methods go here.

=head2 delete_Symbol

DELETE

=cut

sub delete_Symbol {
	my $condition = shift;
	my $i=1;
	my $dbh = DBI->connect("dbi:SQLite:dbname=/Applications/MAMP/cgi-bin/Projecto/XAGra/Data/xagra.db","Hugo","Xagra",{ RaiseError => 1, AutoCommit => 0, unicode => 1 }) or die $DBI::errstr;

	foreach ( keys %{$db->{Symbol}->{'primkeys'}} ) {
		foreach my $tb ( keys %{$db} ) {
			if ( exists $db->{$tb}->{'fgnkeys'}->{$_} ) {
				my $notnull = 0;
				foreach my $opt ( @{$db->{$tb}->{'fields'}->{$_}->{'options'}} ) {
					if ( $opt =~ /\boptional\b/i ) { $notnull = 1; last }
					else { next }
				}
				unless ( 1 == $notnull ) {
					my $sql;
					if ( 'undef' eq $condition ) { $sql = "SELECT $_ FROM Symbol" }
					else { $sql = "SELECT $_ FROM Symbol WHERE $condition" }
					my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
					$sth->execute or $@ = $dbh->errstr;
					my $rv = $sth->fetchall_hashref($_);
					foreach my $key ( keys %{$rv} ) {
						my $sql = "UPDATE $tb SET $_=? WHERE $_='$key'";
						my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
						my $str = 'NULL'.$i++;
						$sth->execute($str) or $@ = $dbh->errstr;
					}
					$dbh->commit
				}
			}
		}
	}
	my $sql;
	if ( 'undef' eq $condition ) { $sql = "DELETE FROM Symbol" }
	else { $sql = "DELETE FROM Symbol WHERE $condition" }
	my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
	my $res=$sth->execute or $@ = $dbh->errstr;
	$dbh->commit;
	$dbh->disconnect or warn $dbh->errstr;
	return $res;
}

# Preloaded methods go here.

=head2 update_Symbol

UPDATE

=cut

sub update_Symbol {
	my ($set, $condition) = @_;
	my @fields;
	my @values;

	while ($set =~ /\b(\w+)\s*=\s*['"](.*?)['"]/g) { push @fields,$1; push @values,$2 }
	if ( scalar(@fields) != scalar(@values) ) { $@ = "Invalid assignment in the set statement!"; return undef }
	my $i = 0;
	my $fgn;
	my $dbh = DBI->connect("dbi:SQLite:dbname=/Applications/MAMP/cgi-bin/Projecto/XAGra/Data/xagra.db","Hugo","Xagra", { RaiseError => 1, AutoCommit => 0, unicode => 1 }) or die $DBI::errstr;

	foreach ( @fields ) {
		switch ( $db->{Symbol}->{'fields'}->{$_}->{'type'} ) {
			case /\bvarchar\b/i {
				if ( uc($db->{Symbol}->{'fields'}->{$_}->{'size'}) ne 'NULL' && length($values[$i]) > $db->{Symbol}->{'fields'}->{$_}->{'size'} ) {
					$dbh->disconnect or warn $dbh->errstr;
					$@ = "Varchar too large, $_ field can only have $db->{Symbol}->{'fields'}->{$_}->{'size'} characters!";
					return undef
				}
			}
			case /\binteger\b/i { if ( $values[$i] !~ /^\d+$/ ) { $dbh->disconnect or warn $dbh->errstr; $@ = "Invalid type found, $_ field is of type INTEGER!"; return undef } }
			case /\breal\b/i { if ( $values[$i] !~ /^\d+(\.\d+)?$/ ) { $dbh->disconnect or warn $dbh->errstr; $@ = "Invalid type found, $_ field is of type REAL!"; return undef } }
			else {}
		}
		OPT: foreach my $opt ( @{$db->{Symbol}->{'fields'}->{$_}->{'options'}} ) {
			switch ($opt) {
				case /\beditable\b/i       { $dbh->disconnect or warn $dbh->errstr; $@ = "$_ is not an editable field!"; return undef }
				case /\bvisible\b/i        { next }
				case /\bnull\b/i           { next }
				case /\bmasked\b/i         { next }
				case /\bauto_increment\b/i {
					my $sql = "SELECT $_ FROM Symbol WHERE $_='$values[$i]'";
					my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
					$sth->execute or $@ = $dbh->errstr;
					my $rv = $sth->fetchall_hashref($_);
					if ( exists $rv->{$values[$i]} ) {
						$dbh->disconnect or warn $dbh->errstr;
						$@ = "$_ is an Auto increment field, $values[$i] value already found on the Symbol table!";
						return undef
					}
					else { next }
				}
				case /\boptional\b/i       {
					if ( uc($values[$i]) eq 'NULL' ) { $dbh->disconnect or warn $dbh->errstr; $@ = "$_ cannot be a null value!"; return undef }
					else { next }
				}
				case /\bunique\b/i         {
					my $sql = "SELECT $_ FROM Symbol WHERE $_='$values[$i]'";
					my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
					$sth->execute or $@ = $dbh->errstr;
					my $rv = $sth->fetchall_hashref($_);
					if ( exists $rv->{$values[$i]} ) {
						$dbh->disconnect or warn $dbh->errstr;
						$@ = "$_ must have an Unique value, $values[$i] value already found on the Symbol table!";
						return undef
					}
					else { next }
				}
				else { next }
			}
		}
		if ( exists $db->{Symbol}->{'fgnkeys'}->{$_} && exists $db->{Symbol}->{'primkeys'}->{$_} ) {}
		elsif ( exists $db->{Symbol}->{'fgnkeys'}->{$_} ) {
			my $sql = "SELECT $_ FROM Symbol WHERE $condition";
			my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
			$sth->execute or $@ = $dbh->errstr;
			my $rv = $sth->fetchall_hashref($_);
			foreach my $key ( keys %{$rv} ) {
				$sql = "SELECT $_ FROM $db->{Symbol}->{'fgnkeys'}->{$_} WHERE $_='$key'";
				$sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
				$sth->execute or $@ = $dbh->errstr;
				$rv = $sth->fetchall_hashref($_);
				if ( !exists $rv->{$values[$i]} ) {
					$dbh->disconnect or warn $dbh->errstr;
					$@ = "Foreign key $_ cannot be updated because '$values[$i]' key does not exist on the $db->{Symbol}->{'fgnkeys'}->{$_} table!";
					return undef
				}
				else { next }
			}
		}
		if ( exists $db->{Symbol}->{'fgnkeys'}->{$_} && exists $db->{Symbol}->{'primkeys'}->{$_} ) {}
		elsif ( exists $db->{Symbol}->{'primkeys'}->{$_} ) {
			my $sql = "SELECT $_ FROM Symbol WHERE $_='$values[$i]'";
			my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
			$sth->execute or $@ = $dbh->errstr;
			my $rv = $sth->fetchall_hashref($_);
			if ( exists $rv->{$values[$i]} ) {
				$dbh->disconnect or warn $dbh->errstr;
				$@ = "Primary key $_ cannot be updated because '$values[$i]' key already exists on the Symbol table!";
				return undef
			}
			else {
				foreach my $tb ( keys %{$db} ) {
					if ( exists $db->{$tb}->{'fgnkeys'}->{$_} ) {
						$fgn->{$_} = {
							value => $values[$i],
							table => $tb
						};
					}
				}
			}
		}
		$i++;
	}
	foreach ( keys %{$fgn} ) {
		my $sql = "SELECT $_ FROM Symbol WHERE $condition";
		my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
		$sth->execute or $@ = $dbh->errstr;
		my $rv = $sth->fetchall_hashref($_);
		foreach my $key ( keys %{$rv} ) {
			$sql = "UPDATE $fgn->{$_}->{'table'} SET $_=? WHERE $_='$key'";
			$sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
			$sth->execute($fgn->{$_}->{'value'}) or $@ = $dbh->errstr;
		}
		$dbh->commit
	}
	my $sql = "UPDATE Symbol SET $set WHERE $condition";
	my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
	my $res=$sth->execute or $@ = $dbh->errstr;
	$dbh->commit;
	$dbh->disconnect or warn $dbh->errstr;
	return $res;
}

# Preloaded methods go here.

=head2 select_Production_Grammar

SELECT

=cut

sub select_Production_Grammar {
	my ($condition, @fields) = @_;

	my $dbh = DBI->connect("dbi:SQLite:dbname=/Applications/MAMP/cgi-bin/Projecto/XAGra/Data/xagra.db","Hugo","Xagra",{ RaiseError => 1, AutoCommit => 0, unicode => 1 }) or die $DBI::errstr;
	foreach (@fields) {
		if ( !exists $db->{Production_Grammar}->{'fields'}->{$_} ) {
			$dbh->disconnect or warn $dbh->errstr;
			$@ = "Unknown field '$_' found while selecting data from Production_Grammar table!";
			return undef
		}
		else { next }
	}
	my $sql;
	if ( 'undef' eq $condition ) { $sql = 'SELECT '.(join ',',@fields)." FROM Production_Grammar" }
	else { $sql = 'SELECT '.(join ',',@fields)." FROM Production_Grammar WHERE $condition" }

	my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
	$sth->execute or $@ = $dbh->errstr;
	my $rv = $sth->fetchall_hashref($fields[0]);
	$dbh->disconnect or warn $dbh->errstr;
	return $rv;
}

# Preloaded methods go here.

=head2 insert_Production_Grammar

INSERT

=cut

sub insert_Production_Grammar {
	my @fields = @_;
	my @tfield = keys %{$db->{Production_Grammar}->{'fields'}};
	my $diff = scalar(@tfield) - scalar(@fields);

	if ( $diff < 0 ) { $@ = "Invalid number of fields submitted!"; return undef }
	my $i = 0;
	my @newfld;
	my $dbh = DBI->connect("dbi:SQLite:dbname=/Applications/MAMP/cgi-bin/Projecto/XAGra/Data/xagra.db","Hugo","Xagra",{ RaiseError => 1, AutoCommit => 0, unicode => 1 }) or die $DBI::errstr;
	foreach ( @tfield ) {
		my $miss=0;
		switch ( $db->{Production_Grammar}->{'fields'}->{$_}->{'type'} ) {
			case /\bvarchar\b/i {
				if ( uc($db->{Production_Grammar}->{'fields'}->{$_}->{'size'}) ne 'NULL' && length($fields[$i]) > $db->{Production_Grammar}->{'fields'}->{$_}->{'size'} ) {
					$dbh->disconnect or warn $dbh->errstr;
					$@ = "Varchar too large, $_ field can only have $db->{Production_Grammar}->{'fields'}->{$_}->{'size'} characters!";
					return undef
				}
			}
			case /\binteger\b/i { if ( $fields[$i] !~ /^\d+$/ ) { $dbh->disconnect or warn $dbh->errstr; $@ = "Invalid type found, $_ field is of type INTEGER!"; return undef } }
			case /\breal\b/i { if ( $fields[$i] !~ /^\d+(\.\d+)?$/ ) { $dbh->disconnect or warn $dbh->errstr; $@ = "Invalid type found, $_ field is of type REAL!"; return undef } }
			else {}
		}
		OPT: foreach my $opt ( @{$db->{Production_Grammar}->{'fields'}->{$_}->{'options'}} ) {
			switch ($opt) {
				case /\beditable\b/i       { next }
				case /\bvisible\b/i        { next }
				case /\bnull\b/i           { next }
				case /\bmasked\b/i         { next }
				case /\bauto_increment\b/i {
					if ( 0 == $diff ) {
						my $sql = "SELECT $_ FROM Production_Grammar WHERE $_='$fields[$i]'";
						my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
						$sth->execute or $@ = $dbh->errstr;
						my $rv = $sth->fetchall_hashref($_);
						if ( exists $rv->{$fields[$i]} ) {
							$dbh->disconnect or warn $dbh->errstr;
							$@ = "$_ is an Auto increment field, $fields[$i] value already found on the Production_Grammar table!";
							return undef
						}
						else { next }
					}
					else { $miss=1; last OPT }
				}
				case /\boptional\b/i       {
					if ( uc($fields[$i]) eq 'NULL' ) { $dbh->disconnect or warn $dbh->errstr; $@ = "$_ cannot be a null value!"; return undef }
					else { next }
				}
				case /\bunique\b/i         {
					my $sql = "SELECT $_ FROM Production_Grammar WHERE $_='$fields[$i]'";
					my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
					$sth->execute or $@ = $dbh->errstr;
					my $rv = $sth->fetchall_hashref($_);
					if ( exists $rv->{$fields[$i]} ) {
						$dbh->disconnect or warn $dbh->errstr;
						$@ = "$_ must have an Unique value, $fields[$i] value already found on the Production_Grammar table!";
						return undef
					}
					else { next }
				}
				else { next }
			}
		}
		if ( 1 == $miss ) { $diff-- }
		else {
			if ( exists $db->{Production_Grammar}->{'fgnkeys'}->{$_} && exists $db->{Production_Grammar}->{'primkeys'}->{$_} ) {}
			elsif ( exists $db->{Production_Grammar}->{'fgnkeys'}->{$_} ) {
				my $sql = "SELECT $_ FROM $db->{Production_Grammar}->{'fgnkeys'}->{$_} WHERE $_='$fields[$i]'";
				my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
				$sth->execute or $@ = $dbh->errstr;
				my $rv = $sth->fetchall_hashref($_);
				if ( !exists $rv->{$fields[$i]} ) {
					$dbh->disconnect or warn $dbh->errstr;
					$@ = "Foreign key $_ cannot be added because '$fields[$i]' key does not exist on the $db->{Production_Grammar}->{'fgnkeys'}->{$_} table!";
					return undef
				}
			}
			if ( exists $db->{Production_Grammar}->{'fgnkeys'}->{$_} && exists $db->{Production_Grammar}->{'primkeys'}->{$_} ) {}
			elsif ( exists $db->{Production_Grammar}->{'primkeys'}->{$_} ) {
				my $sql = "SELECT $_ FROM Production_Grammar WHERE $_='$fields[$i]'";
				my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
				$sth->execute or $@ = $dbh->errstr;
				my $rv = $sth->fetchall_hashref($_);
				if ( exists $rv->{$fields[$i]} ) {
					$dbh->disconnect or warn $dbh->errstr;
					$@ = "Primary key $_ cannot be added because '$fields[$i]' key already exists on the Production_Grammar table!";
					return undef
				}
			}
			$i++;
			push @newfld, $_
		}
	}
	if ( $diff != 0 ) { $dbh->disconnect or warn $dbh->errstr; $@ = "Invalid number of fields submitted!"; return undef }
	my $sql = 'INSERT INTO Production_Grammar('.(join ',',@newfld).') VALUES ('.(join ',',split / /, '? ' x scalar(@fields)).')';
	my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
	my $res=$sth->execute(@fields) or $@ = $dbh->errstr;
	$dbh->commit;
	$dbh->disconnect or warn $dbh->errstr;
	return $res;
}

# Preloaded methods go here.

=head2 delete_Production_Grammar

DELETE

=cut

sub delete_Production_Grammar {
	my $condition = shift;
	my $i=1;
	my $dbh = DBI->connect("dbi:SQLite:dbname=/Applications/MAMP/cgi-bin/Projecto/XAGra/Data/xagra.db","Hugo","Xagra",{ RaiseError => 1, AutoCommit => 0, unicode => 1 }) or die $DBI::errstr;

	foreach ( keys %{$db->{Production_Grammar}->{'primkeys'}} ) {
		foreach my $tb ( keys %{$db} ) {
			if ( exists $db->{$tb}->{'fgnkeys'}->{$_} ) {
				my $notnull = 0;
				foreach my $opt ( @{$db->{$tb}->{'fields'}->{$_}->{'options'}} ) {
					if ( $opt =~ /\boptional\b/i ) { $notnull = 1; last }
					else { next }
				}
				unless ( 1 == $notnull ) {
					my $sql;
					if ( 'undef' eq $condition ) { $sql = "SELECT $_ FROM Production_Grammar" }
					else { $sql = "SELECT $_ FROM Production_Grammar WHERE $condition" }
					my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
					$sth->execute or $@ = $dbh->errstr;
					my $rv = $sth->fetchall_hashref($_);
					foreach my $key ( keys %{$rv} ) {
						my $sql = "UPDATE $tb SET $_=? WHERE $_='$key'";
						my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
						my $str = 'NULL'.$i++;
						$sth->execute($str) or $@ = $dbh->errstr;
					}
					$dbh->commit
				}
			}
		}
	}
	my $sql;
	if ( 'undef' eq $condition ) { $sql = "DELETE FROM Production_Grammar" }
	else { $sql = "DELETE FROM Production_Grammar WHERE $condition" }
	my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
	my $res=$sth->execute or $@ = $dbh->errstr;
	$dbh->commit;
	$dbh->disconnect or warn $dbh->errstr;
	return $res;
}

# Preloaded methods go here.

=head2 update_Production_Grammar

UPDATE

=cut

sub update_Production_Grammar {
	my ($set, $condition) = @_;
	my @fields;
	my @values;

	while ($set =~ /\b(\w+)\s*=\s*['"](.*?)['"]/g) { push @fields,$1; push @values,$2 }
	if ( scalar(@fields) != scalar(@values) ) { $@ = "Invalid assignment in the set statement!"; return undef }
	my $i = 0;
	my $fgn;
	my $dbh = DBI->connect("dbi:SQLite:dbname=/Applications/MAMP/cgi-bin/Projecto/XAGra/Data/xagra.db","Hugo","Xagra", { RaiseError => 1, AutoCommit => 0, unicode => 1 }) or die $DBI::errstr;

	foreach ( @fields ) {
		switch ( $db->{Production_Grammar}->{'fields'}->{$_}->{'type'} ) {
			case /\bvarchar\b/i {
				if ( uc($db->{Production_Grammar}->{'fields'}->{$_}->{'size'}) ne 'NULL' && length($values[$i]) > $db->{Production_Grammar}->{'fields'}->{$_}->{'size'} ) {
					$dbh->disconnect or warn $dbh->errstr;
					$@ = "Varchar too large, $_ field can only have $db->{Production_Grammar}->{'fields'}->{$_}->{'size'} characters!";
					return undef
				}
			}
			case /\binteger\b/i { if ( $values[$i] !~ /^\d+$/ ) { $dbh->disconnect or warn $dbh->errstr; $@ = "Invalid type found, $_ field is of type INTEGER!"; return undef } }
			case /\breal\b/i { if ( $values[$i] !~ /^\d+(\.\d+)?$/ ) { $dbh->disconnect or warn $dbh->errstr; $@ = "Invalid type found, $_ field is of type REAL!"; return undef } }
			else {}
		}
		OPT: foreach my $opt ( @{$db->{Production_Grammar}->{'fields'}->{$_}->{'options'}} ) {
			switch ($opt) {
				case /\beditable\b/i       { $dbh->disconnect or warn $dbh->errstr; $@ = "$_ is not an editable field!"; return undef }
				case /\bvisible\b/i        { next }
				case /\bnull\b/i           { next }
				case /\bmasked\b/i         { next }
				case /\bauto_increment\b/i {
					my $sql = "SELECT $_ FROM Production_Grammar WHERE $_='$values[$i]'";
					my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
					$sth->execute or $@ = $dbh->errstr;
					my $rv = $sth->fetchall_hashref($_);
					if ( exists $rv->{$values[$i]} ) {
						$dbh->disconnect or warn $dbh->errstr;
						$@ = "$_ is an Auto increment field, $values[$i] value already found on the Production_Grammar table!";
						return undef
					}
					else { next }
				}
				case /\boptional\b/i       {
					if ( uc($values[$i]) eq 'NULL' ) { $dbh->disconnect or warn $dbh->errstr; $@ = "$_ cannot be a null value!"; return undef }
					else { next }
				}
				case /\bunique\b/i         {
					my $sql = "SELECT $_ FROM Production_Grammar WHERE $_='$values[$i]'";
					my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
					$sth->execute or $@ = $dbh->errstr;
					my $rv = $sth->fetchall_hashref($_);
					if ( exists $rv->{$values[$i]} ) {
						$dbh->disconnect or warn $dbh->errstr;
						$@ = "$_ must have an Unique value, $values[$i] value already found on the Production_Grammar table!";
						return undef
					}
					else { next }
				}
				else { next }
			}
		}
		if ( exists $db->{Production_Grammar}->{'fgnkeys'}->{$_} && exists $db->{Production_Grammar}->{'primkeys'}->{$_} ) {}
		elsif ( exists $db->{Production_Grammar}->{'fgnkeys'}->{$_} ) {
			my $sql = "SELECT $_ FROM Production_Grammar WHERE $condition";
			my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
			$sth->execute or $@ = $dbh->errstr;
			my $rv = $sth->fetchall_hashref($_);
			foreach my $key ( keys %{$rv} ) {
				$sql = "SELECT $_ FROM $db->{Production_Grammar}->{'fgnkeys'}->{$_} WHERE $_='$key'";
				$sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
				$sth->execute or $@ = $dbh->errstr;
				$rv = $sth->fetchall_hashref($_);
				if ( !exists $rv->{$values[$i]} ) {
					$dbh->disconnect or warn $dbh->errstr;
					$@ = "Foreign key $_ cannot be updated because '$values[$i]' key does not exist on the $db->{Production_Grammar}->{'fgnkeys'}->{$_} table!";
					return undef
				}
				else { next }
			}
		}
		if ( exists $db->{Production_Grammar}->{'fgnkeys'}->{$_} && exists $db->{Production_Grammar}->{'primkeys'}->{$_} ) {}
		elsif ( exists $db->{Production_Grammar}->{'primkeys'}->{$_} ) {
			my $sql = "SELECT $_ FROM Production_Grammar WHERE $_='$values[$i]'";
			my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
			$sth->execute or $@ = $dbh->errstr;
			my $rv = $sth->fetchall_hashref($_);
			if ( exists $rv->{$values[$i]} ) {
				$dbh->disconnect or warn $dbh->errstr;
				$@ = "Primary key $_ cannot be updated because '$values[$i]' key already exists on the Production_Grammar table!";
				return undef
			}
			else {
				foreach my $tb ( keys %{$db} ) {
					if ( exists $db->{$tb}->{'fgnkeys'}->{$_} ) {
						$fgn->{$_} = {
							value => $values[$i],
							table => $tb
						};
					}
				}
			}
		}
		$i++;
	}
	foreach ( keys %{$fgn} ) {
		my $sql = "SELECT $_ FROM Production_Grammar WHERE $condition";
		my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
		$sth->execute or $@ = $dbh->errstr;
		my $rv = $sth->fetchall_hashref($_);
		foreach my $key ( keys %{$rv} ) {
			$sql = "UPDATE $fgn->{$_}->{'table'} SET $_=? WHERE $_='$key'";
			$sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
			$sth->execute($fgn->{$_}->{'value'}) or $@ = $dbh->errstr;
		}
		$dbh->commit
	}
	my $sql = "UPDATE Production_Grammar SET $set WHERE $condition";
	my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
	my $res=$sth->execute or $@ = $dbh->errstr;
	$dbh->commit;
	$dbh->disconnect or warn $dbh->errstr;
	return $res;
}

# Preloaded methods go here.

=head2 select_Argument_Computation

SELECT

=cut

sub select_Argument_Computation {
	my ($condition, @fields) = @_;

	my $dbh = DBI->connect("dbi:SQLite:dbname=/Applications/MAMP/cgi-bin/Projecto/XAGra/Data/xagra.db","Hugo","Xagra",{ RaiseError => 1, AutoCommit => 0, unicode => 1 }) or die $DBI::errstr;
	foreach (@fields) {
		if ( !exists $db->{Argument_Computation}->{'fields'}->{$_} ) {
			$dbh->disconnect or warn $dbh->errstr;
			$@ = "Unknown field '$_' found while selecting data from Argument_Computation table!";
			return undef
		}
		else { next }
	}
	my $sql;
	if ( 'undef' eq $condition ) { $sql = 'SELECT '.(join ',',@fields)." FROM Argument_Computation" }
	else { $sql = 'SELECT '.(join ',',@fields)." FROM Argument_Computation WHERE $condition" }

	my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
	$sth->execute or $@ = $dbh->errstr;
	my $rv = $sth->fetchall_hashref($fields[0]);
	$dbh->disconnect or warn $dbh->errstr;
	return $rv;
}

# Preloaded methods go here.

=head2 insert_Argument_Computation

INSERT

=cut

sub insert_Argument_Computation {
	my @fields = @_;
	my @tfield = keys %{$db->{Argument_Computation}->{'fields'}};
	my $diff = scalar(@tfield) - scalar(@fields);

	if ( $diff < 0 ) { $@ = "Invalid number of fields submitted!"; return undef }
	my $i = 0;
	my @newfld;
	my $dbh = DBI->connect("dbi:SQLite:dbname=/Applications/MAMP/cgi-bin/Projecto/XAGra/Data/xagra.db","Hugo","Xagra",{ RaiseError => 1, AutoCommit => 0, unicode => 1 }) or die $DBI::errstr;
	foreach ( @tfield ) {
		my $miss=0;
		switch ( $db->{Argument_Computation}->{'fields'}->{$_}->{'type'} ) {
			case /\bvarchar\b/i {
				if ( uc($db->{Argument_Computation}->{'fields'}->{$_}->{'size'}) ne 'NULL' && length($fields[$i]) > $db->{Argument_Computation}->{'fields'}->{$_}->{'size'} ) {
					$dbh->disconnect or warn $dbh->errstr;
					$@ = "Varchar too large, $_ field can only have $db->{Argument_Computation}->{'fields'}->{$_}->{'size'} characters!";
					return undef
				}
			}
			case /\binteger\b/i { if ( $fields[$i] !~ /^\d+$/ ) { $dbh->disconnect or warn $dbh->errstr; $@ = "Invalid type found, $_ field is of type INTEGER!"; return undef } }
			case /\breal\b/i { if ( $fields[$i] !~ /^\d+(\.\d+)?$/ ) { $dbh->disconnect or warn $dbh->errstr; $@ = "Invalid type found, $_ field is of type REAL!"; return undef } }
			else {}
		}
		OPT: foreach my $opt ( @{$db->{Argument_Computation}->{'fields'}->{$_}->{'options'}} ) {
			switch ($opt) {
				case /\beditable\b/i       { next }
				case /\bvisible\b/i        { next }
				case /\bnull\b/i           { next }
				case /\bmasked\b/i         { next }
				case /\bauto_increment\b/i {
					if ( 0 == $diff ) {
						my $sql = "SELECT $_ FROM Argument_Computation WHERE $_='$fields[$i]'";
						my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
						$sth->execute or $@ = $dbh->errstr;
						my $rv = $sth->fetchall_hashref($_);
						if ( exists $rv->{$fields[$i]} ) {
							$dbh->disconnect or warn $dbh->errstr;
							$@ = "$_ is an Auto increment field, $fields[$i] value already found on the Argument_Computation table!";
							return undef
						}
						else { next }
					}
					else { $miss=1; last OPT }
				}
				case /\boptional\b/i       {
					if ( uc($fields[$i]) eq 'NULL' ) { $dbh->disconnect or warn $dbh->errstr; $@ = "$_ cannot be a null value!"; return undef }
					else { next }
				}
				case /\bunique\b/i         {
					my $sql = "SELECT $_ FROM Argument_Computation WHERE $_='$fields[$i]'";
					my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
					$sth->execute or $@ = $dbh->errstr;
					my $rv = $sth->fetchall_hashref($_);
					if ( exists $rv->{$fields[$i]} ) {
						$dbh->disconnect or warn $dbh->errstr;
						$@ = "$_ must have an Unique value, $fields[$i] value already found on the Argument_Computation table!";
						return undef
					}
					else { next }
				}
				else { next }
			}
		}
		if ( 1 == $miss ) { $diff-- }
		else {
			if ( exists $db->{Argument_Computation}->{'fgnkeys'}->{$_} && exists $db->{Argument_Computation}->{'primkeys'}->{$_} ) {}
			elsif ( exists $db->{Argument_Computation}->{'fgnkeys'}->{$_} ) {
				my $sql = "SELECT $_ FROM $db->{Argument_Computation}->{'fgnkeys'}->{$_} WHERE $_='$fields[$i]'";
				my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
				$sth->execute or $@ = $dbh->errstr;
				my $rv = $sth->fetchall_hashref($_);
				if ( !exists $rv->{$fields[$i]} ) {
					$dbh->disconnect or warn $dbh->errstr;
					$@ = "Foreign key $_ cannot be added because '$fields[$i]' key does not exist on the $db->{Argument_Computation}->{'fgnkeys'}->{$_} table!";
					return undef
				}
			}
			if ( exists $db->{Argument_Computation}->{'fgnkeys'}->{$_} && exists $db->{Argument_Computation}->{'primkeys'}->{$_} ) {}
			elsif ( exists $db->{Argument_Computation}->{'primkeys'}->{$_} ) {
				my $sql = "SELECT $_ FROM Argument_Computation WHERE $_='$fields[$i]'";
				my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
				$sth->execute or $@ = $dbh->errstr;
				my $rv = $sth->fetchall_hashref($_);
				if ( exists $rv->{$fields[$i]} ) {
					$dbh->disconnect or warn $dbh->errstr;
					$@ = "Primary key $_ cannot be added because '$fields[$i]' key already exists on the Argument_Computation table!";
					return undef
				}
			}
			$i++;
			push @newfld, $_
		}
	}
	if ( $diff != 0 ) { $dbh->disconnect or warn $dbh->errstr; $@ = "Invalid number of fields submitted!"; return undef }
	my $sql = 'INSERT INTO Argument_Computation('.(join ',',@newfld).') VALUES ('.(join ',',split / /, '? ' x scalar(@fields)).')';
	my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
	my $res=$sth->execute(@fields) or $@ = $dbh->errstr;
	$dbh->commit;
	$dbh->disconnect or warn $dbh->errstr;
	return $res;
}

# Preloaded methods go here.

=head2 delete_Argument_Computation

DELETE

=cut

sub delete_Argument_Computation {
	my $condition = shift;
	my $i=1;
	my $dbh = DBI->connect("dbi:SQLite:dbname=/Applications/MAMP/cgi-bin/Projecto/XAGra/Data/xagra.db","Hugo","Xagra",{ RaiseError => 1, AutoCommit => 0, unicode => 1 }) or die $DBI::errstr;

	foreach ( keys %{$db->{Argument_Computation}->{'primkeys'}} ) {
		foreach my $tb ( keys %{$db} ) {
			if ( exists $db->{$tb}->{'fgnkeys'}->{$_} ) {
				my $notnull = 0;
				foreach my $opt ( @{$db->{$tb}->{'fields'}->{$_}->{'options'}} ) {
					if ( $opt =~ /\boptional\b/i ) { $notnull = 1; last }
					else { next }
				}
				unless ( 1 == $notnull ) {
					my $sql;
					if ( 'undef' eq $condition ) { $sql = "SELECT $_ FROM Argument_Computation" }
					else { $sql = "SELECT $_ FROM Argument_Computation WHERE $condition" }
					my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
					$sth->execute or $@ = $dbh->errstr;
					my $rv = $sth->fetchall_hashref($_);
					foreach my $key ( keys %{$rv} ) {
						my $sql = "UPDATE $tb SET $_=? WHERE $_='$key'";
						my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
						my $str = 'NULL'.$i++;
						$sth->execute($str) or $@ = $dbh->errstr;
					}
					$dbh->commit
				}
			}
		}
	}
	my $sql;
	if ( 'undef' eq $condition ) { $sql = "DELETE FROM Argument_Computation" }
	else { $sql = "DELETE FROM Argument_Computation WHERE $condition" }
	my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
	my $res=$sth->execute or $@ = $dbh->errstr;
	$dbh->commit;
	$dbh->disconnect or warn $dbh->errstr;
	return $res;
}

# Preloaded methods go here.

=head2 update_Argument_Computation

UPDATE

=cut

sub update_Argument_Computation {
	my ($set, $condition) = @_;
	my @fields;
	my @values;

	while ($set =~ /\b(\w+)\s*=\s*['"](.*?)['"]/g) { push @fields,$1; push @values,$2 }
	if ( scalar(@fields) != scalar(@values) ) { $@ = "Invalid assignment in the set statement!"; return undef }
	my $i = 0;
	my $fgn;
	my $dbh = DBI->connect("dbi:SQLite:dbname=/Applications/MAMP/cgi-bin/Projecto/XAGra/Data/xagra.db","Hugo","Xagra", { RaiseError => 1, AutoCommit => 0, unicode => 1 }) or die $DBI::errstr;

	foreach ( @fields ) {
		switch ( $db->{Argument_Computation}->{'fields'}->{$_}->{'type'} ) {
			case /\bvarchar\b/i {
				if ( uc($db->{Argument_Computation}->{'fields'}->{$_}->{'size'}) ne 'NULL' && length($values[$i]) > $db->{Argument_Computation}->{'fields'}->{$_}->{'size'} ) {
					$dbh->disconnect or warn $dbh->errstr;
					$@ = "Varchar too large, $_ field can only have $db->{Argument_Computation}->{'fields'}->{$_}->{'size'} characters!";
					return undef
				}
			}
			case /\binteger\b/i { if ( $values[$i] !~ /^\d+$/ ) { $dbh->disconnect or warn $dbh->errstr; $@ = "Invalid type found, $_ field is of type INTEGER!"; return undef } }
			case /\breal\b/i { if ( $values[$i] !~ /^\d+(\.\d+)?$/ ) { $dbh->disconnect or warn $dbh->errstr; $@ = "Invalid type found, $_ field is of type REAL!"; return undef } }
			else {}
		}
		OPT: foreach my $opt ( @{$db->{Argument_Computation}->{'fields'}->{$_}->{'options'}} ) {
			switch ($opt) {
				case /\beditable\b/i       { $dbh->disconnect or warn $dbh->errstr; $@ = "$_ is not an editable field!"; return undef }
				case /\bvisible\b/i        { next }
				case /\bnull\b/i           { next }
				case /\bmasked\b/i         { next }
				case /\bauto_increment\b/i {
					my $sql = "SELECT $_ FROM Argument_Computation WHERE $_='$values[$i]'";
					my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
					$sth->execute or $@ = $dbh->errstr;
					my $rv = $sth->fetchall_hashref($_);
					if ( exists $rv->{$values[$i]} ) {
						$dbh->disconnect or warn $dbh->errstr;
						$@ = "$_ is an Auto increment field, $values[$i] value already found on the Argument_Computation table!";
						return undef
					}
					else { next }
				}
				case /\boptional\b/i       {
					if ( uc($values[$i]) eq 'NULL' ) { $dbh->disconnect or warn $dbh->errstr; $@ = "$_ cannot be a null value!"; return undef }
					else { next }
				}
				case /\bunique\b/i         {
					my $sql = "SELECT $_ FROM Argument_Computation WHERE $_='$values[$i]'";
					my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
					$sth->execute or $@ = $dbh->errstr;
					my $rv = $sth->fetchall_hashref($_);
					if ( exists $rv->{$values[$i]} ) {
						$dbh->disconnect or warn $dbh->errstr;
						$@ = "$_ must have an Unique value, $values[$i] value already found on the Argument_Computation table!";
						return undef
					}
					else { next }
				}
				else { next }
			}
		}
		if ( exists $db->{Argument_Computation}->{'fgnkeys'}->{$_} && exists $db->{Argument_Computation}->{'primkeys'}->{$_} ) {}
		elsif ( exists $db->{Argument_Computation}->{'fgnkeys'}->{$_} ) {
			my $sql = "SELECT $_ FROM Argument_Computation WHERE $condition";
			my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
			$sth->execute or $@ = $dbh->errstr;
			my $rv = $sth->fetchall_hashref($_);
			foreach my $key ( keys %{$rv} ) {
				$sql = "SELECT $_ FROM $db->{Argument_Computation}->{'fgnkeys'}->{$_} WHERE $_='$key'";
				$sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
				$sth->execute or $@ = $dbh->errstr;
				$rv = $sth->fetchall_hashref($_);
				if ( !exists $rv->{$values[$i]} ) {
					$dbh->disconnect or warn $dbh->errstr;
					$@ = "Foreign key $_ cannot be updated because '$values[$i]' key does not exist on the $db->{Argument_Computation}->{'fgnkeys'}->{$_} table!";
					return undef
				}
				else { next }
			}
		}
		if ( exists $db->{Argument_Computation}->{'fgnkeys'}->{$_} && exists $db->{Argument_Computation}->{'primkeys'}->{$_} ) {}
		elsif ( exists $db->{Argument_Computation}->{'primkeys'}->{$_} ) {
			my $sql = "SELECT $_ FROM Argument_Computation WHERE $_='$values[$i]'";
			my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
			$sth->execute or $@ = $dbh->errstr;
			my $rv = $sth->fetchall_hashref($_);
			if ( exists $rv->{$values[$i]} ) {
				$dbh->disconnect or warn $dbh->errstr;
				$@ = "Primary key $_ cannot be updated because '$values[$i]' key already exists on the Argument_Computation table!";
				return undef
			}
			else {
				foreach my $tb ( keys %{$db} ) {
					if ( exists $db->{$tb}->{'fgnkeys'}->{$_} ) {
						$fgn->{$_} = {
							value => $values[$i],
							table => $tb
						};
					}
				}
			}
		}
		$i++;
	}
	foreach ( keys %{$fgn} ) {
		my $sql = "SELECT $_ FROM Argument_Computation WHERE $condition";
		my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
		$sth->execute or $@ = $dbh->errstr;
		my $rv = $sth->fetchall_hashref($_);
		foreach my $key ( keys %{$rv} ) {
			$sql = "UPDATE $fgn->{$_}->{'table'} SET $_=? WHERE $_='$key'";
			$sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
			$sth->execute($fgn->{$_}->{'value'}) or $@ = $dbh->errstr;
		}
		$dbh->commit
	}
	my $sql = "UPDATE Argument_Computation SET $set WHERE $condition";
	my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
	my $res=$sth->execute or $@ = $dbh->errstr;
	$dbh->commit;
	$dbh->disconnect or warn $dbh->errstr;
	return $res;
}

# Preloaded methods go here.

=head2 select_Computation

SELECT

=cut

sub select_Computation {
	my ($condition, @fields) = @_;

	my $dbh = DBI->connect("dbi:SQLite:dbname=/Applications/MAMP/cgi-bin/Projecto/XAGra/Data/xagra.db","Hugo","Xagra",{ RaiseError => 1, AutoCommit => 0, unicode => 1 }) or die $DBI::errstr;
	foreach (@fields) {
		if ( !exists $db->{Computation}->{'fields'}->{$_} ) {
			$dbh->disconnect or warn $dbh->errstr;
			$@ = "Unknown field '$_' found while selecting data from Computation table!";
			return undef
		}
		else { next }
	}
	my $sql;
	if ( 'undef' eq $condition ) { $sql = 'SELECT '.(join ',',@fields)." FROM Computation" }
	else { $sql = 'SELECT '.(join ',',@fields)." FROM Computation WHERE $condition" }

	my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
	$sth->execute or $@ = $dbh->errstr;
	my $rv = $sth->fetchall_hashref($fields[0]);
	$dbh->disconnect or warn $dbh->errstr;
	return $rv;
}

# Preloaded methods go here.

=head2 insert_Computation

INSERT

=cut

sub insert_Computation {
	my @fields = @_;
	my @tfield = keys %{$db->{Computation}->{'fields'}};
	my $diff = scalar(@tfield) - scalar(@fields);

	if ( $diff < 0 ) { $@ = "Invalid number of fields submitted!"; return undef }
	my $i = 0;
	my @newfld;
	my $dbh = DBI->connect("dbi:SQLite:dbname=/Applications/MAMP/cgi-bin/Projecto/XAGra/Data/xagra.db","Hugo","Xagra",{ RaiseError => 1, AutoCommit => 0, unicode => 1 }) or die $DBI::errstr;
	foreach ( @tfield ) {
		my $miss=0;
		switch ( $db->{Computation}->{'fields'}->{$_}->{'type'} ) {
			case /\bvarchar\b/i {
				if ( uc($db->{Computation}->{'fields'}->{$_}->{'size'}) ne 'NULL' && length($fields[$i]) > $db->{Computation}->{'fields'}->{$_}->{'size'} ) {
					$dbh->disconnect or warn $dbh->errstr;
					$@ = "Varchar too large, $_ field can only have $db->{Computation}->{'fields'}->{$_}->{'size'} characters!";
					return undef
				}
			}
			case /\binteger\b/i { if ( $fields[$i] !~ /^\d+$/ ) { $dbh->disconnect or warn $dbh->errstr; $@ = "Invalid type found, $_ field is of type INTEGER!"; return undef } }
			case /\breal\b/i { if ( $fields[$i] !~ /^\d+(\.\d+)?$/ ) { $dbh->disconnect or warn $dbh->errstr; $@ = "Invalid type found, $_ field is of type REAL!"; return undef } }
			else {}
		}
		OPT: foreach my $opt ( @{$db->{Computation}->{'fields'}->{$_}->{'options'}} ) {
			switch ($opt) {
				case /\beditable\b/i       { next }
				case /\bvisible\b/i        { next }
				case /\bnull\b/i           { next }
				case /\bmasked\b/i         { next }
				case /\bauto_increment\b/i {
					if ( 0 == $diff ) {
						my $sql = "SELECT $_ FROM Computation WHERE $_='$fields[$i]'";
						my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
						$sth->execute or $@ = $dbh->errstr;
						my $rv = $sth->fetchall_hashref($_);
						if ( exists $rv->{$fields[$i]} ) {
							$dbh->disconnect or warn $dbh->errstr;
							$@ = "$_ is an Auto increment field, $fields[$i] value already found on the Computation table!";
							return undef
						}
						else { next }
					}
					else { $miss=1; last OPT }
				}
				case /\boptional\b/i       {
					if ( uc($fields[$i]) eq 'NULL' ) { $dbh->disconnect or warn $dbh->errstr; $@ = "$_ cannot be a null value!"; return undef }
					else { next }
				}
				case /\bunique\b/i         {
					my $sql = "SELECT $_ FROM Computation WHERE $_='$fields[$i]'";
					my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
					$sth->execute or $@ = $dbh->errstr;
					my $rv = $sth->fetchall_hashref($_);
					if ( exists $rv->{$fields[$i]} ) {
						$dbh->disconnect or warn $dbh->errstr;
						$@ = "$_ must have an Unique value, $fields[$i] value already found on the Computation table!";
						return undef
					}
					else { next }
				}
				else { next }
			}
		}
		if ( 1 == $miss ) { $diff-- }
		else {
			if ( exists $db->{Computation}->{'fgnkeys'}->{$_} && exists $db->{Computation}->{'primkeys'}->{$_} ) {}
			elsif ( exists $db->{Computation}->{'fgnkeys'}->{$_} ) {
				my $sql = "SELECT $_ FROM $db->{Computation}->{'fgnkeys'}->{$_} WHERE $_='$fields[$i]'";
				my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
				$sth->execute or $@ = $dbh->errstr;
				my $rv = $sth->fetchall_hashref($_);
				if ( !exists $rv->{$fields[$i]} ) {
					$dbh->disconnect or warn $dbh->errstr;
					$@ = "Foreign key $_ cannot be added because '$fields[$i]' key does not exist on the $db->{Computation}->{'fgnkeys'}->{$_} table!";
					return undef
				}
			}
			if ( exists $db->{Computation}->{'fgnkeys'}->{$_} && exists $db->{Computation}->{'primkeys'}->{$_} ) {}
			elsif ( exists $db->{Computation}->{'primkeys'}->{$_} ) {
				my $sql = "SELECT $_ FROM Computation WHERE $_='$fields[$i]'";
				my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
				$sth->execute or $@ = $dbh->errstr;
				my $rv = $sth->fetchall_hashref($_);
				if ( exists $rv->{$fields[$i]} ) {
					$dbh->disconnect or warn $dbh->errstr;
					$@ = "Primary key $_ cannot be added because '$fields[$i]' key already exists on the Computation table!";
					return undef
				}
			}
			$i++;
			push @newfld, $_
		}
	}
	if ( $diff != 0 ) { $dbh->disconnect or warn $dbh->errstr; $@ = "Invalid number of fields submitted!"; return undef }
	my $sql = 'INSERT INTO Computation('.(join ',',@newfld).') VALUES ('.(join ',',split / /, '? ' x scalar(@fields)).')';
	my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
	my $res=$sth->execute(@fields) or $@ = $dbh->errstr;
	$dbh->commit;
	$dbh->disconnect or warn $dbh->errstr;
	return $res;
}

# Preloaded methods go here.

=head2 delete_Computation

DELETE

=cut

sub delete_Computation {
	my $condition = shift;
	my $i=1;
	my $dbh = DBI->connect("dbi:SQLite:dbname=/Applications/MAMP/cgi-bin/Projecto/XAGra/Data/xagra.db","Hugo","Xagra",{ RaiseError => 1, AutoCommit => 0, unicode => 1 }) or die $DBI::errstr;

	foreach ( keys %{$db->{Computation}->{'primkeys'}} ) {
		foreach my $tb ( keys %{$db} ) {
			if ( exists $db->{$tb}->{'fgnkeys'}->{$_} ) {
				my $notnull = 0;
				foreach my $opt ( @{$db->{$tb}->{'fields'}->{$_}->{'options'}} ) {
					if ( $opt =~ /\boptional\b/i ) { $notnull = 1; last }
					else { next }
				}
				unless ( 1 == $notnull ) {
					my $sql;
					if ( 'undef' eq $condition ) { $sql = "SELECT $_ FROM Computation" }
					else { $sql = "SELECT $_ FROM Computation WHERE $condition" }
					my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
					$sth->execute or $@ = $dbh->errstr;
					my $rv = $sth->fetchall_hashref($_);
					foreach my $key ( keys %{$rv} ) {
						my $sql = "UPDATE $tb SET $_=? WHERE $_='$key'";
						my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
						my $str = 'NULL'.$i++;
						$sth->execute($str) or $@ = $dbh->errstr;
					}
					$dbh->commit
				}
			}
		}
	}
	my $sql;
	if ( 'undef' eq $condition ) { $sql = "DELETE FROM Computation" }
	else { $sql = "DELETE FROM Computation WHERE $condition" }
	my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
	my $res=$sth->execute or $@ = $dbh->errstr;
	$dbh->commit;
	$dbh->disconnect or warn $dbh->errstr;
	return $res;
}

# Preloaded methods go here.

=head2 update_Computation

UPDATE

=cut

sub update_Computation {
	my ($set, $condition) = @_;
	my @fields;
	my @values;

	while ($set =~ /\b(\w+)\s*=\s*['"](.*?)['"]/g) { push @fields,$1; push @values,$2 }
	if ( scalar(@fields) != scalar(@values) ) { $@ = "Invalid assignment in the set statement!"; return undef }
	my $i = 0;
	my $fgn;
	my $dbh = DBI->connect("dbi:SQLite:dbname=/Applications/MAMP/cgi-bin/Projecto/XAGra/Data/xagra.db","Hugo","Xagra", { RaiseError => 1, AutoCommit => 0, unicode => 1 }) or die $DBI::errstr;

	foreach ( @fields ) {
		switch ( $db->{Computation}->{'fields'}->{$_}->{'type'} ) {
			case /\bvarchar\b/i {
				if ( uc($db->{Computation}->{'fields'}->{$_}->{'size'}) ne 'NULL' && length($values[$i]) > $db->{Computation}->{'fields'}->{$_}->{'size'} ) {
					$dbh->disconnect or warn $dbh->errstr;
					$@ = "Varchar too large, $_ field can only have $db->{Computation}->{'fields'}->{$_}->{'size'} characters!";
					return undef
				}
			}
			case /\binteger\b/i { if ( $values[$i] !~ /^\d+$/ ) { $dbh->disconnect or warn $dbh->errstr; $@ = "Invalid type found, $_ field is of type INTEGER!"; return undef } }
			case /\breal\b/i { if ( $values[$i] !~ /^\d+(\.\d+)?$/ ) { $dbh->disconnect or warn $dbh->errstr; $@ = "Invalid type found, $_ field is of type REAL!"; return undef } }
			else {}
		}
		OPT: foreach my $opt ( @{$db->{Computation}->{'fields'}->{$_}->{'options'}} ) {
			switch ($opt) {
				case /\beditable\b/i       { $dbh->disconnect or warn $dbh->errstr; $@ = "$_ is not an editable field!"; return undef }
				case /\bvisible\b/i        { next }
				case /\bnull\b/i           { next }
				case /\bmasked\b/i         { next }
				case /\bauto_increment\b/i {
					my $sql = "SELECT $_ FROM Computation WHERE $_='$values[$i]'";
					my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
					$sth->execute or $@ = $dbh->errstr;
					my $rv = $sth->fetchall_hashref($_);
					if ( exists $rv->{$values[$i]} ) {
						$dbh->disconnect or warn $dbh->errstr;
						$@ = "$_ is an Auto increment field, $values[$i] value already found on the Computation table!";
						return undef
					}
					else { next }
				}
				case /\boptional\b/i       {
					if ( uc($values[$i]) eq 'NULL' ) { $dbh->disconnect or warn $dbh->errstr; $@ = "$_ cannot be a null value!"; return undef }
					else { next }
				}
				case /\bunique\b/i         {
					my $sql = "SELECT $_ FROM Computation WHERE $_='$values[$i]'";
					my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
					$sth->execute or $@ = $dbh->errstr;
					my $rv = $sth->fetchall_hashref($_);
					if ( exists $rv->{$values[$i]} ) {
						$dbh->disconnect or warn $dbh->errstr;
						$@ = "$_ must have an Unique value, $values[$i] value already found on the Computation table!";
						return undef
					}
					else { next }
				}
				else { next }
			}
		}
		if ( exists $db->{Computation}->{'fgnkeys'}->{$_} && exists $db->{Computation}->{'primkeys'}->{$_} ) {}
		elsif ( exists $db->{Computation}->{'fgnkeys'}->{$_} ) {
			my $sql = "SELECT $_ FROM Computation WHERE $condition";
			my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
			$sth->execute or $@ = $dbh->errstr;
			my $rv = $sth->fetchall_hashref($_);
			foreach my $key ( keys %{$rv} ) {
				$sql = "SELECT $_ FROM $db->{Computation}->{'fgnkeys'}->{$_} WHERE $_='$key'";
				$sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
				$sth->execute or $@ = $dbh->errstr;
				$rv = $sth->fetchall_hashref($_);
				if ( !exists $rv->{$values[$i]} ) {
					$dbh->disconnect or warn $dbh->errstr;
					$@ = "Foreign key $_ cannot be updated because '$values[$i]' key does not exist on the $db->{Computation}->{'fgnkeys'}->{$_} table!";
					return undef
				}
				else { next }
			}
		}
		if ( exists $db->{Computation}->{'fgnkeys'}->{$_} && exists $db->{Computation}->{'primkeys'}->{$_} ) {}
		elsif ( exists $db->{Computation}->{'primkeys'}->{$_} ) {
			my $sql = "SELECT $_ FROM Computation WHERE $_='$values[$i]'";
			my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
			$sth->execute or $@ = $dbh->errstr;
			my $rv = $sth->fetchall_hashref($_);
			if ( exists $rv->{$values[$i]} ) {
				$dbh->disconnect or warn $dbh->errstr;
				$@ = "Primary key $_ cannot be updated because '$values[$i]' key already exists on the Computation table!";
				return undef
			}
			else {
				foreach my $tb ( keys %{$db} ) {
					if ( exists $db->{$tb}->{'fgnkeys'}->{$_} ) {
						$fgn->{$_} = {
							value => $values[$i],
							table => $tb
						};
					}
				}
			}
		}
		$i++;
	}
	foreach ( keys %{$fgn} ) {
		my $sql = "SELECT $_ FROM Computation WHERE $condition";
		my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
		$sth->execute or $@ = $dbh->errstr;
		my $rv = $sth->fetchall_hashref($_);
		foreach my $key ( keys %{$rv} ) {
			$sql = "UPDATE $fgn->{$_}->{'table'} SET $_=? WHERE $_='$key'";
			$sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
			$sth->execute($fgn->{$_}->{'value'}) or $@ = $dbh->errstr;
		}
		$dbh->commit
	}
	my $sql = "UPDATE Computation SET $set WHERE $condition";
	my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
	my $res=$sth->execute or $@ = $dbh->errstr;
	$dbh->commit;
	$dbh->disconnect or warn $dbh->errstr;
	return $res;
}

# Preloaded methods go here.

=head2 select_Importation_Grammar

SELECT

=cut

sub select_Importation_Grammar {
	my ($condition, @fields) = @_;

	my $dbh = DBI->connect("dbi:SQLite:dbname=/Applications/MAMP/cgi-bin/Projecto/XAGra/Data/xagra.db","Hugo","Xagra",{ RaiseError => 1, AutoCommit => 0, unicode => 1 }) or die $DBI::errstr;
	foreach (@fields) {
		if ( !exists $db->{Importation_Grammar}->{'fields'}->{$_} ) {
			$dbh->disconnect or warn $dbh->errstr;
			$@ = "Unknown field '$_' found while selecting data from Importation_Grammar table!";
			return undef
		}
		else { next }
	}
	my $sql;
	if ( 'undef' eq $condition ) { $sql = 'SELECT '.(join ',',@fields)." FROM Importation_Grammar" }
	else { $sql = 'SELECT '.(join ',',@fields)." FROM Importation_Grammar WHERE $condition" }

	my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
	$sth->execute or $@ = $dbh->errstr;
	my $rv = $sth->fetchall_hashref($fields[0]);
	$dbh->disconnect or warn $dbh->errstr;
	return $rv;
}

# Preloaded methods go here.

=head2 insert_Importation_Grammar

INSERT

=cut

sub insert_Importation_Grammar {
	my @fields = @_;
	my @tfield = keys %{$db->{Importation_Grammar}->{'fields'}};
	my $diff = scalar(@tfield) - scalar(@fields);

	if ( $diff < 0 ) { $@ = "Invalid number of fields submitted!"; return undef }
	my $i = 0;
	my @newfld;
	my $dbh = DBI->connect("dbi:SQLite:dbname=/Applications/MAMP/cgi-bin/Projecto/XAGra/Data/xagra.db","Hugo","Xagra",{ RaiseError => 1, AutoCommit => 0, unicode => 1 }) or die $DBI::errstr;
	foreach ( @tfield ) {
		my $miss=0;
		switch ( $db->{Importation_Grammar}->{'fields'}->{$_}->{'type'} ) {
			case /\bvarchar\b/i {
				if ( uc($db->{Importation_Grammar}->{'fields'}->{$_}->{'size'}) ne 'NULL' && length($fields[$i]) > $db->{Importation_Grammar}->{'fields'}->{$_}->{'size'} ) {
					$dbh->disconnect or warn $dbh->errstr;
					$@ = "Varchar too large, $_ field can only have $db->{Importation_Grammar}->{'fields'}->{$_}->{'size'} characters!";
					return undef
				}
			}
			case /\binteger\b/i { if ( $fields[$i] !~ /^\d+$/ ) { $dbh->disconnect or warn $dbh->errstr; $@ = "Invalid type found, $_ field is of type INTEGER!"; return undef } }
			case /\breal\b/i { if ( $fields[$i] !~ /^\d+(\.\d+)?$/ ) { $dbh->disconnect or warn $dbh->errstr; $@ = "Invalid type found, $_ field is of type REAL!"; return undef } }
			else {}
		}
		OPT: foreach my $opt ( @{$db->{Importation_Grammar}->{'fields'}->{$_}->{'options'}} ) {
			switch ($opt) {
				case /\beditable\b/i       { next }
				case /\bvisible\b/i        { next }
				case /\bnull\b/i           { next }
				case /\bmasked\b/i         { next }
				case /\bauto_increment\b/i {
					if ( 0 == $diff ) {
						my $sql = "SELECT $_ FROM Importation_Grammar WHERE $_='$fields[$i]'";
						my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
						$sth->execute or $@ = $dbh->errstr;
						my $rv = $sth->fetchall_hashref($_);
						if ( exists $rv->{$fields[$i]} ) {
							$dbh->disconnect or warn $dbh->errstr;
							$@ = "$_ is an Auto increment field, $fields[$i] value already found on the Importation_Grammar table!";
							return undef
						}
						else { next }
					}
					else { $miss=1; last OPT }
				}
				case /\boptional\b/i       {
					if ( uc($fields[$i]) eq 'NULL' ) { $dbh->disconnect or warn $dbh->errstr; $@ = "$_ cannot be a null value!"; return undef }
					else { next }
				}
				case /\bunique\b/i         {
					my $sql = "SELECT $_ FROM Importation_Grammar WHERE $_='$fields[$i]'";
					my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
					$sth->execute or $@ = $dbh->errstr;
					my $rv = $sth->fetchall_hashref($_);
					if ( exists $rv->{$fields[$i]} ) {
						$dbh->disconnect or warn $dbh->errstr;
						$@ = "$_ must have an Unique value, $fields[$i] value already found on the Importation_Grammar table!";
						return undef
					}
					else { next }
				}
				else { next }
			}
		}
		if ( 1 == $miss ) { $diff-- }
		else {
			if ( exists $db->{Importation_Grammar}->{'fgnkeys'}->{$_} && exists $db->{Importation_Grammar}->{'primkeys'}->{$_} ) {}
			elsif ( exists $db->{Importation_Grammar}->{'fgnkeys'}->{$_} ) {
				my $sql = "SELECT $_ FROM $db->{Importation_Grammar}->{'fgnkeys'}->{$_} WHERE $_='$fields[$i]'";
				my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
				$sth->execute or $@ = $dbh->errstr;
				my $rv = $sth->fetchall_hashref($_);
				if ( !exists $rv->{$fields[$i]} ) {
					$dbh->disconnect or warn $dbh->errstr;
					$@ = "Foreign key $_ cannot be added because '$fields[$i]' key does not exist on the $db->{Importation_Grammar}->{'fgnkeys'}->{$_} table!";
					return undef
				}
			}
			if ( exists $db->{Importation_Grammar}->{'fgnkeys'}->{$_} && exists $db->{Importation_Grammar}->{'primkeys'}->{$_} ) {}
			elsif ( exists $db->{Importation_Grammar}->{'primkeys'}->{$_} ) {
				my $sql = "SELECT $_ FROM Importation_Grammar WHERE $_='$fields[$i]'";
				my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
				$sth->execute or $@ = $dbh->errstr;
				my $rv = $sth->fetchall_hashref($_);
				if ( exists $rv->{$fields[$i]} ) {
					$dbh->disconnect or warn $dbh->errstr;
					$@ = "Primary key $_ cannot be added because '$fields[$i]' key already exists on the Importation_Grammar table!";
					return undef
				}
			}
			$i++;
			push @newfld, $_
		}
	}
	if ( $diff != 0 ) { $dbh->disconnect or warn $dbh->errstr; $@ = "Invalid number of fields submitted!"; return undef }
	my $sql = 'INSERT INTO Importation_Grammar('.(join ',',@newfld).') VALUES ('.(join ',',split / /, '? ' x scalar(@fields)).')';
	my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
	my $res=$sth->execute(@fields) or $@ = $dbh->errstr;
	$dbh->commit;
	$dbh->disconnect or warn $dbh->errstr;
	return $res;
}

# Preloaded methods go here.

=head2 delete_Importation_Grammar

DELETE

=cut

sub delete_Importation_Grammar {
	my $condition = shift;
	my $i=1;
	my $dbh = DBI->connect("dbi:SQLite:dbname=/Applications/MAMP/cgi-bin/Projecto/XAGra/Data/xagra.db","Hugo","Xagra",{ RaiseError => 1, AutoCommit => 0, unicode => 1 }) or die $DBI::errstr;

	foreach ( keys %{$db->{Importation_Grammar}->{'primkeys'}} ) {
		foreach my $tb ( keys %{$db} ) {
			if ( exists $db->{$tb}->{'fgnkeys'}->{$_} ) {
				my $notnull = 0;
				foreach my $opt ( @{$db->{$tb}->{'fields'}->{$_}->{'options'}} ) {
					if ( $opt =~ /\boptional\b/i ) { $notnull = 1; last }
					else { next }
				}
				unless ( 1 == $notnull ) {
					my $sql;
					if ( 'undef' eq $condition ) { $sql = "SELECT $_ FROM Importation_Grammar" }
					else { $sql = "SELECT $_ FROM Importation_Grammar WHERE $condition" }
					my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
					$sth->execute or $@ = $dbh->errstr;
					my $rv = $sth->fetchall_hashref($_);
					foreach my $key ( keys %{$rv} ) {
						my $sql = "UPDATE $tb SET $_=? WHERE $_='$key'";
						my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
						my $str = 'NULL'.$i++;
						$sth->execute($str) or $@ = $dbh->errstr;
					}
					$dbh->commit
				}
			}
		}
	}
	my $sql;
	if ( 'undef' eq $condition ) { $sql = "DELETE FROM Importation_Grammar" }
	else { $sql = "DELETE FROM Importation_Grammar WHERE $condition" }
	my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
	my $res=$sth->execute or $@ = $dbh->errstr;
	$dbh->commit;
	$dbh->disconnect or warn $dbh->errstr;
	return $res;
}

# Preloaded methods go here.

=head2 update_Importation_Grammar

UPDATE

=cut

sub update_Importation_Grammar {
	my ($set, $condition) = @_;
	my @fields;
	my @values;

	while ($set =~ /\b(\w+)\s*=\s*['"](.*?)['"]/g) { push @fields,$1; push @values,$2 }
	if ( scalar(@fields) != scalar(@values) ) { $@ = "Invalid assignment in the set statement!"; return undef }
	my $i = 0;
	my $fgn;
	my $dbh = DBI->connect("dbi:SQLite:dbname=/Applications/MAMP/cgi-bin/Projecto/XAGra/Data/xagra.db","Hugo","Xagra", { RaiseError => 1, AutoCommit => 0, unicode => 1 }) or die $DBI::errstr;

	foreach ( @fields ) {
		switch ( $db->{Importation_Grammar}->{'fields'}->{$_}->{'type'} ) {
			case /\bvarchar\b/i {
				if ( uc($db->{Importation_Grammar}->{'fields'}->{$_}->{'size'}) ne 'NULL' && length($values[$i]) > $db->{Importation_Grammar}->{'fields'}->{$_}->{'size'} ) {
					$dbh->disconnect or warn $dbh->errstr;
					$@ = "Varchar too large, $_ field can only have $db->{Importation_Grammar}->{'fields'}->{$_}->{'size'} characters!";
					return undef
				}
			}
			case /\binteger\b/i { if ( $values[$i] !~ /^\d+$/ ) { $dbh->disconnect or warn $dbh->errstr; $@ = "Invalid type found, $_ field is of type INTEGER!"; return undef } }
			case /\breal\b/i { if ( $values[$i] !~ /^\d+(\.\d+)?$/ ) { $dbh->disconnect or warn $dbh->errstr; $@ = "Invalid type found, $_ field is of type REAL!"; return undef } }
			else {}
		}
		OPT: foreach my $opt ( @{$db->{Importation_Grammar}->{'fields'}->{$_}->{'options'}} ) {
			switch ($opt) {
				case /\beditable\b/i       { $dbh->disconnect or warn $dbh->errstr; $@ = "$_ is not an editable field!"; return undef }
				case /\bvisible\b/i        { next }
				case /\bnull\b/i           { next }
				case /\bmasked\b/i         { next }
				case /\bauto_increment\b/i {
					my $sql = "SELECT $_ FROM Importation_Grammar WHERE $_='$values[$i]'";
					my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
					$sth->execute or $@ = $dbh->errstr;
					my $rv = $sth->fetchall_hashref($_);
					if ( exists $rv->{$values[$i]} ) {
						$dbh->disconnect or warn $dbh->errstr;
						$@ = "$_ is an Auto increment field, $values[$i] value already found on the Importation_Grammar table!";
						return undef
					}
					else { next }
				}
				case /\boptional\b/i       {
					if ( uc($values[$i]) eq 'NULL' ) { $dbh->disconnect or warn $dbh->errstr; $@ = "$_ cannot be a null value!"; return undef }
					else { next }
				}
				case /\bunique\b/i         {
					my $sql = "SELECT $_ FROM Importation_Grammar WHERE $_='$values[$i]'";
					my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
					$sth->execute or $@ = $dbh->errstr;
					my $rv = $sth->fetchall_hashref($_);
					if ( exists $rv->{$values[$i]} ) {
						$dbh->disconnect or warn $dbh->errstr;
						$@ = "$_ must have an Unique value, $values[$i] value already found on the Importation_Grammar table!";
						return undef
					}
					else { next }
				}
				else { next }
			}
		}
		if ( exists $db->{Importation_Grammar}->{'fgnkeys'}->{$_} && exists $db->{Importation_Grammar}->{'primkeys'}->{$_} ) {}
		elsif ( exists $db->{Importation_Grammar}->{'fgnkeys'}->{$_} ) {
			my $sql = "SELECT $_ FROM Importation_Grammar WHERE $condition";
			my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
			$sth->execute or $@ = $dbh->errstr;
			my $rv = $sth->fetchall_hashref($_);
			foreach my $key ( keys %{$rv} ) {
				$sql = "SELECT $_ FROM $db->{Importation_Grammar}->{'fgnkeys'}->{$_} WHERE $_='$key'";
				$sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
				$sth->execute or $@ = $dbh->errstr;
				$rv = $sth->fetchall_hashref($_);
				if ( !exists $rv->{$values[$i]} ) {
					$dbh->disconnect or warn $dbh->errstr;
					$@ = "Foreign key $_ cannot be updated because '$values[$i]' key does not exist on the $db->{Importation_Grammar}->{'fgnkeys'}->{$_} table!";
					return undef
				}
				else { next }
			}
		}
		if ( exists $db->{Importation_Grammar}->{'fgnkeys'}->{$_} && exists $db->{Importation_Grammar}->{'primkeys'}->{$_} ) {}
		elsif ( exists $db->{Importation_Grammar}->{'primkeys'}->{$_} ) {
			my $sql = "SELECT $_ FROM Importation_Grammar WHERE $_='$values[$i]'";
			my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
			$sth->execute or $@ = $dbh->errstr;
			my $rv = $sth->fetchall_hashref($_);
			if ( exists $rv->{$values[$i]} ) {
				$dbh->disconnect or warn $dbh->errstr;
				$@ = "Primary key $_ cannot be updated because '$values[$i]' key already exists on the Importation_Grammar table!";
				return undef
			}
			else {
				foreach my $tb ( keys %{$db} ) {
					if ( exists $db->{$tb}->{'fgnkeys'}->{$_} ) {
						$fgn->{$_} = {
							value => $values[$i],
							table => $tb
						};
					}
				}
			}
		}
		$i++;
	}
	foreach ( keys %{$fgn} ) {
		my $sql = "SELECT $_ FROM Importation_Grammar WHERE $condition";
		my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
		$sth->execute or $@ = $dbh->errstr;
		my $rv = $sth->fetchall_hashref($_);
		foreach my $key ( keys %{$rv} ) {
			$sql = "UPDATE $fgn->{$_}->{'table'} SET $_=? WHERE $_='$key'";
			$sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
			$sth->execute($fgn->{$_}->{'value'}) or $@ = $dbh->errstr;
		}
		$dbh->commit
	}
	my $sql = "UPDATE Importation_Grammar SET $set WHERE $condition";
	my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
	my $res=$sth->execute or $@ = $dbh->errstr;
	$dbh->commit;
	$dbh->disconnect or warn $dbh->errstr;
	return $res;
}

# Preloaded methods go here.

=head2 select_Function

SELECT

=cut

sub select_Function {
	my ($condition, @fields) = @_;

	my $dbh = DBI->connect("dbi:SQLite:dbname=/Applications/MAMP/cgi-bin/Projecto/XAGra/Data/xagra.db","Hugo","Xagra",{ RaiseError => 1, AutoCommit => 0, unicode => 1 }) or die $DBI::errstr;
	foreach (@fields) {
		if ( !exists $db->{Function}->{'fields'}->{$_} ) {
			$dbh->disconnect or warn $dbh->errstr;
			$@ = "Unknown field '$_' found while selecting data from Function table!";
			return undef
		}
		else { next }
	}
	my $sql;
	if ( 'undef' eq $condition ) { $sql = 'SELECT '.(join ',',@fields)." FROM Function" }
	else { $sql = 'SELECT '.(join ',',@fields)." FROM Function WHERE $condition" }

	my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
	$sth->execute or $@ = $dbh->errstr;
	my $rv = $sth->fetchall_hashref($fields[0]);
	$dbh->disconnect or warn $dbh->errstr;
	return $rv;
}

# Preloaded methods go here.

=head2 insert_Function

INSERT

=cut

sub insert_Function {
	my @fields = @_;
	my @tfield = keys %{$db->{Function}->{'fields'}};
	my $diff = scalar(@tfield) - scalar(@fields);

	if ( $diff < 0 ) { $@ = "Invalid number of fields submitted!"; return undef }
	my $i = 0;
	my @newfld;
	my $dbh = DBI->connect("dbi:SQLite:dbname=/Applications/MAMP/cgi-bin/Projecto/XAGra/Data/xagra.db","Hugo","Xagra",{ RaiseError => 1, AutoCommit => 0, unicode => 1 }) or die $DBI::errstr;
	foreach ( @tfield ) {
		my $miss=0;
		switch ( $db->{Function}->{'fields'}->{$_}->{'type'} ) {
			case /\bvarchar\b/i {
				if ( uc($db->{Function}->{'fields'}->{$_}->{'size'}) ne 'NULL' && length($fields[$i]) > $db->{Function}->{'fields'}->{$_}->{'size'} ) {
					$dbh->disconnect or warn $dbh->errstr;
					$@ = "Varchar too large, $_ field can only have $db->{Function}->{'fields'}->{$_}->{'size'} characters!";
					return undef
				}
			}
			case /\binteger\b/i { if ( $fields[$i] !~ /^\d+$/ ) { $dbh->disconnect or warn $dbh->errstr; $@ = "Invalid type found, $_ field is of type INTEGER!"; return undef } }
			case /\breal\b/i { if ( $fields[$i] !~ /^\d+(\.\d+)?$/ ) { $dbh->disconnect or warn $dbh->errstr; $@ = "Invalid type found, $_ field is of type REAL!"; return undef } }
			else {}
		}
		OPT: foreach my $opt ( @{$db->{Function}->{'fields'}->{$_}->{'options'}} ) {
			switch ($opt) {
				case /\beditable\b/i       { next }
				case /\bvisible\b/i        { next }
				case /\bnull\b/i           { next }
				case /\bmasked\b/i         { next }
				case /\bauto_increment\b/i {
					if ( 0 == $diff ) {
						my $sql = "SELECT $_ FROM Function WHERE $_='$fields[$i]'";
						my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
						$sth->execute or $@ = $dbh->errstr;
						my $rv = $sth->fetchall_hashref($_);
						if ( exists $rv->{$fields[$i]} ) {
							$dbh->disconnect or warn $dbh->errstr;
							$@ = "$_ is an Auto increment field, $fields[$i] value already found on the Function table!";
							return undef
						}
						else { next }
					}
					else { $miss=1; last OPT }
				}
				case /\boptional\b/i       {
					if ( uc($fields[$i]) eq 'NULL' ) { $dbh->disconnect or warn $dbh->errstr; $@ = "$_ cannot be a null value!"; return undef }
					else { next }
				}
				case /\bunique\b/i         {
					my $sql = "SELECT $_ FROM Function WHERE $_='$fields[$i]'";
					my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
					$sth->execute or $@ = $dbh->errstr;
					my $rv = $sth->fetchall_hashref($_);
					if ( exists $rv->{$fields[$i]} ) {
						$dbh->disconnect or warn $dbh->errstr;
						$@ = "$_ must have an Unique value, $fields[$i] value already found on the Function table!";
						return undef
					}
					else { next }
				}
				else { next }
			}
		}
		if ( 1 == $miss ) { $diff-- }
		else {
			if ( exists $db->{Function}->{'fgnkeys'}->{$_} && exists $db->{Function}->{'primkeys'}->{$_} ) {}
			elsif ( exists $db->{Function}->{'fgnkeys'}->{$_} ) {
				my $sql = "SELECT $_ FROM $db->{Function}->{'fgnkeys'}->{$_} WHERE $_='$fields[$i]'";
				my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
				$sth->execute or $@ = $dbh->errstr;
				my $rv = $sth->fetchall_hashref($_);
				if ( !exists $rv->{$fields[$i]} ) {
					$dbh->disconnect or warn $dbh->errstr;
					$@ = "Foreign key $_ cannot be added because '$fields[$i]' key does not exist on the $db->{Function}->{'fgnkeys'}->{$_} table!";
					return undef
				}
			}
			if ( exists $db->{Function}->{'fgnkeys'}->{$_} && exists $db->{Function}->{'primkeys'}->{$_} ) {}
			elsif ( exists $db->{Function}->{'primkeys'}->{$_} ) {
				my $sql = "SELECT $_ FROM Function WHERE $_='$fields[$i]'";
				my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
				$sth->execute or $@ = $dbh->errstr;
				my $rv = $sth->fetchall_hashref($_);
				if ( exists $rv->{$fields[$i]} ) {
					$dbh->disconnect or warn $dbh->errstr;
					$@ = "Primary key $_ cannot be added because '$fields[$i]' key already exists on the Function table!";
					return undef
				}
			}
			$i++;
			push @newfld, $_
		}
	}
	if ( $diff != 0 ) { $dbh->disconnect or warn $dbh->errstr; $@ = "Invalid number of fields submitted!"; return undef }
	my $sql = 'INSERT INTO Function('.(join ',',@newfld).') VALUES ('.(join ',',split / /, '? ' x scalar(@fields)).')';
	my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
	my $res=$sth->execute(@fields) or $@ = $dbh->errstr;
	$dbh->commit;
	$dbh->disconnect or warn $dbh->errstr;
	return $res;
}

# Preloaded methods go here.

=head2 delete_Function

DELETE

=cut

sub delete_Function {
	my $condition = shift;
	my $i=1;
	my $dbh = DBI->connect("dbi:SQLite:dbname=/Applications/MAMP/cgi-bin/Projecto/XAGra/Data/xagra.db","Hugo","Xagra",{ RaiseError => 1, AutoCommit => 0, unicode => 1 }) or die $DBI::errstr;

	foreach ( keys %{$db->{Function}->{'primkeys'}} ) {
		foreach my $tb ( keys %{$db} ) {
			if ( exists $db->{$tb}->{'fgnkeys'}->{$_} ) {
				my $notnull = 0;
				foreach my $opt ( @{$db->{$tb}->{'fields'}->{$_}->{'options'}} ) {
					if ( $opt =~ /\boptional\b/i ) { $notnull = 1; last }
					else { next }
				}
				unless ( 1 == $notnull ) {
					my $sql;
					if ( 'undef' eq $condition ) { $sql = "SELECT $_ FROM Function" }
					else { $sql = "SELECT $_ FROM Function WHERE $condition" }
					my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
					$sth->execute or $@ = $dbh->errstr;
					my $rv = $sth->fetchall_hashref($_);
					foreach my $key ( keys %{$rv} ) {
						my $sql = "UPDATE $tb SET $_=? WHERE $_='$key'";
						my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
						my $str = 'NULL'.$i++;
						$sth->execute($str) or $@ = $dbh->errstr;
					}
					$dbh->commit
				}
			}
		}
	}
	my $sql;
	if ( 'undef' eq $condition ) { $sql = "DELETE FROM Function" }
	else { $sql = "DELETE FROM Function WHERE $condition" }
	my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
	my $res=$sth->execute or $@ = $dbh->errstr;
	$dbh->commit;
	$dbh->disconnect or warn $dbh->errstr;
	return $res;
}

# Preloaded methods go here.

=head2 update_Function

UPDATE

=cut

sub update_Function {
	my ($set, $condition) = @_;
	my @fields;
	my @values;

	while ($set =~ /\b(\w+)\s*=\s*['"](.*?)['"]/g) { push @fields,$1; push @values,$2 }
	if ( scalar(@fields) != scalar(@values) ) { $@ = "Invalid assignment in the set statement!"; return undef }
	my $i = 0;
	my $fgn;
	my $dbh = DBI->connect("dbi:SQLite:dbname=/Applications/MAMP/cgi-bin/Projecto/XAGra/Data/xagra.db","Hugo","Xagra", { RaiseError => 1, AutoCommit => 0, unicode => 1 }) or die $DBI::errstr;

	foreach ( @fields ) {
		switch ( $db->{Function}->{'fields'}->{$_}->{'type'} ) {
			case /\bvarchar\b/i {
				if ( uc($db->{Function}->{'fields'}->{$_}->{'size'}) ne 'NULL' && length($values[$i]) > $db->{Function}->{'fields'}->{$_}->{'size'} ) {
					$dbh->disconnect or warn $dbh->errstr;
					$@ = "Varchar too large, $_ field can only have $db->{Function}->{'fields'}->{$_}->{'size'} characters!";
					return undef
				}
			}
			case /\binteger\b/i { if ( $values[$i] !~ /^\d+$/ ) { $dbh->disconnect or warn $dbh->errstr; $@ = "Invalid type found, $_ field is of type INTEGER!"; return undef } }
			case /\breal\b/i { if ( $values[$i] !~ /^\d+(\.\d+)?$/ ) { $dbh->disconnect or warn $dbh->errstr; $@ = "Invalid type found, $_ field is of type REAL!"; return undef } }
			else {}
		}
		OPT: foreach my $opt ( @{$db->{Function}->{'fields'}->{$_}->{'options'}} ) {
			switch ($opt) {
				case /\beditable\b/i       { $dbh->disconnect or warn $dbh->errstr; $@ = "$_ is not an editable field!"; return undef }
				case /\bvisible\b/i        { next }
				case /\bnull\b/i           { next }
				case /\bmasked\b/i         { next }
				case /\bauto_increment\b/i {
					my $sql = "SELECT $_ FROM Function WHERE $_='$values[$i]'";
					my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
					$sth->execute or $@ = $dbh->errstr;
					my $rv = $sth->fetchall_hashref($_);
					if ( exists $rv->{$values[$i]} ) {
						$dbh->disconnect or warn $dbh->errstr;
						$@ = "$_ is an Auto increment field, $values[$i] value already found on the Function table!";
						return undef
					}
					else { next }
				}
				case /\boptional\b/i       {
					if ( uc($values[$i]) eq 'NULL' ) { $dbh->disconnect or warn $dbh->errstr; $@ = "$_ cannot be a null value!"; return undef }
					else { next }
				}
				case /\bunique\b/i         {
					my $sql = "SELECT $_ FROM Function WHERE $_='$values[$i]'";
					my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
					$sth->execute or $@ = $dbh->errstr;
					my $rv = $sth->fetchall_hashref($_);
					if ( exists $rv->{$values[$i]} ) {
						$dbh->disconnect or warn $dbh->errstr;
						$@ = "$_ must have an Unique value, $values[$i] value already found on the Function table!";
						return undef
					}
					else { next }
				}
				else { next }
			}
		}
		if ( exists $db->{Function}->{'fgnkeys'}->{$_} && exists $db->{Function}->{'primkeys'}->{$_} ) {}
		elsif ( exists $db->{Function}->{'fgnkeys'}->{$_} ) {
			my $sql = "SELECT $_ FROM Function WHERE $condition";
			my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
			$sth->execute or $@ = $dbh->errstr;
			my $rv = $sth->fetchall_hashref($_);
			foreach my $key ( keys %{$rv} ) {
				$sql = "SELECT $_ FROM $db->{Function}->{'fgnkeys'}->{$_} WHERE $_='$key'";
				$sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
				$sth->execute or $@ = $dbh->errstr;
				$rv = $sth->fetchall_hashref($_);
				if ( !exists $rv->{$values[$i]} ) {
					$dbh->disconnect or warn $dbh->errstr;
					$@ = "Foreign key $_ cannot be updated because '$values[$i]' key does not exist on the $db->{Function}->{'fgnkeys'}->{$_} table!";
					return undef
				}
				else { next }
			}
		}
		if ( exists $db->{Function}->{'fgnkeys'}->{$_} && exists $db->{Function}->{'primkeys'}->{$_} ) {}
		elsif ( exists $db->{Function}->{'primkeys'}->{$_} ) {
			my $sql = "SELECT $_ FROM Function WHERE $_='$values[$i]'";
			my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
			$sth->execute or $@ = $dbh->errstr;
			my $rv = $sth->fetchall_hashref($_);
			if ( exists $rv->{$values[$i]} ) {
				$dbh->disconnect or warn $dbh->errstr;
				$@ = "Primary key $_ cannot be updated because '$values[$i]' key already exists on the Function table!";
				return undef
			}
			else {
				foreach my $tb ( keys %{$db} ) {
					if ( exists $db->{$tb}->{'fgnkeys'}->{$_} ) {
						$fgn->{$_} = {
							value => $values[$i],
							table => $tb
						};
					}
				}
			}
		}
		$i++;
	}
	foreach ( keys %{$fgn} ) {
		my $sql = "SELECT $_ FROM Function WHERE $condition";
		my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
		$sth->execute or $@ = $dbh->errstr;
		my $rv = $sth->fetchall_hashref($_);
		foreach my $key ( keys %{$rv} ) {
			$sql = "UPDATE $fgn->{$_}->{'table'} SET $_=? WHERE $_='$key'";
			$sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
			$sth->execute($fgn->{$_}->{'value'}) or $@ = $dbh->errstr;
		}
		$dbh->commit
	}
	my $sql = "UPDATE Function SET $set WHERE $condition";
	my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
	my $res=$sth->execute or $@ = $dbh->errstr;
	$dbh->commit;
	$dbh->disconnect or warn $dbh->errstr;
	return $res;
}

# Preloaded methods go here.

=head2 select_Importation

SELECT

=cut

sub select_Importation {
	my ($condition, @fields) = @_;

	my $dbh = DBI->connect("dbi:SQLite:dbname=/Applications/MAMP/cgi-bin/Projecto/XAGra/Data/xagra.db","Hugo","Xagra",{ RaiseError => 1, AutoCommit => 0, unicode => 1 }) or die $DBI::errstr;
	foreach (@fields) {
		if ( !exists $db->{Importation}->{'fields'}->{$_} ) {
			$dbh->disconnect or warn $dbh->errstr;
			$@ = "Unknown field '$_' found while selecting data from Importation table!";
			return undef
		}
		else { next }
	}
	my $sql;
	if ( 'undef' eq $condition ) { $sql = 'SELECT '.(join ',',@fields)." FROM Importation" }
	else { $sql = 'SELECT '.(join ',',@fields)." FROM Importation WHERE $condition" }

	my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
	$sth->execute or $@ = $dbh->errstr;
	my $rv = $sth->fetchall_hashref($fields[0]);
	$dbh->disconnect or warn $dbh->errstr;
	return $rv;
}

# Preloaded methods go here.

=head2 insert_Importation

INSERT

=cut

sub insert_Importation {
	my @fields = @_;
	my @tfield = keys %{$db->{Importation}->{'fields'}};
	my $diff = scalar(@tfield) - scalar(@fields);

	if ( $diff < 0 ) { $@ = "Invalid number of fields submitted!"; return undef }
	my $i = 0;
	my @newfld;
	my $dbh = DBI->connect("dbi:SQLite:dbname=/Applications/MAMP/cgi-bin/Projecto/XAGra/Data/xagra.db","Hugo","Xagra",{ RaiseError => 1, AutoCommit => 0, unicode => 1 }) or die $DBI::errstr;
	foreach ( @tfield ) {
		my $miss=0;
		switch ( $db->{Importation}->{'fields'}->{$_}->{'type'} ) {
			case /\bvarchar\b/i {
				if ( uc($db->{Importation}->{'fields'}->{$_}->{'size'}) ne 'NULL' && length($fields[$i]) > $db->{Importation}->{'fields'}->{$_}->{'size'} ) {
					$dbh->disconnect or warn $dbh->errstr;
					$@ = "Varchar too large, $_ field can only have $db->{Importation}->{'fields'}->{$_}->{'size'} characters!";
					return undef
				}
			}
			case /\binteger\b/i { if ( $fields[$i] !~ /^\d+$/ ) { $dbh->disconnect or warn $dbh->errstr; $@ = "Invalid type found, $_ field is of type INTEGER!"; return undef } }
			case /\breal\b/i { if ( $fields[$i] !~ /^\d+(\.\d+)?$/ ) { $dbh->disconnect or warn $dbh->errstr; $@ = "Invalid type found, $_ field is of type REAL!"; return undef } }
			else {}
		}
		OPT: foreach my $opt ( @{$db->{Importation}->{'fields'}->{$_}->{'options'}} ) {
			switch ($opt) {
				case /\beditable\b/i       { next }
				case /\bvisible\b/i        { next }
				case /\bnull\b/i           { next }
				case /\bmasked\b/i         { next }
				case /\bauto_increment\b/i {
					if ( 0 == $diff ) {
						my $sql = "SELECT $_ FROM Importation WHERE $_='$fields[$i]'";
						my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
						$sth->execute or $@ = $dbh->errstr;
						my $rv = $sth->fetchall_hashref($_);
						if ( exists $rv->{$fields[$i]} ) {
							$dbh->disconnect or warn $dbh->errstr;
							$@ = "$_ is an Auto increment field, $fields[$i] value already found on the Importation table!";
							return undef
						}
						else { next }
					}
					else { $miss=1; last OPT }
				}
				case /\boptional\b/i       {
					if ( uc($fields[$i]) eq 'NULL' ) { $dbh->disconnect or warn $dbh->errstr; $@ = "$_ cannot be a null value!"; return undef }
					else { next }
				}
				case /\bunique\b/i         {
					my $sql = "SELECT $_ FROM Importation WHERE $_='$fields[$i]'";
					my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
					$sth->execute or $@ = $dbh->errstr;
					my $rv = $sth->fetchall_hashref($_);
					if ( exists $rv->{$fields[$i]} ) {
						$dbh->disconnect or warn $dbh->errstr;
						$@ = "$_ must have an Unique value, $fields[$i] value already found on the Importation table!";
						return undef
					}
					else { next }
				}
				else { next }
			}
		}
		if ( 1 == $miss ) { $diff-- }
		else {
			if ( exists $db->{Importation}->{'fgnkeys'}->{$_} && exists $db->{Importation}->{'primkeys'}->{$_} ) {}
			elsif ( exists $db->{Importation}->{'fgnkeys'}->{$_} ) {
				my $sql = "SELECT $_ FROM $db->{Importation}->{'fgnkeys'}->{$_} WHERE $_='$fields[$i]'";
				my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
				$sth->execute or $@ = $dbh->errstr;
				my $rv = $sth->fetchall_hashref($_);
				if ( !exists $rv->{$fields[$i]} ) {
					$dbh->disconnect or warn $dbh->errstr;
					$@ = "Foreign key $_ cannot be added because '$fields[$i]' key does not exist on the $db->{Importation}->{'fgnkeys'}->{$_} table!";
					return undef
				}
			}
			if ( exists $db->{Importation}->{'fgnkeys'}->{$_} && exists $db->{Importation}->{'primkeys'}->{$_} ) {}
			elsif ( exists $db->{Importation}->{'primkeys'}->{$_} ) {
				my $sql = "SELECT $_ FROM Importation WHERE $_='$fields[$i]'";
				my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
				$sth->execute or $@ = $dbh->errstr;
				my $rv = $sth->fetchall_hashref($_);
				if ( exists $rv->{$fields[$i]} ) {
					$dbh->disconnect or warn $dbh->errstr;
					$@ = "Primary key $_ cannot be added because '$fields[$i]' key already exists on the Importation table!";
					return undef
				}
			}
			$i++;
			push @newfld, $_
		}
	}
	if ( $diff != 0 ) { $dbh->disconnect or warn $dbh->errstr; $@ = "Invalid number of fields submitted!"; return undef }
	my $sql = 'INSERT INTO Importation('.(join ',',@newfld).') VALUES ('.(join ',',split / /, '? ' x scalar(@fields)).')';
	my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
	my $res=$sth->execute(@fields) or $@ = $dbh->errstr;
	$dbh->commit;
	$dbh->disconnect or warn $dbh->errstr;
	return $res;
}

# Preloaded methods go here.

=head2 delete_Importation

DELETE

=cut

sub delete_Importation {
	my $condition = shift;
	my $i=1;
	my $dbh = DBI->connect("dbi:SQLite:dbname=/Applications/MAMP/cgi-bin/Projecto/XAGra/Data/xagra.db","Hugo","Xagra",{ RaiseError => 1, AutoCommit => 0, unicode => 1 }) or die $DBI::errstr;

	foreach ( keys %{$db->{Importation}->{'primkeys'}} ) {
		foreach my $tb ( keys %{$db} ) {
			if ( exists $db->{$tb}->{'fgnkeys'}->{$_} ) {
				my $notnull = 0;
				foreach my $opt ( @{$db->{$tb}->{'fields'}->{$_}->{'options'}} ) {
					if ( $opt =~ /\boptional\b/i ) { $notnull = 1; last }
					else { next }
				}
				unless ( 1 == $notnull ) {
					my $sql;
					if ( 'undef' eq $condition ) { $sql = "SELECT $_ FROM Importation" }
					else { $sql = "SELECT $_ FROM Importation WHERE $condition" }
					my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
					$sth->execute or $@ = $dbh->errstr;
					my $rv = $sth->fetchall_hashref($_);
					foreach my $key ( keys %{$rv} ) {
						my $sql = "UPDATE $tb SET $_=? WHERE $_='$key'";
						my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
						my $str = 'NULL'.$i++;
						$sth->execute($str) or $@ = $dbh->errstr;
					}
					$dbh->commit
				}
			}
		}
	}
	my $sql;
	if ( 'undef' eq $condition ) { $sql = "DELETE FROM Importation" }
	else { $sql = "DELETE FROM Importation WHERE $condition" }
	my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
	my $res=$sth->execute or $@ = $dbh->errstr;
	$dbh->commit;
	$dbh->disconnect or warn $dbh->errstr;
	return $res;
}

# Preloaded methods go here.

=head2 update_Importation

UPDATE

=cut

sub update_Importation {
	my ($set, $condition) = @_;
	my @fields;
	my @values;

	while ($set =~ /\b(\w+)\s*=\s*['"](.*?)['"]/g) { push @fields,$1; push @values,$2 }
	if ( scalar(@fields) != scalar(@values) ) { $@ = "Invalid assignment in the set statement!"; return undef }
	my $i = 0;
	my $fgn;
	my $dbh = DBI->connect("dbi:SQLite:dbname=/Applications/MAMP/cgi-bin/Projecto/XAGra/Data/xagra.db","Hugo","Xagra", { RaiseError => 1, AutoCommit => 0, unicode => 1 }) or die $DBI::errstr;

	foreach ( @fields ) {
		switch ( $db->{Importation}->{'fields'}->{$_}->{'type'} ) {
			case /\bvarchar\b/i {
				if ( uc($db->{Importation}->{'fields'}->{$_}->{'size'}) ne 'NULL' && length($values[$i]) > $db->{Importation}->{'fields'}->{$_}->{'size'} ) {
					$dbh->disconnect or warn $dbh->errstr;
					$@ = "Varchar too large, $_ field can only have $db->{Importation}->{'fields'}->{$_}->{'size'} characters!";
					return undef
				}
			}
			case /\binteger\b/i { if ( $values[$i] !~ /^\d+$/ ) { $dbh->disconnect or warn $dbh->errstr; $@ = "Invalid type found, $_ field is of type INTEGER!"; return undef } }
			case /\breal\b/i { if ( $values[$i] !~ /^\d+(\.\d+)?$/ ) { $dbh->disconnect or warn $dbh->errstr; $@ = "Invalid type found, $_ field is of type REAL!"; return undef } }
			else {}
		}
		OPT: foreach my $opt ( @{$db->{Importation}->{'fields'}->{$_}->{'options'}} ) {
			switch ($opt) {
				case /\beditable\b/i       { $dbh->disconnect or warn $dbh->errstr; $@ = "$_ is not an editable field!"; return undef }
				case /\bvisible\b/i        { next }
				case /\bnull\b/i           { next }
				case /\bmasked\b/i         { next }
				case /\bauto_increment\b/i {
					my $sql = "SELECT $_ FROM Importation WHERE $_='$values[$i]'";
					my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
					$sth->execute or $@ = $dbh->errstr;
					my $rv = $sth->fetchall_hashref($_);
					if ( exists $rv->{$values[$i]} ) {
						$dbh->disconnect or warn $dbh->errstr;
						$@ = "$_ is an Auto increment field, $values[$i] value already found on the Importation table!";
						return undef
					}
					else { next }
				}
				case /\boptional\b/i       {
					if ( uc($values[$i]) eq 'NULL' ) { $dbh->disconnect or warn $dbh->errstr; $@ = "$_ cannot be a null value!"; return undef }
					else { next }
				}
				case /\bunique\b/i         {
					my $sql = "SELECT $_ FROM Importation WHERE $_='$values[$i]'";
					my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
					$sth->execute or $@ = $dbh->errstr;
					my $rv = $sth->fetchall_hashref($_);
					if ( exists $rv->{$values[$i]} ) {
						$dbh->disconnect or warn $dbh->errstr;
						$@ = "$_ must have an Unique value, $values[$i] value already found on the Importation table!";
						return undef
					}
					else { next }
				}
				else { next }
			}
		}
		if ( exists $db->{Importation}->{'fgnkeys'}->{$_} && exists $db->{Importation}->{'primkeys'}->{$_} ) {}
		elsif ( exists $db->{Importation}->{'fgnkeys'}->{$_} ) {
			my $sql = "SELECT $_ FROM Importation WHERE $condition";
			my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
			$sth->execute or $@ = $dbh->errstr;
			my $rv = $sth->fetchall_hashref($_);
			foreach my $key ( keys %{$rv} ) {
				$sql = "SELECT $_ FROM $db->{Importation}->{'fgnkeys'}->{$_} WHERE $_='$key'";
				$sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
				$sth->execute or $@ = $dbh->errstr;
				$rv = $sth->fetchall_hashref($_);
				if ( !exists $rv->{$values[$i]} ) {
					$dbh->disconnect or warn $dbh->errstr;
					$@ = "Foreign key $_ cannot be updated because '$values[$i]' key does not exist on the $db->{Importation}->{'fgnkeys'}->{$_} table!";
					return undef
				}
				else { next }
			}
		}
		if ( exists $db->{Importation}->{'fgnkeys'}->{$_} && exists $db->{Importation}->{'primkeys'}->{$_} ) {}
		elsif ( exists $db->{Importation}->{'primkeys'}->{$_} ) {
			my $sql = "SELECT $_ FROM Importation WHERE $_='$values[$i]'";
			my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
			$sth->execute or $@ = $dbh->errstr;
			my $rv = $sth->fetchall_hashref($_);
			if ( exists $rv->{$values[$i]} ) {
				$dbh->disconnect or warn $dbh->errstr;
				$@ = "Primary key $_ cannot be updated because '$values[$i]' key already exists on the Importation table!";
				return undef
			}
			else {
				foreach my $tb ( keys %{$db} ) {
					if ( exists $db->{$tb}->{'fgnkeys'}->{$_} ) {
						$fgn->{$_} = {
							value => $values[$i],
							table => $tb
						};
					}
				}
			}
		}
		$i++;
	}
	foreach ( keys %{$fgn} ) {
		my $sql = "SELECT $_ FROM Importation WHERE $condition";
		my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
		$sth->execute or $@ = $dbh->errstr;
		my $rv = $sth->fetchall_hashref($_);
		foreach my $key ( keys %{$rv} ) {
			$sql = "UPDATE $fgn->{$_}->{'table'} SET $_=? WHERE $_='$key'";
			$sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
			$sth->execute($fgn->{$_}->{'value'}) or $@ = $dbh->errstr;
		}
		$dbh->commit
	}
	my $sql = "UPDATE Importation SET $set WHERE $condition";
	my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
	my $res=$sth->execute or $@ = $dbh->errstr;
	$dbh->commit;
	$dbh->disconnect or warn $dbh->errstr;
	return $res;
}

# Preloaded methods go here.

=head2 select_Argument

SELECT

=cut

sub select_Argument {
	my ($condition, @fields) = @_;

	my $dbh = DBI->connect("dbi:SQLite:dbname=/Applications/MAMP/cgi-bin/Projecto/XAGra/Data/xagra.db","Hugo","Xagra",{ RaiseError => 1, AutoCommit => 0, unicode => 1 }) or die $DBI::errstr;
	foreach (@fields) {
		if ( !exists $db->{Argument}->{'fields'}->{$_} ) {
			$dbh->disconnect or warn $dbh->errstr;
			$@ = "Unknown field '$_' found while selecting data from Argument table!";
			return undef
		}
		else { next }
	}
	my $sql;
	if ( 'undef' eq $condition ) { $sql = 'SELECT '.(join ',',@fields)." FROM Argument" }
	else { $sql = 'SELECT '.(join ',',@fields)." FROM Argument WHERE $condition" }

	my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
	$sth->execute or $@ = $dbh->errstr;
	my $rv = $sth->fetchall_hashref($fields[0]);
	$dbh->disconnect or warn $dbh->errstr;
	return $rv;
}

# Preloaded methods go here.

=head2 insert_Argument

INSERT

=cut

sub insert_Argument {
	my @fields = @_;
	my @tfield = keys %{$db->{Argument}->{'fields'}};
	my $diff = scalar(@tfield) - scalar(@fields);

	if ( $diff < 0 ) { $@ = "Invalid number of fields submitted!"; return undef }
	my $i = 0;
	my @newfld;
	my $dbh = DBI->connect("dbi:SQLite:dbname=/Applications/MAMP/cgi-bin/Projecto/XAGra/Data/xagra.db","Hugo","Xagra",{ RaiseError => 1, AutoCommit => 0, unicode => 1 }) or die $DBI::errstr;
	foreach ( @tfield ) {
		my $miss=0;
		switch ( $db->{Argument}->{'fields'}->{$_}->{'type'} ) {
			case /\bvarchar\b/i {
				if ( uc($db->{Argument}->{'fields'}->{$_}->{'size'}) ne 'NULL' && length($fields[$i]) > $db->{Argument}->{'fields'}->{$_}->{'size'} ) {
					$dbh->disconnect or warn $dbh->errstr;
					$@ = "Varchar too large, $_ field can only have $db->{Argument}->{'fields'}->{$_}->{'size'} characters!";
					return undef
				}
			}
			case /\binteger\b/i { if ( $fields[$i] !~ /^\d+$/ ) { $dbh->disconnect or warn $dbh->errstr; $@ = "Invalid type found, $_ field is of type INTEGER!"; return undef } }
			case /\breal\b/i { if ( $fields[$i] !~ /^\d+(\.\d+)?$/ ) { $dbh->disconnect or warn $dbh->errstr; $@ = "Invalid type found, $_ field is of type REAL!"; return undef } }
			else {}
		}
		OPT: foreach my $opt ( @{$db->{Argument}->{'fields'}->{$_}->{'options'}} ) {
			switch ($opt) {
				case /\beditable\b/i       { next }
				case /\bvisible\b/i        { next }
				case /\bnull\b/i           { next }
				case /\bmasked\b/i         { next }
				case /\bauto_increment\b/i {
					if ( 0 == $diff ) {
						my $sql = "SELECT $_ FROM Argument WHERE $_='$fields[$i]'";
						my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
						$sth->execute or $@ = $dbh->errstr;
						my $rv = $sth->fetchall_hashref($_);
						if ( exists $rv->{$fields[$i]} ) {
							$dbh->disconnect or warn $dbh->errstr;
							$@ = "$_ is an Auto increment field, $fields[$i] value already found on the Argument table!";
							return undef
						}
						else { next }
					}
					else { $miss=1; last OPT }
				}
				case /\boptional\b/i       {
					if ( uc($fields[$i]) eq 'NULL' ) { $dbh->disconnect or warn $dbh->errstr; $@ = "$_ cannot be a null value!"; return undef }
					else { next }
				}
				case /\bunique\b/i         {
					my $sql = "SELECT $_ FROM Argument WHERE $_='$fields[$i]'";
					my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
					$sth->execute or $@ = $dbh->errstr;
					my $rv = $sth->fetchall_hashref($_);
					if ( exists $rv->{$fields[$i]} ) {
						$dbh->disconnect or warn $dbh->errstr;
						$@ = "$_ must have an Unique value, $fields[$i] value already found on the Argument table!";
						return undef
					}
					else { next }
				}
				else { next }
			}
		}
		if ( 1 == $miss ) { $diff-- }
		else {
			if ( exists $db->{Argument}->{'fgnkeys'}->{$_} && exists $db->{Argument}->{'primkeys'}->{$_} ) {}
			elsif ( exists $db->{Argument}->{'fgnkeys'}->{$_} ) {
				my $sql = "SELECT $_ FROM $db->{Argument}->{'fgnkeys'}->{$_} WHERE $_='$fields[$i]'";
				my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
				$sth->execute or $@ = $dbh->errstr;
				my $rv = $sth->fetchall_hashref($_);
				if ( !exists $rv->{$fields[$i]} ) {
					$dbh->disconnect or warn $dbh->errstr;
					$@ = "Foreign key $_ cannot be added because '$fields[$i]' key does not exist on the $db->{Argument}->{'fgnkeys'}->{$_} table!";
					return undef
				}
			}
			if ( exists $db->{Argument}->{'fgnkeys'}->{$_} && exists $db->{Argument}->{'primkeys'}->{$_} ) {}
			elsif ( exists $db->{Argument}->{'primkeys'}->{$_} ) {
				my $sql = "SELECT $_ FROM Argument WHERE $_='$fields[$i]'";
				my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
				$sth->execute or $@ = $dbh->errstr;
				my $rv = $sth->fetchall_hashref($_);
				if ( exists $rv->{$fields[$i]} ) {
					$dbh->disconnect or warn $dbh->errstr;
					$@ = "Primary key $_ cannot be added because '$fields[$i]' key already exists on the Argument table!";
					return undef
				}
			}
			$i++;
			push @newfld, $_
		}
	}
	if ( $diff != 0 ) { $dbh->disconnect or warn $dbh->errstr; $@ = "Invalid number of fields submitted!"; return undef }
	my $sql = 'INSERT INTO Argument('.(join ',',@newfld).') VALUES ('.(join ',',split / /, '? ' x scalar(@fields)).')';
	my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
	my $res=$sth->execute(@fields) or $@ = $dbh->errstr;
	$dbh->commit;
	$dbh->disconnect or warn $dbh->errstr;
	return $res;
}

# Preloaded methods go here.

=head2 delete_Argument

DELETE

=cut

sub delete_Argument {
	my $condition = shift;
	my $i=1;
	my $dbh = DBI->connect("dbi:SQLite:dbname=/Applications/MAMP/cgi-bin/Projecto/XAGra/Data/xagra.db","Hugo","Xagra",{ RaiseError => 1, AutoCommit => 0, unicode => 1 }) or die $DBI::errstr;

	foreach ( keys %{$db->{Argument}->{'primkeys'}} ) {
		foreach my $tb ( keys %{$db} ) {
			if ( exists $db->{$tb}->{'fgnkeys'}->{$_} ) {
				my $notnull = 0;
				foreach my $opt ( @{$db->{$tb}->{'fields'}->{$_}->{'options'}} ) {
					if ( $opt =~ /\boptional\b/i ) { $notnull = 1; last }
					else { next }
				}
				unless ( 1 == $notnull ) {
					my $sql;
					if ( 'undef' eq $condition ) { $sql = "SELECT $_ FROM Argument" }
					else { $sql = "SELECT $_ FROM Argument WHERE $condition" }
					my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
					$sth->execute or $@ = $dbh->errstr;
					my $rv = $sth->fetchall_hashref($_);
					foreach my $key ( keys %{$rv} ) {
						my $sql = "UPDATE $tb SET $_=? WHERE $_='$key'";
						my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
						my $str = 'NULL'.$i++;
						$sth->execute($str) or $@ = $dbh->errstr;
					}
					$dbh->commit
				}
			}
		}
	}
	my $sql;
	if ( 'undef' eq $condition ) { $sql = "DELETE FROM Argument" }
	else { $sql = "DELETE FROM Argument WHERE $condition" }
	my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
	my $res=$sth->execute or $@ = $dbh->errstr;
	$dbh->commit;
	$dbh->disconnect or warn $dbh->errstr;
	return $res;
}

# Preloaded methods go here.

=head2 update_Argument

UPDATE

=cut

sub update_Argument {
	my ($set, $condition) = @_;
	my @fields;
	my @values;

	while ($set =~ /\b(\w+)\s*=\s*['"](.*?)['"]/g) { push @fields,$1; push @values,$2 }
	if ( scalar(@fields) != scalar(@values) ) { $@ = "Invalid assignment in the set statement!"; return undef }
	my $i = 0;
	my $fgn;
	my $dbh = DBI->connect("dbi:SQLite:dbname=/Applications/MAMP/cgi-bin/Projecto/XAGra/Data/xagra.db","Hugo","Xagra", { RaiseError => 1, AutoCommit => 0, unicode => 1 }) or die $DBI::errstr;

	foreach ( @fields ) {
		switch ( $db->{Argument}->{'fields'}->{$_}->{'type'} ) {
			case /\bvarchar\b/i {
				if ( uc($db->{Argument}->{'fields'}->{$_}->{'size'}) ne 'NULL' && length($values[$i]) > $db->{Argument}->{'fields'}->{$_}->{'size'} ) {
					$dbh->disconnect or warn $dbh->errstr;
					$@ = "Varchar too large, $_ field can only have $db->{Argument}->{'fields'}->{$_}->{'size'} characters!";
					return undef
				}
			}
			case /\binteger\b/i { if ( $values[$i] !~ /^\d+$/ ) { $dbh->disconnect or warn $dbh->errstr; $@ = "Invalid type found, $_ field is of type INTEGER!"; return undef } }
			case /\breal\b/i { if ( $values[$i] !~ /^\d+(\.\d+)?$/ ) { $dbh->disconnect or warn $dbh->errstr; $@ = "Invalid type found, $_ field is of type REAL!"; return undef } }
			else {}
		}
		OPT: foreach my $opt ( @{$db->{Argument}->{'fields'}->{$_}->{'options'}} ) {
			switch ($opt) {
				case /\beditable\b/i       { $dbh->disconnect or warn $dbh->errstr; $@ = "$_ is not an editable field!"; return undef }
				case /\bvisible\b/i        { next }
				case /\bnull\b/i           { next }
				case /\bmasked\b/i         { next }
				case /\bauto_increment\b/i {
					my $sql = "SELECT $_ FROM Argument WHERE $_='$values[$i]'";
					my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
					$sth->execute or $@ = $dbh->errstr;
					my $rv = $sth->fetchall_hashref($_);
					if ( exists $rv->{$values[$i]} ) {
						$dbh->disconnect or warn $dbh->errstr;
						$@ = "$_ is an Auto increment field, $values[$i] value already found on the Argument table!";
						return undef
					}
					else { next }
				}
				case /\boptional\b/i       {
					if ( uc($values[$i]) eq 'NULL' ) { $dbh->disconnect or warn $dbh->errstr; $@ = "$_ cannot be a null value!"; return undef }
					else { next }
				}
				case /\bunique\b/i         {
					my $sql = "SELECT $_ FROM Argument WHERE $_='$values[$i]'";
					my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
					$sth->execute or $@ = $dbh->errstr;
					my $rv = $sth->fetchall_hashref($_);
					if ( exists $rv->{$values[$i]} ) {
						$dbh->disconnect or warn $dbh->errstr;
						$@ = "$_ must have an Unique value, $values[$i] value already found on the Argument table!";
						return undef
					}
					else { next }
				}
				else { next }
			}
		}
		if ( exists $db->{Argument}->{'fgnkeys'}->{$_} && exists $db->{Argument}->{'primkeys'}->{$_} ) {}
		elsif ( exists $db->{Argument}->{'fgnkeys'}->{$_} ) {
			my $sql = "SELECT $_ FROM Argument WHERE $condition";
			my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
			$sth->execute or $@ = $dbh->errstr;
			my $rv = $sth->fetchall_hashref($_);
			foreach my $key ( keys %{$rv} ) {
				$sql = "SELECT $_ FROM $db->{Argument}->{'fgnkeys'}->{$_} WHERE $_='$key'";
				$sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
				$sth->execute or $@ = $dbh->errstr;
				$rv = $sth->fetchall_hashref($_);
				if ( !exists $rv->{$values[$i]} ) {
					$dbh->disconnect or warn $dbh->errstr;
					$@ = "Foreign key $_ cannot be updated because '$values[$i]' key does not exist on the $db->{Argument}->{'fgnkeys'}->{$_} table!";
					return undef
				}
				else { next }
			}
		}
		if ( exists $db->{Argument}->{'fgnkeys'}->{$_} && exists $db->{Argument}->{'primkeys'}->{$_} ) {}
		elsif ( exists $db->{Argument}->{'primkeys'}->{$_} ) {
			my $sql = "SELECT $_ FROM Argument WHERE $_='$values[$i]'";
			my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
			$sth->execute or $@ = $dbh->errstr;
			my $rv = $sth->fetchall_hashref($_);
			if ( exists $rv->{$values[$i]} ) {
				$dbh->disconnect or warn $dbh->errstr;
				$@ = "Primary key $_ cannot be updated because '$values[$i]' key already exists on the Argument table!";
				return undef
			}
			else {
				foreach my $tb ( keys %{$db} ) {
					if ( exists $db->{$tb}->{'fgnkeys'}->{$_} ) {
						$fgn->{$_} = {
							value => $values[$i],
							table => $tb
						};
					}
				}
			}
		}
		$i++;
	}
	foreach ( keys %{$fgn} ) {
		my $sql = "SELECT $_ FROM Argument WHERE $condition";
		my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
		$sth->execute or $@ = $dbh->errstr;
		my $rv = $sth->fetchall_hashref($_);
		foreach my $key ( keys %{$rv} ) {
			$sql = "UPDATE $fgn->{$_}->{'table'} SET $_=? WHERE $_='$key'";
			$sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
			$sth->execute($fgn->{$_}->{'value'}) or $@ = $dbh->errstr;
		}
		$dbh->commit
	}
	my $sql = "UPDATE Argument SET $set WHERE $condition";
	my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
	my $res=$sth->execute or $@ = $dbh->errstr;
	$dbh->commit;
	$dbh->disconnect or warn $dbh->errstr;
	return $res;
}























































1;
__END__
# Below is stub documentation for your module. You'd better edit it!

=head1 NAME

XAGra - Perl extension for blah blah blah

=head1 SYNOPSIS

  use XAGra;
  blah blah blah

=head1 DESCRIPTION

Stub documentation for XAGra, created by h2xs. It looks like the
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
