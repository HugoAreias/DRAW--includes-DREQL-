use DBI;
use Tie::IxHash;
use Switch;
use base 'Exporter';

our @EXPORT = ('insert_Registo_TipoRegisto', 'delete_Registo_TipoRegisto', 'update_Registo_TipoRegisto', 'select_Registo_TipoRegisto', 'insert_Controlo', 'delete_Controlo', 'update_Controlo', 'select_Controlo', 'insert_Emissao', 'delete_Emissao', 'update_Emissao', 'select_Emissao', 'insert_Recepcao', 'delete_Recepcao', 'update_Recepcao', 'select_Recepcao', 'insert_Registo', 'delete_Registo', 'update_Registo', 'select_Registo', 'insert_Entidade', 'delete_Entidade', 'update_Entidade', 'select_Entidade');

our $VERSION = '0.01';

our $db;
tie %{$db}, 'Tie::IxHash';

tie %{$db->{Registo_TipoRegisto}}, 'Tie::IxHash';
tie %{$db->{Registo_TipoRegisto}->{'fields'}}, 'Tie::IxHash';
%{$db->{Registo_TipoRegisto}->{'fields'}} = (
	'TipoRegisto' => {
		type => 'varchar',
		size => '255',
	},
	'Cod_Registo' => {
		type => 'int',
		size => '3',
		options => [ 'Key', 'AutoInc' ]
	}
);
$db->{Registo_TipoRegisto}->{'primkeys'} = {
	TipoRegisto => undef,
	Cod_Registo => undef,
};
$db->{Registo_TipoRegisto}->{'fgnkeys'} = {
	Cod_Registo => 'Registo',
};

tie %{$db->{Controlo}}, 'Tie::IxHash';
tie %{$db->{Controlo}->{'fields'}}, 'Tie::IxHash';
%{$db->{Controlo}->{'fields'}} = (
	'Responsavel' => {
		type => 'varchar',
		size => '255',
	},
	'Aprovacao' => {
		type => 'boolean',
		size => 'null',
		options => [ 'Editable' ]
	},
	'Cod_Controlo' => {
		type => 'int',
		size => '3',
		options => [ 'Key', 'AutoInc' ]
	},
	'Coisas' => {
		type => 'varchar',
		size => '255',
	},
	'Coisas_' => {
		type => 'varchar',
		size => '255',
	},
	'Coisas__' => {
		type => 'varchar',
		size => '255',
	},
	'Cod_Registo' => {
		type => 'int',
		size => '3',
		options => [ 'Key', 'AutoInc' ]
	}
);
$db->{Controlo}->{'primkeys'} = {
	Cod_Controlo => undef,
};
$db->{Controlo}->{'fgnkeys'} = {
	Cod_Registo => 'Registo',
};

tie %{$db->{Emissao}}, 'Tie::IxHash';
tie %{$db->{Emissao}->{'fields'}}, 'Tie::IxHash';
%{$db->{Emissao}->{'fields'}} = (
	'Cod_Emissao' => {
		type => 'int',
		size => '3',
		options => [ 'Key', 'AutoInc' ]
	},
	'Cod_Destinatario' => {
		type => 'int',
		size => '3',
	},
	'Assunto' => {
		type => 'varchar',
		size => 'null',
	},
	'DataEmissao' => {
		type => 'date',
		size => 'null',
	},
	'Cod_Registo' => {
		type => 'int',
		size => '3',
		options => [ 'Key', 'AutoInc' ]
	},
	'Cod_Entidade' => {
		type => 'int',
		size => '3',
		options => [ 'Key', 'AutoInc' ]
	}
);
$db->{Emissao}->{'primkeys'} = {
	Cod_Emissao => undef,
};
$db->{Emissao}->{'fgnkeys'} = {
	Cod_Registo => 'Registo',
	Cod_Entidade => 'Entidade',
};

tie %{$db->{Recepcao}}, 'Tie::IxHash';
tie %{$db->{Recepcao}->{'fields'}}, 'Tie::IxHash';
%{$db->{Recepcao}->{'fields'}} = (
	'Cod_Recepcao' => {
		type => 'int',
		size => '3',
		options => [ 'Key', 'AutoInc' ]
	},
	'Cod_Remetente' => {
		type => 'int',
		size => '3',
	},
	'Assunto' => {
		type => 'varchar',
		size => 'null',
	},
	'DataRecepcao' => {
		type => 'date',
		size => 'null',
	},
	'Cod_Registo' => {
		type => 'int',
		size => '3',
		options => [ 'Key', 'AutoInc' ]
	},
	'Cod_Entidade' => {
		type => 'int',
		size => '3',
		options => [ 'Key', 'AutoInc' ]
	}
);
$db->{Recepcao}->{'primkeys'} = {
	Cod_Recepcao => undef,
};
$db->{Recepcao}->{'fgnkeys'} = {
	Cod_Registo => 'Registo',
	Cod_Entidade => 'Entidade',
};

tie %{$db->{Registo}}, 'Tie::IxHash';
tie %{$db->{Registo}->{'fields'}}, 'Tie::IxHash';
%{$db->{Registo}->{'fields'}} = (
	'Cod_Registo' => {
		type => 'int',
		size => '3',
		options => [ 'Key', 'AutoInc' ]
	},
	'DataRegisto' => {
		type => 'date',
		size => 'null',
	}
);
$db->{Registo}->{'primkeys'} = {
	Cod_Registo => undef,
};
$db->{Registo}->{'fgnkeys'} = {
};

tie %{$db->{Entidade}}, 'Tie::IxHash';
tie %{$db->{Entidade}->{'fields'}}, 'Tie::IxHash';
%{$db->{Entidade}->{'fields'}} = (
	'Cod_Entidade' => {
		type => 'int',
		size => '3',
		options => [ 'Key', 'AutoInc' ]
	},
	'Nome' => {
		type => 'varchar',
		size => '255',
		options => [ 'Editable' ]
	},
	'Morada' => {
		type => 'varchar',
		size => '255',
		options => [ 'Editable', 'Optional' ]
	},
	'Telefone' => {
		type => 'varchar',
		size => '255',
		options => [ 'Editable', 'Optional' ]
	},
	'Email' => {
		type => 'varchar',
		size => '255',
		options => [ 'Editable', 'Optional' ]
	}
);
$db->{Entidade}->{'primkeys'} = {
	Cod_Entidade => undef,
};
$db->{Entidade}->{'fgnkeys'} = {
};

# Preloaded methods go here.

=head2 select_Registo_TipoRegisto

SELECT

=cut

sub select_Registo_TipoRegisto {
	my ($condition, @fields) = @_;

	my $dbh = DBI->connect("dbi:SQLite:dbname=[DATABASE_PATH]","[DB_USERNAME]","[DB_PASSWORD]",{ RaiseError => 1, AutoCommit => 0, unicode => 1 }) or die $DBI::errstr;
	foreach (@fields) {
		if ( !exists $db->{Registo_TipoRegisto}->{'fields'}->{$_} ) {
			$dbh->disconnect or warn $dbh->errstr;
			$@ = "Unknown field '$_' found while selecting data from Registo_TipoRegisto table!";
			return undef
		}
		else { next }
	}
	my $sql;
	if ( 'undef' eq $condition ) { $sql = 'SELECT '.(join ',',@fields)." FROM Registo_TipoRegisto" }
	else { $sql = 'SELECT '.(join ',',@fields)." FROM Registo_TipoRegisto WHERE $condition" }

	my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
	$sth->execute or $@ = $dbh->errstr;
	my $rv = $sth->fetchall_hashref($fields[0]);
	$dbh->disconnect or warn $dbh->errstr;
	return $rv;
}

# Preloaded methods go here.

=head2 insert_Registo_TipoRegisto

INSERT

=cut

sub insert_Registo_TipoRegisto {
	my @fields = @_;
	my @tfield = keys %{$db->{Registo_TipoRegisto}->{'fields'}};
	my $diff = scalar(@tfield) - scalar(@fields);

	if ( $diff < 0 ) { $@ = "Invalid number of fields submitted!"; return undef }
	my $i = 0;
	my @newfld;
	my $dbh = DBI->connect("dbi:SQLite:dbname=[DATABASE_PATH]","[DB_USERNAME]","[DB_PASSWORD]",{ RaiseError => 1, AutoCommit => 0, unicode => 1 }) or die $DBI::errstr;
	foreach ( @tfield ) {
		my $miss=0;
		switch ( $db->{Registo_TipoRegisto}->{'fields'}->{$_}->{'type'} ) {
			case /\bvarchar\b/i {
				if ( uc($db->{Registo_TipoRegisto}->{'fields'}->{$_}->{'size'}) ne 'NULL' && length($fields[$i]) > $db->{Registo_TipoRegisto}->{'fields'}->{$_}->{'size'} ) {
					$dbh->disconnect or warn $dbh->errstr;
					$@ = "Varchar too large, $_ field can only have $db->{Registo_TipoRegisto}->{'fields'}->{$_}->{'size'} characters!";
					return undef
				}
			}
			case /\binteger\b/i { if ( $fields[$i] !~ /^\d+$/ ) { $dbh->disconnect or warn $dbh->errstr; $@ = "Invalid type found, $_ field is of type INTEGER!"; return undef } }
			case /\breal\b/i { if ( $fields[$i] !~ /^\d+(\.\d+)?$/ ) { $dbh->disconnect or warn $dbh->errstr; $@ = "Invalid type found, $_ field is of type REAL!"; return undef } }
			else {}
		}
		OPT: foreach my $opt ( @{$db->{Registo_TipoRegisto}->{'fields'}->{$_}->{'options'}} ) {
			switch ($opt) {
				case /\beditable\b/i       { next }
				case /\bvisible\b/i        { next }
				case /\bnull\b/i           { next }
				case /\bmasked\b/i         { next }
				case /\bauto_increment\b/i {
					if ( 0 == $diff ) {
						my $sql = "SELECT $_ FROM Registo_TipoRegisto WHERE $_=$fields[$i]";
						my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
						$sth->execute or $@ = $dbh->errstr;
						my $rv = $sth->fetchall_hashref($_);
						if ( exists $rv->{$fields[$i]} ) {
							$dbh->disconnect or warn $dbh->errstr;
							$@ = "$_ is an Auto increment field, $fields[$i] value already found on the Registo_TipoRegisto table!";
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
					my $sql = "SELECT $_ FROM Registo_TipoRegisto WHERE $_=$fields[$i]";
					my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
					$sth->execute or $@ = $dbh->errstr;
					my $rv = $sth->fetchall_hashref($_);
					if ( exists $rv->{$fields[$i]} ) {
						$dbh->disconnect or warn $dbh->errstr;
						$@ = "$_ must have an Unique value, $fields[$i] value already found on the Registo_TipoRegisto table!";
						return undef
					}
					else { next }
				}
				else { next }
			}
		}
		if ( 1 == $miss ) { $diff-- }
		else {
			if ( exists $db->{Registo_TipoRegisto}->{'fgnkeys'}->{$_} ) {
				my $sql = "SELECT $_ FROM $db->{Registo_TipoRegisto}->{'fgnkeys'}->{$_} WHERE $_=$fields[$i]";
				my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
				$sth->execute or $@ = $dbh->errstr;
				my $rv = $sth->fetchall_hashref($_);
				if ( !exists $rv->{$fields[$i]} ) {
					$dbh->disconnect or warn $dbh->errstr;
					$@ = "Foreign key $_ cannot be added because '$fields[$i]' key does not exist on the $db->{Registo_TipoRegisto}->{'fgnkeys'}->{$_} table!";
					return undef
				}
			}
			if ( exists $db->{Registo_TipoRegisto}->{'primkeys'}->{$_} ) {
				my $sql = "SELECT $_ FROM Registo_TipoRegisto WHERE $_=$fields[$i]";
				my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
				$sth->execute or $@ = $dbh->errstr;
				my $rv = $sth->fetchall_hashref($_);
				if ( exists $rv->{$fields[$i]} ) {
					$dbh->disconnect or warn $dbh->errstr;
					$@ = "Primary key $_ cannot be added because '$fields[$i]' key already exists on the Registo_TipoRegisto table!";
					return undef
				}
			}
			$i++;
			push @newfld, $_
		}
	}
	if ( $diff != 0 ) { $dbh->disconnect or warn $dbh->errstr; $@ = "Invalid number of fields submitted!"; return undef }
	my $sql = 'INSERT INTO Registo_TipoRegisto('.(join ',',@newfld).') VALUES ('.(join ',',split / /, '? ' x scalar(@fields)).')';
	my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
	my $res=$sth->execute(@fields) or $@ = $dbh->errstr;
	$dbh->commit;
	$dbh->disconnect or warn $dbh->errstr;
	return $res;
}

# Preloaded methods go here.

=head2 delete_Registo_TipoRegisto

DELETE

=cut

sub delete_Registo_TipoRegisto {
	my $condition = shift;
	my $dbh = DBI->connect("dbi:SQLite:dbname=[DATABASE_PATH]","[DB_USERNAME]","[DB_PASSWORD]",{ RaiseError => 1, AutoCommit => 0, unicode => 1 }) or die $DBI::errstr;

	foreach ( keys %{$db->{Registo_TipoRegisto}->{'primkeys'}} ) {
		foreach my $tb ( keys %{$db} ) {
			if ( exists $db->{$tb}->{'fgnkeys'}->{$_} ) {
				my $notnull = 0;
				foreach my $opt ( @{$db->{$tb}->{'fields'}->{$_}->{'options'}} ) {
					if ( $opt =~ /\boptional\b/i ) { $notnull = 1; last }
					else { next }
				}
				unless ( 1 == $notnull ) {
					my $sql;
					if ( 'undef' eq $condition ) { $sql = "SELECT $_ FROM Registo_TipoRegisto" }
					else { $sql = "SELECT $_ FROM Registo_TipoRegisto WHERE $condition" }
					my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
					$sth->execute or $@ = $dbh->errstr;
					my $rv = $sth->fetchall_hashref($_);
					foreach my $key ( keys %{$rv} ) {
						my $sql = "UPDATE $tb SET $_=? WHERE $_=$key";
						my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
						$sth->execute(undef) or $@ = $dbh->errstr;
					}
					$dbh->commit
				}
			}
		}
	}
	my $sql;
	if ( 'undef' eq $condition ) { $sql = "DELETE FROM Registo_TipoRegisto" }
	else { $sql = "DELETE FROM Registo_TipoRegisto WHERE $condition" }
	my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
	my $res=$sth->execute or $@ = $dbh->errstr;
	$dbh->commit;
	$dbh->disconnect or warn $dbh->errstr;
	return $res;
}

# Preloaded methods go here.

=head2 update_Registo_TipoRegisto

UPDATE

=cut

sub update_Registo_TipoRegisto {
	my ($set, $condition) = @_;
	my @fields;
	my @values;

	while ($set =~ /\b(\w+)\s*=\s*['"](.*?)['"]/g) { push @fields,$1; push @values,$2 }
	if ( scalar(@fields) != scalar(@values) ) { $@ = "Invalid assignment in the set statement!"; return undef }
	my $i = 0;
	my $fgn;
	my $dbh = DBI->connect("dbi:SQLite:dbname=[DATABASE_PATH]","[DB_USERNAME]","[DB_PASSWORD]", { RaiseError => 1, AutoCommit => 0, unicode => 1 }) or die $DBI::errstr;

	foreach ( @fields ) {
		switch ( $db->{Registo_TipoRegisto}->{'fields'}->{$_}->{'type'} ) {
			case /\bvarchar\b/i {
				if ( uc($db->{Registo_TipoRegisto}->{'fields'}->{$_}->{'size'}) ne 'NULL' && length($values[$i]) > $db->{Registo_TipoRegisto}->{'fields'}->{$_}->{'size'} ) {
					$dbh->disconnect or warn $dbh->errstr;
					$@ = "Varchar too large, $_ field can only have $db->{Registo_TipoRegisto}->{'fields'}->{$_}->{'size'} characters!";
					return undef
				}
			}
			case /\binteger\b/i { if ( $values[$i] !~ /^\d+$/ ) { $dbh->disconnect or warn $dbh->errstr; $@ = "Invalid type found, $_ field is of type INTEGER!"; return undef } }
			case /\breal\b/i { if ( $values[$i] !~ /^\d+(\.\d+)?$/ ) { $dbh->disconnect or warn $dbh->errstr; $@ = "Invalid type found, $_ field is of type REAL!"; return undef } }
			else {}
		}
		OPT: foreach my $opt ( @{$db->{Registo_TipoRegisto}->{'fields'}->{$_}->{'options'}} ) {
			switch ($opt) {
				case /\beditable\b/i       { $dbh->disconnect or warn $dbh->errstr; $@ = "$_ is not an editable field!"; return undef }
				case /\bvisible\b/i        { next }
				case /\bnull\b/i           { next }
				case /\bmasked\b/i         { next }
				case /\bauto_increment\b/i {
					my $sql = "SELECT $_ FROM Registo_TipoRegisto WHERE $_=$values[$i]";
					my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
					$sth->execute or $@ = $dbh->errstr;
					my $rv = $sth->fetchall_hashref($_);
					if ( exists $rv->{$values[$i]} ) {
						$dbh->disconnect or warn $dbh->errstr;
						$@ = "$_ is an Auto increment field, $values[$i] value already found on the Registo_TipoRegisto table!";
						return undef
					}
					else { next }
				}
				case /\boptional\b/i       {
					if ( uc($values[$i]) eq 'NULL' ) { $dbh->disconnect or warn $dbh->errstr; $@ = "$_ cannot be a null value!"; return undef }
					else { next }
				}
				case /\bunique\b/i         {
					my $sql = "SELECT $_ FROM Registo_TipoRegisto WHERE $_=$values[$i]";
					my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
					$sth->execute or $@ = $dbh->errstr;
					my $rv = $sth->fetchall_hashref($_);
					if ( exists $rv->{$values[$i]} ) {
						$dbh->disconnect or warn $dbh->errstr;
						$@ = "$_ must have an Unique value, $values[$i] value already found on the Registo_TipoRegisto table!";
						return undef
					}
					else { next }
				}
				else { next }
			}
		}
		if ( exists $db->{Registo_TipoRegisto}->{'fgnkeys'}->{$_} ) {
			my $sql = "SELECT $_ FROM Registo_TipoRegisto WHERE $condition";
			my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
			$sth->execute or $@ = $dbh->errstr;
			my $rv = $sth->fetchall_hashref($_);
			foreach my $key ( keys %{$rv} ) {
				$sql = "SELECT $_ FROM exists $db->{Registo_TipoRegisto}->{'fgnkeys'}->{$_} WHERE $_=$key";
				$sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
				$sth->execute or $@ = $dbh->errstr;
				$rv = $sth->fetchall_hashref($_);
				if ( !exists $rv->{$values[$i]} ) {
					$dbh->disconnect or warn $dbh->errstr;
					$@ = "Foreign key $_ cannot be updated because '$values[$i]' key does not exist on the exists $db->{Registo_TipoRegisto}->{'fgnkeys'}->{$_} table!";
					return undef
				}
				else { next }
			}
		}
		if ( exists $db->{Registo_TipoRegisto}->{'primkeys'}->{$_} ) {
			my $sql = "SELECT $_ FROM Registo_TipoRegisto WHERE $_=$values[$i]";
			my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
			$sth->execute or $@ = $dbh->errstr;
			my $rv = $sth->fetchall_hashref($_);
			if ( exists $rv->{$values[$i]} ) {
				$dbh->disconnect or warn $dbh->errstr;
				$@ = "Primary key $_ cannot be updated because '$values[$i]' key already exists on the Registo_TipoRegisto table!";
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
		my $sql = "SELECT $_ FROM Registo_TipoRegisto WHERE $condition";
		my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
		$sth->execute or $@ = $dbh->errstr;
		my $rv = $sth->fetchall_hashref($_);
		foreach my $key ( keys %{$rv} ) {
			$sql = "UPDATE $fgn->{$_}->{'table'} SET $_=? WHERE $_=$key";
			$sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
			$sth->execute($fgn->{$_}->{'value'}) or $@ = $dbh->errstr;
		}
		$dbh->commit
	}
	my $sql = "UPDATE Registo_TipoRegisto SET $set WHERE $condition";
	my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
	my $res=$sth->execute or $@ = $dbh->errstr;
	$dbh->commit;
	$dbh->disconnect or warn $dbh->errstr;
	return $res;
}

# Preloaded methods go here.

=head2 select_Controlo

SELECT

=cut

sub select_Controlo {
	my ($condition, @fields) = @_;

	my $dbh = DBI->connect("dbi:SQLite:dbname=[DATABASE_PATH]","[DB_USERNAME]","[DB_PASSWORD]",{ RaiseError => 1, AutoCommit => 0, unicode => 1 }) or die $DBI::errstr;
	foreach (@fields) {
		if ( !exists $db->{Controlo}->{'fields'}->{$_} ) {
			$dbh->disconnect or warn $dbh->errstr;
			$@ = "Unknown field '$_' found while selecting data from Controlo table!";
			return undef
		}
		else { next }
	}
	my $sql;
	if ( 'undef' eq $condition ) { $sql = 'SELECT '.(join ',',@fields)." FROM Controlo" }
	else { $sql = 'SELECT '.(join ',',@fields)." FROM Controlo WHERE $condition" }

	my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
	$sth->execute or $@ = $dbh->errstr;
	my $rv = $sth->fetchall_hashref($fields[0]);
	$dbh->disconnect or warn $dbh->errstr;
	return $rv;
}

# Preloaded methods go here.

=head2 insert_Controlo

INSERT

=cut

sub insert_Controlo {
	my @fields = @_;
	my @tfield = keys %{$db->{Controlo}->{'fields'}};
	my $diff = scalar(@tfield) - scalar(@fields);

	if ( $diff < 0 ) { $@ = "Invalid number of fields submitted!"; return undef }
	my $i = 0;
	my @newfld;
	my $dbh = DBI->connect("dbi:SQLite:dbname=[DATABASE_PATH]","[DB_USERNAME]","[DB_PASSWORD]",{ RaiseError => 1, AutoCommit => 0, unicode => 1 }) or die $DBI::errstr;
	foreach ( @tfield ) {
		my $miss=0;
		switch ( $db->{Controlo}->{'fields'}->{$_}->{'type'} ) {
			case /\bvarchar\b/i {
				if ( uc($db->{Controlo}->{'fields'}->{$_}->{'size'}) ne 'NULL' && length($fields[$i]) > $db->{Controlo}->{'fields'}->{$_}->{'size'} ) {
					$dbh->disconnect or warn $dbh->errstr;
					$@ = "Varchar too large, $_ field can only have $db->{Controlo}->{'fields'}->{$_}->{'size'} characters!";
					return undef
				}
			}
			case /\binteger\b/i { if ( $fields[$i] !~ /^\d+$/ ) { $dbh->disconnect or warn $dbh->errstr; $@ = "Invalid type found, $_ field is of type INTEGER!"; return undef } }
			case /\breal\b/i { if ( $fields[$i] !~ /^\d+(\.\d+)?$/ ) { $dbh->disconnect or warn $dbh->errstr; $@ = "Invalid type found, $_ field is of type REAL!"; return undef } }
			else {}
		}
		OPT: foreach my $opt ( @{$db->{Controlo}->{'fields'}->{$_}->{'options'}} ) {
			switch ($opt) {
				case /\beditable\b/i       { next }
				case /\bvisible\b/i        { next }
				case /\bnull\b/i           { next }
				case /\bmasked\b/i         { next }
				case /\bauto_increment\b/i {
					if ( 0 == $diff ) {
						my $sql = "SELECT $_ FROM Controlo WHERE $_=$fields[$i]";
						my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
						$sth->execute or $@ = $dbh->errstr;
						my $rv = $sth->fetchall_hashref($_);
						if ( exists $rv->{$fields[$i]} ) {
							$dbh->disconnect or warn $dbh->errstr;
							$@ = "$_ is an Auto increment field, $fields[$i] value already found on the Controlo table!";
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
					my $sql = "SELECT $_ FROM Controlo WHERE $_=$fields[$i]";
					my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
					$sth->execute or $@ = $dbh->errstr;
					my $rv = $sth->fetchall_hashref($_);
					if ( exists $rv->{$fields[$i]} ) {
						$dbh->disconnect or warn $dbh->errstr;
						$@ = "$_ must have an Unique value, $fields[$i] value already found on the Controlo table!";
						return undef
					}
					else { next }
				}
				else { next }
			}
		}
		if ( 1 == $miss ) { $diff-- }
		else {
			if ( exists $db->{Controlo}->{'fgnkeys'}->{$_} ) {
				my $sql = "SELECT $_ FROM $db->{Controlo}->{'fgnkeys'}->{$_} WHERE $_=$fields[$i]";
				my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
				$sth->execute or $@ = $dbh->errstr;
				my $rv = $sth->fetchall_hashref($_);
				if ( !exists $rv->{$fields[$i]} ) {
					$dbh->disconnect or warn $dbh->errstr;
					$@ = "Foreign key $_ cannot be added because '$fields[$i]' key does not exist on the $db->{Controlo}->{'fgnkeys'}->{$_} table!";
					return undef
				}
			}
			if ( exists $db->{Controlo}->{'primkeys'}->{$_} ) {
				my $sql = "SELECT $_ FROM Controlo WHERE $_=$fields[$i]";
				my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
				$sth->execute or $@ = $dbh->errstr;
				my $rv = $sth->fetchall_hashref($_);
				if ( exists $rv->{$fields[$i]} ) {
					$dbh->disconnect or warn $dbh->errstr;
					$@ = "Primary key $_ cannot be added because '$fields[$i]' key already exists on the Controlo table!";
					return undef
				}
			}
			$i++;
			push @newfld, $_
		}
	}
	if ( $diff != 0 ) { $dbh->disconnect or warn $dbh->errstr; $@ = "Invalid number of fields submitted!"; return undef }
	my $sql = 'INSERT INTO Controlo('.(join ',',@newfld).') VALUES ('.(join ',',split / /, '? ' x scalar(@fields)).')';
	my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
	my $res=$sth->execute(@fields) or $@ = $dbh->errstr;
	$dbh->commit;
	$dbh->disconnect or warn $dbh->errstr;
	return $res;
}

# Preloaded methods go here.

=head2 delete_Controlo

DELETE

=cut

sub delete_Controlo {
	my $condition = shift;
	my $dbh = DBI->connect("dbi:SQLite:dbname=[DATABASE_PATH]","[DB_USERNAME]","[DB_PASSWORD]",{ RaiseError => 1, AutoCommit => 0, unicode => 1 }) or die $DBI::errstr;

	foreach ( keys %{$db->{Controlo}->{'primkeys'}} ) {
		foreach my $tb ( keys %{$db} ) {
			if ( exists $db->{$tb}->{'fgnkeys'}->{$_} ) {
				my $notnull = 0;
				foreach my $opt ( @{$db->{$tb}->{'fields'}->{$_}->{'options'}} ) {
					if ( $opt =~ /\boptional\b/i ) { $notnull = 1; last }
					else { next }
				}
				unless ( 1 == $notnull ) {
					my $sql;
					if ( 'undef' eq $condition ) { $sql = "SELECT $_ FROM Controlo" }
					else { $sql = "SELECT $_ FROM Controlo WHERE $condition" }
					my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
					$sth->execute or $@ = $dbh->errstr;
					my $rv = $sth->fetchall_hashref($_);
					foreach my $key ( keys %{$rv} ) {
						my $sql = "UPDATE $tb SET $_=? WHERE $_=$key";
						my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
						$sth->execute(undef) or $@ = $dbh->errstr;
					}
					$dbh->commit
				}
			}
		}
	}
	my $sql;
	if ( 'undef' eq $condition ) { $sql = "DELETE FROM Controlo" }
	else { $sql = "DELETE FROM Controlo WHERE $condition" }
	my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
	my $res=$sth->execute or $@ = $dbh->errstr;
	$dbh->commit;
	$dbh->disconnect or warn $dbh->errstr;
	return $res;
}

# Preloaded methods go here.

=head2 update_Controlo

UPDATE

=cut

sub update_Controlo {
	my ($set, $condition) = @_;
	my @fields;
	my @values;

	while ($set =~ /\b(\w+)\s*=\s*['"](.*?)['"]/g) { push @fields,$1; push @values,$2 }
	if ( scalar(@fields) != scalar(@values) ) { $@ = "Invalid assignment in the set statement!"; return undef }
	my $i = 0;
	my $fgn;
	my $dbh = DBI->connect("dbi:SQLite:dbname=[DATABASE_PATH]","[DB_USERNAME]","[DB_PASSWORD]", { RaiseError => 1, AutoCommit => 0, unicode => 1 }) or die $DBI::errstr;

	foreach ( @fields ) {
		switch ( $db->{Controlo}->{'fields'}->{$_}->{'type'} ) {
			case /\bvarchar\b/i {
				if ( uc($db->{Controlo}->{'fields'}->{$_}->{'size'}) ne 'NULL' && length($values[$i]) > $db->{Controlo}->{'fields'}->{$_}->{'size'} ) {
					$dbh->disconnect or warn $dbh->errstr;
					$@ = "Varchar too large, $_ field can only have $db->{Controlo}->{'fields'}->{$_}->{'size'} characters!";
					return undef
				}
			}
			case /\binteger\b/i { if ( $values[$i] !~ /^\d+$/ ) { $dbh->disconnect or warn $dbh->errstr; $@ = "Invalid type found, $_ field is of type INTEGER!"; return undef } }
			case /\breal\b/i { if ( $values[$i] !~ /^\d+(\.\d+)?$/ ) { $dbh->disconnect or warn $dbh->errstr; $@ = "Invalid type found, $_ field is of type REAL!"; return undef } }
			else {}
		}
		OPT: foreach my $opt ( @{$db->{Controlo}->{'fields'}->{$_}->{'options'}} ) {
			switch ($opt) {
				case /\beditable\b/i       { $dbh->disconnect or warn $dbh->errstr; $@ = "$_ is not an editable field!"; return undef }
				case /\bvisible\b/i        { next }
				case /\bnull\b/i           { next }
				case /\bmasked\b/i         { next }
				case /\bauto_increment\b/i {
					my $sql = "SELECT $_ FROM Controlo WHERE $_=$values[$i]";
					my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
					$sth->execute or $@ = $dbh->errstr;
					my $rv = $sth->fetchall_hashref($_);
					if ( exists $rv->{$values[$i]} ) {
						$dbh->disconnect or warn $dbh->errstr;
						$@ = "$_ is an Auto increment field, $values[$i] value already found on the Controlo table!";
						return undef
					}
					else { next }
				}
				case /\boptional\b/i       {
					if ( uc($values[$i]) eq 'NULL' ) { $dbh->disconnect or warn $dbh->errstr; $@ = "$_ cannot be a null value!"; return undef }
					else { next }
				}
				case /\bunique\b/i         {
					my $sql = "SELECT $_ FROM Controlo WHERE $_=$values[$i]";
					my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
					$sth->execute or $@ = $dbh->errstr;
					my $rv = $sth->fetchall_hashref($_);
					if ( exists $rv->{$values[$i]} ) {
						$dbh->disconnect or warn $dbh->errstr;
						$@ = "$_ must have an Unique value, $values[$i] value already found on the Controlo table!";
						return undef
					}
					else { next }
				}
				else { next }
			}
		}
		if ( exists $db->{Controlo}->{'fgnkeys'}->{$_} ) {
			my $sql = "SELECT $_ FROM Controlo WHERE $condition";
			my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
			$sth->execute or $@ = $dbh->errstr;
			my $rv = $sth->fetchall_hashref($_);
			foreach my $key ( keys %{$rv} ) {
				$sql = "SELECT $_ FROM exists $db->{Controlo}->{'fgnkeys'}->{$_} WHERE $_=$key";
				$sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
				$sth->execute or $@ = $dbh->errstr;
				$rv = $sth->fetchall_hashref($_);
				if ( !exists $rv->{$values[$i]} ) {
					$dbh->disconnect or warn $dbh->errstr;
					$@ = "Foreign key $_ cannot be updated because '$values[$i]' key does not exist on the exists $db->{Controlo}->{'fgnkeys'}->{$_} table!";
					return undef
				}
				else { next }
			}
		}
		if ( exists $db->{Controlo}->{'primkeys'}->{$_} ) {
			my $sql = "SELECT $_ FROM Controlo WHERE $_=$values[$i]";
			my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
			$sth->execute or $@ = $dbh->errstr;
			my $rv = $sth->fetchall_hashref($_);
			if ( exists $rv->{$values[$i]} ) {
				$dbh->disconnect or warn $dbh->errstr;
				$@ = "Primary key $_ cannot be updated because '$values[$i]' key already exists on the Controlo table!";
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
		my $sql = "SELECT $_ FROM Controlo WHERE $condition";
		my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
		$sth->execute or $@ = $dbh->errstr;
		my $rv = $sth->fetchall_hashref($_);
		foreach my $key ( keys %{$rv} ) {
			$sql = "UPDATE $fgn->{$_}->{'table'} SET $_=? WHERE $_=$key";
			$sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
			$sth->execute($fgn->{$_}->{'value'}) or $@ = $dbh->errstr;
		}
		$dbh->commit
	}
	my $sql = "UPDATE Controlo SET $set WHERE $condition";
	my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
	my $res=$sth->execute or $@ = $dbh->errstr;
	$dbh->commit;
	$dbh->disconnect or warn $dbh->errstr;
	return $res;
}

# Preloaded methods go here.

=head2 select_Emissao

SELECT

=cut

sub select_Emissao {
	my ($condition, @fields) = @_;

	my $dbh = DBI->connect("dbi:SQLite:dbname=[DATABASE_PATH]","[DB_USERNAME]","[DB_PASSWORD]",{ RaiseError => 1, AutoCommit => 0, unicode => 1 }) or die $DBI::errstr;
	foreach (@fields) {
		if ( !exists $db->{Emissao}->{'fields'}->{$_} ) {
			$dbh->disconnect or warn $dbh->errstr;
			$@ = "Unknown field '$_' found while selecting data from Emissao table!";
			return undef
		}
		else { next }
	}
	my $sql;
	if ( 'undef' eq $condition ) { $sql = 'SELECT '.(join ',',@fields)." FROM Emissao" }
	else { $sql = 'SELECT '.(join ',',@fields)." FROM Emissao WHERE $condition" }

	my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
	$sth->execute or $@ = $dbh->errstr;
	my $rv = $sth->fetchall_hashref($fields[0]);
	$dbh->disconnect or warn $dbh->errstr;
	return $rv;
}

# Preloaded methods go here.

=head2 insert_Emissao

INSERT

=cut

sub insert_Emissao {
	my @fields = @_;
	my @tfield = keys %{$db->{Emissao}->{'fields'}};
	my $diff = scalar(@tfield) - scalar(@fields);

	if ( $diff < 0 ) { $@ = "Invalid number of fields submitted!"; return undef }
	my $i = 0;
	my @newfld;
	my $dbh = DBI->connect("dbi:SQLite:dbname=[DATABASE_PATH]","[DB_USERNAME]","[DB_PASSWORD]",{ RaiseError => 1, AutoCommit => 0, unicode => 1 }) or die $DBI::errstr;
	foreach ( @tfield ) {
		my $miss=0;
		switch ( $db->{Emissao}->{'fields'}->{$_}->{'type'} ) {
			case /\bvarchar\b/i {
				if ( uc($db->{Emissao}->{'fields'}->{$_}->{'size'}) ne 'NULL' && length($fields[$i]) > $db->{Emissao}->{'fields'}->{$_}->{'size'} ) {
					$dbh->disconnect or warn $dbh->errstr;
					$@ = "Varchar too large, $_ field can only have $db->{Emissao}->{'fields'}->{$_}->{'size'} characters!";
					return undef
				}
			}
			case /\binteger\b/i { if ( $fields[$i] !~ /^\d+$/ ) { $dbh->disconnect or warn $dbh->errstr; $@ = "Invalid type found, $_ field is of type INTEGER!"; return undef } }
			case /\breal\b/i { if ( $fields[$i] !~ /^\d+(\.\d+)?$/ ) { $dbh->disconnect or warn $dbh->errstr; $@ = "Invalid type found, $_ field is of type REAL!"; return undef } }
			else {}
		}
		OPT: foreach my $opt ( @{$db->{Emissao}->{'fields'}->{$_}->{'options'}} ) {
			switch ($opt) {
				case /\beditable\b/i       { next }
				case /\bvisible\b/i        { next }
				case /\bnull\b/i           { next }
				case /\bmasked\b/i         { next }
				case /\bauto_increment\b/i {
					if ( 0 == $diff ) {
						my $sql = "SELECT $_ FROM Emissao WHERE $_=$fields[$i]";
						my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
						$sth->execute or $@ = $dbh->errstr;
						my $rv = $sth->fetchall_hashref($_);
						if ( exists $rv->{$fields[$i]} ) {
							$dbh->disconnect or warn $dbh->errstr;
							$@ = "$_ is an Auto increment field, $fields[$i] value already found on the Emissao table!";
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
					my $sql = "SELECT $_ FROM Emissao WHERE $_=$fields[$i]";
					my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
					$sth->execute or $@ = $dbh->errstr;
					my $rv = $sth->fetchall_hashref($_);
					if ( exists $rv->{$fields[$i]} ) {
						$dbh->disconnect or warn $dbh->errstr;
						$@ = "$_ must have an Unique value, $fields[$i] value already found on the Emissao table!";
						return undef
					}
					else { next }
				}
				else { next }
			}
		}
		if ( 1 == $miss ) { $diff-- }
		else {
			if ( exists $db->{Emissao}->{'fgnkeys'}->{$_} ) {
				my $sql = "SELECT $_ FROM $db->{Emissao}->{'fgnkeys'}->{$_} WHERE $_=$fields[$i]";
				my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
				$sth->execute or $@ = $dbh->errstr;
				my $rv = $sth->fetchall_hashref($_);
				if ( !exists $rv->{$fields[$i]} ) {
					$dbh->disconnect or warn $dbh->errstr;
					$@ = "Foreign key $_ cannot be added because '$fields[$i]' key does not exist on the $db->{Emissao}->{'fgnkeys'}->{$_} table!";
					return undef
				}
			}
			if ( exists $db->{Emissao}->{'primkeys'}->{$_} ) {
				my $sql = "SELECT $_ FROM Emissao WHERE $_=$fields[$i]";
				my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
				$sth->execute or $@ = $dbh->errstr;
				my $rv = $sth->fetchall_hashref($_);
				if ( exists $rv->{$fields[$i]} ) {
					$dbh->disconnect or warn $dbh->errstr;
					$@ = "Primary key $_ cannot be added because '$fields[$i]' key already exists on the Emissao table!";
					return undef
				}
			}
			$i++;
			push @newfld, $_
		}
	}
	if ( $diff != 0 ) { $dbh->disconnect or warn $dbh->errstr; $@ = "Invalid number of fields submitted!"; return undef }
	my $sql = 'INSERT INTO Emissao('.(join ',',@newfld).') VALUES ('.(join ',',split / /, '? ' x scalar(@fields)).')';
	my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
	my $res=$sth->execute(@fields) or $@ = $dbh->errstr;
	$dbh->commit;
	$dbh->disconnect or warn $dbh->errstr;
	return $res;
}

# Preloaded methods go here.

=head2 delete_Emissao

DELETE

=cut

sub delete_Emissao {
	my $condition = shift;
	my $dbh = DBI->connect("dbi:SQLite:dbname=[DATABASE_PATH]","[DB_USERNAME]","[DB_PASSWORD]",{ RaiseError => 1, AutoCommit => 0, unicode => 1 }) or die $DBI::errstr;

	foreach ( keys %{$db->{Emissao}->{'primkeys'}} ) {
		foreach my $tb ( keys %{$db} ) {
			if ( exists $db->{$tb}->{'fgnkeys'}->{$_} ) {
				my $notnull = 0;
				foreach my $opt ( @{$db->{$tb}->{'fields'}->{$_}->{'options'}} ) {
					if ( $opt =~ /\boptional\b/i ) { $notnull = 1; last }
					else { next }
				}
				unless ( 1 == $notnull ) {
					my $sql;
					if ( 'undef' eq $condition ) { $sql = "SELECT $_ FROM Emissao" }
					else { $sql = "SELECT $_ FROM Emissao WHERE $condition" }
					my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
					$sth->execute or $@ = $dbh->errstr;
					my $rv = $sth->fetchall_hashref($_);
					foreach my $key ( keys %{$rv} ) {
						my $sql = "UPDATE $tb SET $_=? WHERE $_=$key";
						my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
						$sth->execute(undef) or $@ = $dbh->errstr;
					}
					$dbh->commit
				}
			}
		}
	}
	my $sql;
	if ( 'undef' eq $condition ) { $sql = "DELETE FROM Emissao" }
	else { $sql = "DELETE FROM Emissao WHERE $condition" }
	my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
	my $res=$sth->execute or $@ = $dbh->errstr;
	$dbh->commit;
	$dbh->disconnect or warn $dbh->errstr;
	return $res;
}

# Preloaded methods go here.

=head2 update_Emissao

UPDATE

=cut

sub update_Emissao {
	my ($set, $condition) = @_;
	my @fields;
	my @values;

	while ($set =~ /\b(\w+)\s*=\s*['"](.*?)['"]/g) { push @fields,$1; push @values,$2 }
	if ( scalar(@fields) != scalar(@values) ) { $@ = "Invalid assignment in the set statement!"; return undef }
	my $i = 0;
	my $fgn;
	my $dbh = DBI->connect("dbi:SQLite:dbname=[DATABASE_PATH]","[DB_USERNAME]","[DB_PASSWORD]", { RaiseError => 1, AutoCommit => 0, unicode => 1 }) or die $DBI::errstr;

	foreach ( @fields ) {
		switch ( $db->{Emissao}->{'fields'}->{$_}->{'type'} ) {
			case /\bvarchar\b/i {
				if ( uc($db->{Emissao}->{'fields'}->{$_}->{'size'}) ne 'NULL' && length($values[$i]) > $db->{Emissao}->{'fields'}->{$_}->{'size'} ) {
					$dbh->disconnect or warn $dbh->errstr;
					$@ = "Varchar too large, $_ field can only have $db->{Emissao}->{'fields'}->{$_}->{'size'} characters!";
					return undef
				}
			}
			case /\binteger\b/i { if ( $values[$i] !~ /^\d+$/ ) { $dbh->disconnect or warn $dbh->errstr; $@ = "Invalid type found, $_ field is of type INTEGER!"; return undef } }
			case /\breal\b/i { if ( $values[$i] !~ /^\d+(\.\d+)?$/ ) { $dbh->disconnect or warn $dbh->errstr; $@ = "Invalid type found, $_ field is of type REAL!"; return undef } }
			else {}
		}
		OPT: foreach my $opt ( @{$db->{Emissao}->{'fields'}->{$_}->{'options'}} ) {
			switch ($opt) {
				case /\beditable\b/i       { $dbh->disconnect or warn $dbh->errstr; $@ = "$_ is not an editable field!"; return undef }
				case /\bvisible\b/i        { next }
				case /\bnull\b/i           { next }
				case /\bmasked\b/i         { next }
				case /\bauto_increment\b/i {
					my $sql = "SELECT $_ FROM Emissao WHERE $_=$values[$i]";
					my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
					$sth->execute or $@ = $dbh->errstr;
					my $rv = $sth->fetchall_hashref($_);
					if ( exists $rv->{$values[$i]} ) {
						$dbh->disconnect or warn $dbh->errstr;
						$@ = "$_ is an Auto increment field, $values[$i] value already found on the Emissao table!";
						return undef
					}
					else { next }
				}
				case /\boptional\b/i       {
					if ( uc($values[$i]) eq 'NULL' ) { $dbh->disconnect or warn $dbh->errstr; $@ = "$_ cannot be a null value!"; return undef }
					else { next }
				}
				case /\bunique\b/i         {
					my $sql = "SELECT $_ FROM Emissao WHERE $_=$values[$i]";
					my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
					$sth->execute or $@ = $dbh->errstr;
					my $rv = $sth->fetchall_hashref($_);
					if ( exists $rv->{$values[$i]} ) {
						$dbh->disconnect or warn $dbh->errstr;
						$@ = "$_ must have an Unique value, $values[$i] value already found on the Emissao table!";
						return undef
					}
					else { next }
				}
				else { next }
			}
		}
		if ( exists $db->{Emissao}->{'fgnkeys'}->{$_} ) {
			my $sql = "SELECT $_ FROM Emissao WHERE $condition";
			my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
			$sth->execute or $@ = $dbh->errstr;
			my $rv = $sth->fetchall_hashref($_);
			foreach my $key ( keys %{$rv} ) {
				$sql = "SELECT $_ FROM exists $db->{Emissao}->{'fgnkeys'}->{$_} WHERE $_=$key";
				$sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
				$sth->execute or $@ = $dbh->errstr;
				$rv = $sth->fetchall_hashref($_);
				if ( !exists $rv->{$values[$i]} ) {
					$dbh->disconnect or warn $dbh->errstr;
					$@ = "Foreign key $_ cannot be updated because '$values[$i]' key does not exist on the exists $db->{Emissao}->{'fgnkeys'}->{$_} table!";
					return undef
				}
				else { next }
			}
		}
		if ( exists $db->{Emissao}->{'primkeys'}->{$_} ) {
			my $sql = "SELECT $_ FROM Emissao WHERE $_=$values[$i]";
			my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
			$sth->execute or $@ = $dbh->errstr;
			my $rv = $sth->fetchall_hashref($_);
			if ( exists $rv->{$values[$i]} ) {
				$dbh->disconnect or warn $dbh->errstr;
				$@ = "Primary key $_ cannot be updated because '$values[$i]' key already exists on the Emissao table!";
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
		my $sql = "SELECT $_ FROM Emissao WHERE $condition";
		my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
		$sth->execute or $@ = $dbh->errstr;
		my $rv = $sth->fetchall_hashref($_);
		foreach my $key ( keys %{$rv} ) {
			$sql = "UPDATE $fgn->{$_}->{'table'} SET $_=? WHERE $_=$key";
			$sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
			$sth->execute($fgn->{$_}->{'value'}) or $@ = $dbh->errstr;
		}
		$dbh->commit
	}
	my $sql = "UPDATE Emissao SET $set WHERE $condition";
	my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
	my $res=$sth->execute or $@ = $dbh->errstr;
	$dbh->commit;
	$dbh->disconnect or warn $dbh->errstr;
	return $res;
}

# Preloaded methods go here.

=head2 select_Recepcao

SELECT

=cut

sub select_Recepcao {
	my ($condition, @fields) = @_;

	my $dbh = DBI->connect("dbi:SQLite:dbname=[DATABASE_PATH]","[DB_USERNAME]","[DB_PASSWORD]",{ RaiseError => 1, AutoCommit => 0, unicode => 1 }) or die $DBI::errstr;
	foreach (@fields) {
		if ( !exists $db->{Recepcao}->{'fields'}->{$_} ) {
			$dbh->disconnect or warn $dbh->errstr;
			$@ = "Unknown field '$_' found while selecting data from Recepcao table!";
			return undef
		}
		else { next }
	}
	my $sql;
	if ( 'undef' eq $condition ) { $sql = 'SELECT '.(join ',',@fields)." FROM Recepcao" }
	else { $sql = 'SELECT '.(join ',',@fields)." FROM Recepcao WHERE $condition" }

	my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
	$sth->execute or $@ = $dbh->errstr;
	my $rv = $sth->fetchall_hashref($fields[0]);
	$dbh->disconnect or warn $dbh->errstr;
	return $rv;
}

# Preloaded methods go here.

=head2 insert_Recepcao

INSERT

=cut

sub insert_Recepcao {
	my @fields = @_;
	my @tfield = keys %{$db->{Recepcao}->{'fields'}};
	my $diff = scalar(@tfield) - scalar(@fields);

	if ( $diff < 0 ) { $@ = "Invalid number of fields submitted!"; return undef }
	my $i = 0;
	my @newfld;
	my $dbh = DBI->connect("dbi:SQLite:dbname=[DATABASE_PATH]","[DB_USERNAME]","[DB_PASSWORD]",{ RaiseError => 1, AutoCommit => 0, unicode => 1 }) or die $DBI::errstr;
	foreach ( @tfield ) {
		my $miss=0;
		switch ( $db->{Recepcao}->{'fields'}->{$_}->{'type'} ) {
			case /\bvarchar\b/i {
				if ( uc($db->{Recepcao}->{'fields'}->{$_}->{'size'}) ne 'NULL' && length($fields[$i]) > $db->{Recepcao}->{'fields'}->{$_}->{'size'} ) {
					$dbh->disconnect or warn $dbh->errstr;
					$@ = "Varchar too large, $_ field can only have $db->{Recepcao}->{'fields'}->{$_}->{'size'} characters!";
					return undef
				}
			}
			case /\binteger\b/i { if ( $fields[$i] !~ /^\d+$/ ) { $dbh->disconnect or warn $dbh->errstr; $@ = "Invalid type found, $_ field is of type INTEGER!"; return undef } }
			case /\breal\b/i { if ( $fields[$i] !~ /^\d+(\.\d+)?$/ ) { $dbh->disconnect or warn $dbh->errstr; $@ = "Invalid type found, $_ field is of type REAL!"; return undef } }
			else {}
		}
		OPT: foreach my $opt ( @{$db->{Recepcao}->{'fields'}->{$_}->{'options'}} ) {
			switch ($opt) {
				case /\beditable\b/i       { next }
				case /\bvisible\b/i        { next }
				case /\bnull\b/i           { next }
				case /\bmasked\b/i         { next }
				case /\bauto_increment\b/i {
					if ( 0 == $diff ) {
						my $sql = "SELECT $_ FROM Recepcao WHERE $_=$fields[$i]";
						my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
						$sth->execute or $@ = $dbh->errstr;
						my $rv = $sth->fetchall_hashref($_);
						if ( exists $rv->{$fields[$i]} ) {
							$dbh->disconnect or warn $dbh->errstr;
							$@ = "$_ is an Auto increment field, $fields[$i] value already found on the Recepcao table!";
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
					my $sql = "SELECT $_ FROM Recepcao WHERE $_=$fields[$i]";
					my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
					$sth->execute or $@ = $dbh->errstr;
					my $rv = $sth->fetchall_hashref($_);
					if ( exists $rv->{$fields[$i]} ) {
						$dbh->disconnect or warn $dbh->errstr;
						$@ = "$_ must have an Unique value, $fields[$i] value already found on the Recepcao table!";
						return undef
					}
					else { next }
				}
				else { next }
			}
		}
		if ( 1 == $miss ) { $diff-- }
		else {
			if ( exists $db->{Recepcao}->{'fgnkeys'}->{$_} ) {
				my $sql = "SELECT $_ FROM $db->{Recepcao}->{'fgnkeys'}->{$_} WHERE $_=$fields[$i]";
				my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
				$sth->execute or $@ = $dbh->errstr;
				my $rv = $sth->fetchall_hashref($_);
				if ( !exists $rv->{$fields[$i]} ) {
					$dbh->disconnect or warn $dbh->errstr;
					$@ = "Foreign key $_ cannot be added because '$fields[$i]' key does not exist on the $db->{Recepcao}->{'fgnkeys'}->{$_} table!";
					return undef
				}
			}
			if ( exists $db->{Recepcao}->{'primkeys'}->{$_} ) {
				my $sql = "SELECT $_ FROM Recepcao WHERE $_=$fields[$i]";
				my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
				$sth->execute or $@ = $dbh->errstr;
				my $rv = $sth->fetchall_hashref($_);
				if ( exists $rv->{$fields[$i]} ) {
					$dbh->disconnect or warn $dbh->errstr;
					$@ = "Primary key $_ cannot be added because '$fields[$i]' key already exists on the Recepcao table!";
					return undef
				}
			}
			$i++;
			push @newfld, $_
		}
	}
	if ( $diff != 0 ) { $dbh->disconnect or warn $dbh->errstr; $@ = "Invalid number of fields submitted!"; return undef }
	my $sql = 'INSERT INTO Recepcao('.(join ',',@newfld).') VALUES ('.(join ',',split / /, '? ' x scalar(@fields)).')';
	my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
	my $res=$sth->execute(@fields) or $@ = $dbh->errstr;
	$dbh->commit;
	$dbh->disconnect or warn $dbh->errstr;
	return $res;
}

# Preloaded methods go here.

=head2 delete_Recepcao

DELETE

=cut

sub delete_Recepcao {
	my $condition = shift;
	my $dbh = DBI->connect("dbi:SQLite:dbname=[DATABASE_PATH]","[DB_USERNAME]","[DB_PASSWORD]",{ RaiseError => 1, AutoCommit => 0, unicode => 1 }) or die $DBI::errstr;

	foreach ( keys %{$db->{Recepcao}->{'primkeys'}} ) {
		foreach my $tb ( keys %{$db} ) {
			if ( exists $db->{$tb}->{'fgnkeys'}->{$_} ) {
				my $notnull = 0;
				foreach my $opt ( @{$db->{$tb}->{'fields'}->{$_}->{'options'}} ) {
					if ( $opt =~ /\boptional\b/i ) { $notnull = 1; last }
					else { next }
				}
				unless ( 1 == $notnull ) {
					my $sql;
					if ( 'undef' eq $condition ) { $sql = "SELECT $_ FROM Recepcao" }
					else { $sql = "SELECT $_ FROM Recepcao WHERE $condition" }
					my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
					$sth->execute or $@ = $dbh->errstr;
					my $rv = $sth->fetchall_hashref($_);
					foreach my $key ( keys %{$rv} ) {
						my $sql = "UPDATE $tb SET $_=? WHERE $_=$key";
						my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
						$sth->execute(undef) or $@ = $dbh->errstr;
					}
					$dbh->commit
				}
			}
		}
	}
	my $sql;
	if ( 'undef' eq $condition ) { $sql = "DELETE FROM Recepcao" }
	else { $sql = "DELETE FROM Recepcao WHERE $condition" }
	my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
	my $res=$sth->execute or $@ = $dbh->errstr;
	$dbh->commit;
	$dbh->disconnect or warn $dbh->errstr;
	return $res;
}

# Preloaded methods go here.

=head2 update_Recepcao

UPDATE

=cut

sub update_Recepcao {
	my ($set, $condition) = @_;
	my @fields;
	my @values;

	while ($set =~ /\b(\w+)\s*=\s*['"](.*?)['"]/g) { push @fields,$1; push @values,$2 }
	if ( scalar(@fields) != scalar(@values) ) { $@ = "Invalid assignment in the set statement!"; return undef }
	my $i = 0;
	my $fgn;
	my $dbh = DBI->connect("dbi:SQLite:dbname=[DATABASE_PATH]","[DB_USERNAME]","[DB_PASSWORD]", { RaiseError => 1, AutoCommit => 0, unicode => 1 }) or die $DBI::errstr;

	foreach ( @fields ) {
		switch ( $db->{Recepcao}->{'fields'}->{$_}->{'type'} ) {
			case /\bvarchar\b/i {
				if ( uc($db->{Recepcao}->{'fields'}->{$_}->{'size'}) ne 'NULL' && length($values[$i]) > $db->{Recepcao}->{'fields'}->{$_}->{'size'} ) {
					$dbh->disconnect or warn $dbh->errstr;
					$@ = "Varchar too large, $_ field can only have $db->{Recepcao}->{'fields'}->{$_}->{'size'} characters!";
					return undef
				}
			}
			case /\binteger\b/i { if ( $values[$i] !~ /^\d+$/ ) { $dbh->disconnect or warn $dbh->errstr; $@ = "Invalid type found, $_ field is of type INTEGER!"; return undef } }
			case /\breal\b/i { if ( $values[$i] !~ /^\d+(\.\d+)?$/ ) { $dbh->disconnect or warn $dbh->errstr; $@ = "Invalid type found, $_ field is of type REAL!"; return undef } }
			else {}
		}
		OPT: foreach my $opt ( @{$db->{Recepcao}->{'fields'}->{$_}->{'options'}} ) {
			switch ($opt) {
				case /\beditable\b/i       { $dbh->disconnect or warn $dbh->errstr; $@ = "$_ is not an editable field!"; return undef }
				case /\bvisible\b/i        { next }
				case /\bnull\b/i           { next }
				case /\bmasked\b/i         { next }
				case /\bauto_increment\b/i {
					my $sql = "SELECT $_ FROM Recepcao WHERE $_=$values[$i]";
					my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
					$sth->execute or $@ = $dbh->errstr;
					my $rv = $sth->fetchall_hashref($_);
					if ( exists $rv->{$values[$i]} ) {
						$dbh->disconnect or warn $dbh->errstr;
						$@ = "$_ is an Auto increment field, $values[$i] value already found on the Recepcao table!";
						return undef
					}
					else { next }
				}
				case /\boptional\b/i       {
					if ( uc($values[$i]) eq 'NULL' ) { $dbh->disconnect or warn $dbh->errstr; $@ = "$_ cannot be a null value!"; return undef }
					else { next }
				}
				case /\bunique\b/i         {
					my $sql = "SELECT $_ FROM Recepcao WHERE $_=$values[$i]";
					my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
					$sth->execute or $@ = $dbh->errstr;
					my $rv = $sth->fetchall_hashref($_);
					if ( exists $rv->{$values[$i]} ) {
						$dbh->disconnect or warn $dbh->errstr;
						$@ = "$_ must have an Unique value, $values[$i] value already found on the Recepcao table!";
						return undef
					}
					else { next }
				}
				else { next }
			}
		}
		if ( exists $db->{Recepcao}->{'fgnkeys'}->{$_} ) {
			my $sql = "SELECT $_ FROM Recepcao WHERE $condition";
			my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
			$sth->execute or $@ = $dbh->errstr;
			my $rv = $sth->fetchall_hashref($_);
			foreach my $key ( keys %{$rv} ) {
				$sql = "SELECT $_ FROM exists $db->{Recepcao}->{'fgnkeys'}->{$_} WHERE $_=$key";
				$sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
				$sth->execute or $@ = $dbh->errstr;
				$rv = $sth->fetchall_hashref($_);
				if ( !exists $rv->{$values[$i]} ) {
					$dbh->disconnect or warn $dbh->errstr;
					$@ = "Foreign key $_ cannot be updated because '$values[$i]' key does not exist on the exists $db->{Recepcao}->{'fgnkeys'}->{$_} table!";
					return undef
				}
				else { next }
			}
		}
		if ( exists $db->{Recepcao}->{'primkeys'}->{$_} ) {
			my $sql = "SELECT $_ FROM Recepcao WHERE $_=$values[$i]";
			my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
			$sth->execute or $@ = $dbh->errstr;
			my $rv = $sth->fetchall_hashref($_);
			if ( exists $rv->{$values[$i]} ) {
				$dbh->disconnect or warn $dbh->errstr;
				$@ = "Primary key $_ cannot be updated because '$values[$i]' key already exists on the Recepcao table!";
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
		my $sql = "SELECT $_ FROM Recepcao WHERE $condition";
		my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
		$sth->execute or $@ = $dbh->errstr;
		my $rv = $sth->fetchall_hashref($_);
		foreach my $key ( keys %{$rv} ) {
			$sql = "UPDATE $fgn->{$_}->{'table'} SET $_=? WHERE $_=$key";
			$sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
			$sth->execute($fgn->{$_}->{'value'}) or $@ = $dbh->errstr;
		}
		$dbh->commit
	}
	my $sql = "UPDATE Recepcao SET $set WHERE $condition";
	my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
	my $res=$sth->execute or $@ = $dbh->errstr;
	$dbh->commit;
	$dbh->disconnect or warn $dbh->errstr;
	return $res;
}

# Preloaded methods go here.

=head2 select_Registo

SELECT

=cut

sub select_Registo {
	my ($condition, @fields) = @_;

	my $dbh = DBI->connect("dbi:SQLite:dbname=[DATABASE_PATH]","[DB_USERNAME]","[DB_PASSWORD]",{ RaiseError => 1, AutoCommit => 0, unicode => 1 }) or die $DBI::errstr;
	foreach (@fields) {
		if ( !exists $db->{Registo}->{'fields'}->{$_} ) {
			$dbh->disconnect or warn $dbh->errstr;
			$@ = "Unknown field '$_' found while selecting data from Registo table!";
			return undef
		}
		else { next }
	}
	my $sql;
	if ( 'undef' eq $condition ) { $sql = 'SELECT '.(join ',',@fields)." FROM Registo" }
	else { $sql = 'SELECT '.(join ',',@fields)." FROM Registo WHERE $condition" }

	my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
	$sth->execute or $@ = $dbh->errstr;
	my $rv = $sth->fetchall_hashref($fields[0]);
	$dbh->disconnect or warn $dbh->errstr;
	return $rv;
}

# Preloaded methods go here.

=head2 insert_Registo

INSERT

=cut

sub insert_Registo {
	my @fields = @_;
	my @tfield = keys %{$db->{Registo}->{'fields'}};
	my $diff = scalar(@tfield) - scalar(@fields);

	if ( $diff < 0 ) { $@ = "Invalid number of fields submitted!"; return undef }
	my $i = 0;
	my @newfld;
	my $dbh = DBI->connect("dbi:SQLite:dbname=[DATABASE_PATH]","[DB_USERNAME]","[DB_PASSWORD]",{ RaiseError => 1, AutoCommit => 0, unicode => 1 }) or die $DBI::errstr;
	foreach ( @tfield ) {
		my $miss=0;
		switch ( $db->{Registo}->{'fields'}->{$_}->{'type'} ) {
			case /\bvarchar\b/i {
				if ( uc($db->{Registo}->{'fields'}->{$_}->{'size'}) ne 'NULL' && length($fields[$i]) > $db->{Registo}->{'fields'}->{$_}->{'size'} ) {
					$dbh->disconnect or warn $dbh->errstr;
					$@ = "Varchar too large, $_ field can only have $db->{Registo}->{'fields'}->{$_}->{'size'} characters!";
					return undef
				}
			}
			case /\binteger\b/i { if ( $fields[$i] !~ /^\d+$/ ) { $dbh->disconnect or warn $dbh->errstr; $@ = "Invalid type found, $_ field is of type INTEGER!"; return undef } }
			case /\breal\b/i { if ( $fields[$i] !~ /^\d+(\.\d+)?$/ ) { $dbh->disconnect or warn $dbh->errstr; $@ = "Invalid type found, $_ field is of type REAL!"; return undef } }
			else {}
		}
		OPT: foreach my $opt ( @{$db->{Registo}->{'fields'}->{$_}->{'options'}} ) {
			switch ($opt) {
				case /\beditable\b/i       { next }
				case /\bvisible\b/i        { next }
				case /\bnull\b/i           { next }
				case /\bmasked\b/i         { next }
				case /\bauto_increment\b/i {
					if ( 0 == $diff ) {
						my $sql = "SELECT $_ FROM Registo WHERE $_=$fields[$i]";
						my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
						$sth->execute or $@ = $dbh->errstr;
						my $rv = $sth->fetchall_hashref($_);
						if ( exists $rv->{$fields[$i]} ) {
							$dbh->disconnect or warn $dbh->errstr;
							$@ = "$_ is an Auto increment field, $fields[$i] value already found on the Registo table!";
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
					my $sql = "SELECT $_ FROM Registo WHERE $_=$fields[$i]";
					my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
					$sth->execute or $@ = $dbh->errstr;
					my $rv = $sth->fetchall_hashref($_);
					if ( exists $rv->{$fields[$i]} ) {
						$dbh->disconnect or warn $dbh->errstr;
						$@ = "$_ must have an Unique value, $fields[$i] value already found on the Registo table!";
						return undef
					}
					else { next }
				}
				else { next }
			}
		}
		if ( 1 == $miss ) { $diff-- }
		else {
			if ( exists $db->{Registo}->{'fgnkeys'}->{$_} ) {
				my $sql = "SELECT $_ FROM $db->{Registo}->{'fgnkeys'}->{$_} WHERE $_=$fields[$i]";
				my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
				$sth->execute or $@ = $dbh->errstr;
				my $rv = $sth->fetchall_hashref($_);
				if ( !exists $rv->{$fields[$i]} ) {
					$dbh->disconnect or warn $dbh->errstr;
					$@ = "Foreign key $_ cannot be added because '$fields[$i]' key does not exist on the $db->{Registo}->{'fgnkeys'}->{$_} table!";
					return undef
				}
			}
			if ( exists $db->{Registo}->{'primkeys'}->{$_} ) {
				my $sql = "SELECT $_ FROM Registo WHERE $_=$fields[$i]";
				my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
				$sth->execute or $@ = $dbh->errstr;
				my $rv = $sth->fetchall_hashref($_);
				if ( exists $rv->{$fields[$i]} ) {
					$dbh->disconnect or warn $dbh->errstr;
					$@ = "Primary key $_ cannot be added because '$fields[$i]' key already exists on the Registo table!";
					return undef
				}
			}
			$i++;
			push @newfld, $_
		}
	}
	if ( $diff != 0 ) { $dbh->disconnect or warn $dbh->errstr; $@ = "Invalid number of fields submitted!"; return undef }
	my $sql = 'INSERT INTO Registo('.(join ',',@newfld).') VALUES ('.(join ',',split / /, '? ' x scalar(@fields)).')';
	my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
	my $res=$sth->execute(@fields) or $@ = $dbh->errstr;
	$dbh->commit;
	$dbh->disconnect or warn $dbh->errstr;
	return $res;
}

# Preloaded methods go here.

=head2 delete_Registo

DELETE

=cut

sub delete_Registo {
	my $condition = shift;
	my $dbh = DBI->connect("dbi:SQLite:dbname=[DATABASE_PATH]","[DB_USERNAME]","[DB_PASSWORD]",{ RaiseError => 1, AutoCommit => 0, unicode => 1 }) or die $DBI::errstr;

	foreach ( keys %{$db->{Registo}->{'primkeys'}} ) {
		foreach my $tb ( keys %{$db} ) {
			if ( exists $db->{$tb}->{'fgnkeys'}->{$_} ) {
				my $notnull = 0;
				foreach my $opt ( @{$db->{$tb}->{'fields'}->{$_}->{'options'}} ) {
					if ( $opt =~ /\boptional\b/i ) { $notnull = 1; last }
					else { next }
				}
				unless ( 1 == $notnull ) {
					my $sql;
					if ( 'undef' eq $condition ) { $sql = "SELECT $_ FROM Registo" }
					else { $sql = "SELECT $_ FROM Registo WHERE $condition" }
					my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
					$sth->execute or $@ = $dbh->errstr;
					my $rv = $sth->fetchall_hashref($_);
					foreach my $key ( keys %{$rv} ) {
						my $sql = "UPDATE $tb SET $_=? WHERE $_=$key";
						my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
						$sth->execute(undef) or $@ = $dbh->errstr;
					}
					$dbh->commit
				}
			}
		}
	}
	my $sql;
	if ( 'undef' eq $condition ) { $sql = "DELETE FROM Registo" }
	else { $sql = "DELETE FROM Registo WHERE $condition" }
	my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
	my $res=$sth->execute or $@ = $dbh->errstr;
	$dbh->commit;
	$dbh->disconnect or warn $dbh->errstr;
	return $res;
}

# Preloaded methods go here.

=head2 update_Registo

UPDATE

=cut

sub update_Registo {
	my ($set, $condition) = @_;
	my @fields;
	my @values;

	while ($set =~ /\b(\w+)\s*=\s*['"](.*?)['"]/g) { push @fields,$1; push @values,$2 }
	if ( scalar(@fields) != scalar(@values) ) { $@ = "Invalid assignment in the set statement!"; return undef }
	my $i = 0;
	my $fgn;
	my $dbh = DBI->connect("dbi:SQLite:dbname=[DATABASE_PATH]","[DB_USERNAME]","[DB_PASSWORD]", { RaiseError => 1, AutoCommit => 0, unicode => 1 }) or die $DBI::errstr;

	foreach ( @fields ) {
		switch ( $db->{Registo}->{'fields'}->{$_}->{'type'} ) {
			case /\bvarchar\b/i {
				if ( uc($db->{Registo}->{'fields'}->{$_}->{'size'}) ne 'NULL' && length($values[$i]) > $db->{Registo}->{'fields'}->{$_}->{'size'} ) {
					$dbh->disconnect or warn $dbh->errstr;
					$@ = "Varchar too large, $_ field can only have $db->{Registo}->{'fields'}->{$_}->{'size'} characters!";
					return undef
				}
			}
			case /\binteger\b/i { if ( $values[$i] !~ /^\d+$/ ) { $dbh->disconnect or warn $dbh->errstr; $@ = "Invalid type found, $_ field is of type INTEGER!"; return undef } }
			case /\breal\b/i { if ( $values[$i] !~ /^\d+(\.\d+)?$/ ) { $dbh->disconnect or warn $dbh->errstr; $@ = "Invalid type found, $_ field is of type REAL!"; return undef } }
			else {}
		}
		OPT: foreach my $opt ( @{$db->{Registo}->{'fields'}->{$_}->{'options'}} ) {
			switch ($opt) {
				case /\beditable\b/i       { $dbh->disconnect or warn $dbh->errstr; $@ = "$_ is not an editable field!"; return undef }
				case /\bvisible\b/i        { next }
				case /\bnull\b/i           { next }
				case /\bmasked\b/i         { next }
				case /\bauto_increment\b/i {
					my $sql = "SELECT $_ FROM Registo WHERE $_=$values[$i]";
					my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
					$sth->execute or $@ = $dbh->errstr;
					my $rv = $sth->fetchall_hashref($_);
					if ( exists $rv->{$values[$i]} ) {
						$dbh->disconnect or warn $dbh->errstr;
						$@ = "$_ is an Auto increment field, $values[$i] value already found on the Registo table!";
						return undef
					}
					else { next }
				}
				case /\boptional\b/i       {
					if ( uc($values[$i]) eq 'NULL' ) { $dbh->disconnect or warn $dbh->errstr; $@ = "$_ cannot be a null value!"; return undef }
					else { next }
				}
				case /\bunique\b/i         {
					my $sql = "SELECT $_ FROM Registo WHERE $_=$values[$i]";
					my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
					$sth->execute or $@ = $dbh->errstr;
					my $rv = $sth->fetchall_hashref($_);
					if ( exists $rv->{$values[$i]} ) {
						$dbh->disconnect or warn $dbh->errstr;
						$@ = "$_ must have an Unique value, $values[$i] value already found on the Registo table!";
						return undef
					}
					else { next }
				}
				else { next }
			}
		}
		if ( exists $db->{Registo}->{'fgnkeys'}->{$_} ) {
			my $sql = "SELECT $_ FROM Registo WHERE $condition";
			my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
			$sth->execute or $@ = $dbh->errstr;
			my $rv = $sth->fetchall_hashref($_);
			foreach my $key ( keys %{$rv} ) {
				$sql = "SELECT $_ FROM exists $db->{Registo}->{'fgnkeys'}->{$_} WHERE $_=$key";
				$sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
				$sth->execute or $@ = $dbh->errstr;
				$rv = $sth->fetchall_hashref($_);
				if ( !exists $rv->{$values[$i]} ) {
					$dbh->disconnect or warn $dbh->errstr;
					$@ = "Foreign key $_ cannot be updated because '$values[$i]' key does not exist on the exists $db->{Registo}->{'fgnkeys'}->{$_} table!";
					return undef
				}
				else { next }
			}
		}
		if ( exists $db->{Registo}->{'primkeys'}->{$_} ) {
			my $sql = "SELECT $_ FROM Registo WHERE $_=$values[$i]";
			my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
			$sth->execute or $@ = $dbh->errstr;
			my $rv = $sth->fetchall_hashref($_);
			if ( exists $rv->{$values[$i]} ) {
				$dbh->disconnect or warn $dbh->errstr;
				$@ = "Primary key $_ cannot be updated because '$values[$i]' key already exists on the Registo table!";
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
		my $sql = "SELECT $_ FROM Registo WHERE $condition";
		my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
		$sth->execute or $@ = $dbh->errstr;
		my $rv = $sth->fetchall_hashref($_);
		foreach my $key ( keys %{$rv} ) {
			$sql = "UPDATE $fgn->{$_}->{'table'} SET $_=? WHERE $_=$key";
			$sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
			$sth->execute($fgn->{$_}->{'value'}) or $@ = $dbh->errstr;
		}
		$dbh->commit
	}
	my $sql = "UPDATE Registo SET $set WHERE $condition";
	my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
	my $res=$sth->execute or $@ = $dbh->errstr;
	$dbh->commit;
	$dbh->disconnect or warn $dbh->errstr;
	return $res;
}

# Preloaded methods go here.

=head2 select_Entidade

SELECT

=cut

sub select_Entidade {
	my ($condition, @fields) = @_;

	my $dbh = DBI->connect("dbi:SQLite:dbname=[DATABASE_PATH]","[DB_USERNAME]","[DB_PASSWORD]",{ RaiseError => 1, AutoCommit => 0, unicode => 1 }) or die $DBI::errstr;
	foreach (@fields) {
		if ( !exists $db->{Entidade}->{'fields'}->{$_} ) {
			$dbh->disconnect or warn $dbh->errstr;
			$@ = "Unknown field '$_' found while selecting data from Entidade table!";
			return undef
		}
		else { next }
	}
	my $sql;
	if ( 'undef' eq $condition ) { $sql = 'SELECT '.(join ',',@fields)." FROM Entidade" }
	else { $sql = 'SELECT '.(join ',',@fields)." FROM Entidade WHERE $condition" }

	my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
	$sth->execute or $@ = $dbh->errstr;
	my $rv = $sth->fetchall_hashref($fields[0]);
	$dbh->disconnect or warn $dbh->errstr;
	return $rv;
}

# Preloaded methods go here.

=head2 insert_Entidade

INSERT

=cut

sub insert_Entidade {
	my @fields = @_;
	my @tfield = keys %{$db->{Entidade}->{'fields'}};
	my $diff = scalar(@tfield) - scalar(@fields);

	if ( $diff < 0 ) { $@ = "Invalid number of fields submitted!"; return undef }
	my $i = 0;
	my @newfld;
	my $dbh = DBI->connect("dbi:SQLite:dbname=[DATABASE_PATH]","[DB_USERNAME]","[DB_PASSWORD]",{ RaiseError => 1, AutoCommit => 0, unicode => 1 }) or die $DBI::errstr;
	foreach ( @tfield ) {
		my $miss=0;
		switch ( $db->{Entidade}->{'fields'}->{$_}->{'type'} ) {
			case /\bvarchar\b/i {
				if ( uc($db->{Entidade}->{'fields'}->{$_}->{'size'}) ne 'NULL' && length($fields[$i]) > $db->{Entidade}->{'fields'}->{$_}->{'size'} ) {
					$dbh->disconnect or warn $dbh->errstr;
					$@ = "Varchar too large, $_ field can only have $db->{Entidade}->{'fields'}->{$_}->{'size'} characters!";
					return undef
				}
			}
			case /\binteger\b/i { if ( $fields[$i] !~ /^\d+$/ ) { $dbh->disconnect or warn $dbh->errstr; $@ = "Invalid type found, $_ field is of type INTEGER!"; return undef } }
			case /\breal\b/i { if ( $fields[$i] !~ /^\d+(\.\d+)?$/ ) { $dbh->disconnect or warn $dbh->errstr; $@ = "Invalid type found, $_ field is of type REAL!"; return undef } }
			else {}
		}
		OPT: foreach my $opt ( @{$db->{Entidade}->{'fields'}->{$_}->{'options'}} ) {
			switch ($opt) {
				case /\beditable\b/i       { next }
				case /\bvisible\b/i        { next }
				case /\bnull\b/i           { next }
				case /\bmasked\b/i         { next }
				case /\bauto_increment\b/i {
					if ( 0 == $diff ) {
						my $sql = "SELECT $_ FROM Entidade WHERE $_=$fields[$i]";
						my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
						$sth->execute or $@ = $dbh->errstr;
						my $rv = $sth->fetchall_hashref($_);
						if ( exists $rv->{$fields[$i]} ) {
							$dbh->disconnect or warn $dbh->errstr;
							$@ = "$_ is an Auto increment field, $fields[$i] value already found on the Entidade table!";
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
					my $sql = "SELECT $_ FROM Entidade WHERE $_=$fields[$i]";
					my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
					$sth->execute or $@ = $dbh->errstr;
					my $rv = $sth->fetchall_hashref($_);
					if ( exists $rv->{$fields[$i]} ) {
						$dbh->disconnect or warn $dbh->errstr;
						$@ = "$_ must have an Unique value, $fields[$i] value already found on the Entidade table!";
						return undef
					}
					else { next }
				}
				else { next }
			}
		}
		if ( 1 == $miss ) { $diff-- }
		else {
			if ( exists $db->{Entidade}->{'fgnkeys'}->{$_} ) {
				my $sql = "SELECT $_ FROM $db->{Entidade}->{'fgnkeys'}->{$_} WHERE $_=$fields[$i]";
				my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
				$sth->execute or $@ = $dbh->errstr;
				my $rv = $sth->fetchall_hashref($_);
				if ( !exists $rv->{$fields[$i]} ) {
					$dbh->disconnect or warn $dbh->errstr;
					$@ = "Foreign key $_ cannot be added because '$fields[$i]' key does not exist on the $db->{Entidade}->{'fgnkeys'}->{$_} table!";
					return undef
				}
			}
			if ( exists $db->{Entidade}->{'primkeys'}->{$_} ) {
				my $sql = "SELECT $_ FROM Entidade WHERE $_=$fields[$i]";
				my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
				$sth->execute or $@ = $dbh->errstr;
				my $rv = $sth->fetchall_hashref($_);
				if ( exists $rv->{$fields[$i]} ) {
					$dbh->disconnect or warn $dbh->errstr;
					$@ = "Primary key $_ cannot be added because '$fields[$i]' key already exists on the Entidade table!";
					return undef
				}
			}
			$i++;
			push @newfld, $_
		}
	}
	if ( $diff != 0 ) { $dbh->disconnect or warn $dbh->errstr; $@ = "Invalid number of fields submitted!"; return undef }
	my $sql = 'INSERT INTO Entidade('.(join ',',@newfld).') VALUES ('.(join ',',split / /, '? ' x scalar(@fields)).')';
	my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
	my $res=$sth->execute(@fields) or $@ = $dbh->errstr;
	$dbh->commit;
	$dbh->disconnect or warn $dbh->errstr;
	return $res;
}

# Preloaded methods go here.

=head2 delete_Entidade

DELETE

=cut

sub delete_Entidade {
	my $condition = shift;
	my $dbh = DBI->connect("dbi:SQLite:dbname=[DATABASE_PATH]","[DB_USERNAME]","[DB_PASSWORD]",{ RaiseError => 1, AutoCommit => 0, unicode => 1 }) or die $DBI::errstr;

	foreach ( keys %{$db->{Entidade}->{'primkeys'}} ) {
		foreach my $tb ( keys %{$db} ) {
			if ( exists $db->{$tb}->{'fgnkeys'}->{$_} ) {
				my $notnull = 0;
				foreach my $opt ( @{$db->{$tb}->{'fields'}->{$_}->{'options'}} ) {
					if ( $opt =~ /\boptional\b/i ) { $notnull = 1; last }
					else { next }
				}
				unless ( 1 == $notnull ) {
					my $sql;
					if ( 'undef' eq $condition ) { $sql = "SELECT $_ FROM Entidade" }
					else { $sql = "SELECT $_ FROM Entidade WHERE $condition" }
					my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
					$sth->execute or $@ = $dbh->errstr;
					my $rv = $sth->fetchall_hashref($_);
					foreach my $key ( keys %{$rv} ) {
						my $sql = "UPDATE $tb SET $_=? WHERE $_=$key";
						my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
						$sth->execute(undef) or $@ = $dbh->errstr;
					}
					$dbh->commit
				}
			}
		}
	}
	my $sql;
	if ( 'undef' eq $condition ) { $sql = "DELETE FROM Entidade" }
	else { $sql = "DELETE FROM Entidade WHERE $condition" }
	my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
	my $res=$sth->execute or $@ = $dbh->errstr;
	$dbh->commit;
	$dbh->disconnect or warn $dbh->errstr;
	return $res;
}

# Preloaded methods go here.

=head2 update_Entidade

UPDATE

=cut

sub update_Entidade {
	my ($set, $condition) = @_;
	my @fields;
	my @values;

	while ($set =~ /\b(\w+)\s*=\s*['"](.*?)['"]/g) { push @fields,$1; push @values,$2 }
	if ( scalar(@fields) != scalar(@values) ) { $@ = "Invalid assignment in the set statement!"; return undef }
	my $i = 0;
	my $fgn;
	my $dbh = DBI->connect("dbi:SQLite:dbname=[DATABASE_PATH]","[DB_USERNAME]","[DB_PASSWORD]", { RaiseError => 1, AutoCommit => 0, unicode => 1 }) or die $DBI::errstr;

	foreach ( @fields ) {
		switch ( $db->{Entidade}->{'fields'}->{$_}->{'type'} ) {
			case /\bvarchar\b/i {
				if ( uc($db->{Entidade}->{'fields'}->{$_}->{'size'}) ne 'NULL' && length($values[$i]) > $db->{Entidade}->{'fields'}->{$_}->{'size'} ) {
					$dbh->disconnect or warn $dbh->errstr;
					$@ = "Varchar too large, $_ field can only have $db->{Entidade}->{'fields'}->{$_}->{'size'} characters!";
					return undef
				}
			}
			case /\binteger\b/i { if ( $values[$i] !~ /^\d+$/ ) { $dbh->disconnect or warn $dbh->errstr; $@ = "Invalid type found, $_ field is of type INTEGER!"; return undef } }
			case /\breal\b/i { if ( $values[$i] !~ /^\d+(\.\d+)?$/ ) { $dbh->disconnect or warn $dbh->errstr; $@ = "Invalid type found, $_ field is of type REAL!"; return undef } }
			else {}
		}
		OPT: foreach my $opt ( @{$db->{Entidade}->{'fields'}->{$_}->{'options'}} ) {
			switch ($opt) {
				case /\beditable\b/i       { $dbh->disconnect or warn $dbh->errstr; $@ = "$_ is not an editable field!"; return undef }
				case /\bvisible\b/i        { next }
				case /\bnull\b/i           { next }
				case /\bmasked\b/i         { next }
				case /\bauto_increment\b/i {
					my $sql = "SELECT $_ FROM Entidade WHERE $_=$values[$i]";
					my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
					$sth->execute or $@ = $dbh->errstr;
					my $rv = $sth->fetchall_hashref($_);
					if ( exists $rv->{$values[$i]} ) {
						$dbh->disconnect or warn $dbh->errstr;
						$@ = "$_ is an Auto increment field, $values[$i] value already found on the Entidade table!";
						return undef
					}
					else { next }
				}
				case /\boptional\b/i       {
					if ( uc($values[$i]) eq 'NULL' ) { $dbh->disconnect or warn $dbh->errstr; $@ = "$_ cannot be a null value!"; return undef }
					else { next }
				}
				case /\bunique\b/i         {
					my $sql = "SELECT $_ FROM Entidade WHERE $_=$values[$i]";
					my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
					$sth->execute or $@ = $dbh->errstr;
					my $rv = $sth->fetchall_hashref($_);
					if ( exists $rv->{$values[$i]} ) {
						$dbh->disconnect or warn $dbh->errstr;
						$@ = "$_ must have an Unique value, $values[$i] value already found on the Entidade table!";
						return undef
					}
					else { next }
				}
				else { next }
			}
		}
		if ( exists $db->{Entidade}->{'fgnkeys'}->{$_} ) {
			my $sql = "SELECT $_ FROM Entidade WHERE $condition";
			my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
			$sth->execute or $@ = $dbh->errstr;
			my $rv = $sth->fetchall_hashref($_);
			foreach my $key ( keys %{$rv} ) {
				$sql = "SELECT $_ FROM exists $db->{Entidade}->{'fgnkeys'}->{$_} WHERE $_=$key";
				$sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
				$sth->execute or $@ = $dbh->errstr;
				$rv = $sth->fetchall_hashref($_);
				if ( !exists $rv->{$values[$i]} ) {
					$dbh->disconnect or warn $dbh->errstr;
					$@ = "Foreign key $_ cannot be updated because '$values[$i]' key does not exist on the exists $db->{Entidade}->{'fgnkeys'}->{$_} table!";
					return undef
				}
				else { next }
			}
		}
		if ( exists $db->{Entidade}->{'primkeys'}->{$_} ) {
			my $sql = "SELECT $_ FROM Entidade WHERE $_=$values[$i]";
			my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
			$sth->execute or $@ = $dbh->errstr;
			my $rv = $sth->fetchall_hashref($_);
			if ( exists $rv->{$values[$i]} ) {
				$dbh->disconnect or warn $dbh->errstr;
				$@ = "Primary key $_ cannot be updated because '$values[$i]' key already exists on the Entidade table!";
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
		my $sql = "SELECT $_ FROM Entidade WHERE $condition";
		my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
		$sth->execute or $@ = $dbh->errstr;
		my $rv = $sth->fetchall_hashref($_);
		foreach my $key ( keys %{$rv} ) {
			$sql = "UPDATE $fgn->{$_}->{'table'} SET $_=? WHERE $_=$key";
			$sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
			$sth->execute($fgn->{$_}->{'value'}) or $@ = $dbh->errstr;
		}
		$dbh->commit
	}
	my $sql = "UPDATE Entidade SET $set WHERE $condition";
	my $sth = $dbh->prepare($sql) or $@ = $dbh->errstr;
	my $res=$sth->execute or $@ = $dbh->errstr;
	$dbh->commit;
	$dbh->disconnect or warn $dbh->errstr;
	return $res;
}
