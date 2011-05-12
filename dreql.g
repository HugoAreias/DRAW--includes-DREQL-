grammar dreql;

options {
   output = AST;
}

tokens {
   DREQL; COMMANDS; COMMAND; CLASS; RELATION; TABLE; FIELDS; FIELD; DATATYPE; FIELDNAME; OPTIONAL; OPTION; RELTYPE;
   EDITABLE; VISIBLE; OPTIONAL; MASKED; KEY; AUTOINC; ONE; ZEROTOONE; ONETON; ZEROTON; NTOM; ENUM; ENUMOPT; ARGS;
   SET; SETTYPE; RENOM; ABSTRACT; EXTENDS;
}

@members {
}

@header {
}

dreql	:	commands
		-> ^(DREQL commands)
	;

commands	:	(command ';')+
		-> ^(COMMANDS command+)
	;

command	:	(a=dclass | b=relation | c=renom)
		-> {a!=null}? ^(COMMAND dclass)
		-> {b!=null}? ^(COMMAND relation)
		-> ^(COMMAND renom)
	;

dclass	:	('class' | 'Class') table '(' fields ')'
		-> ^(CLASS table fields)
		| ('abstract' | 'Abstract') table '(' fields ')'
		-> ^(ABSTRACT table fields)
		| ('class' | 'Class') table ('extends' | 'Extends') table '(' fields ')'
		-> ^(EXTENDS table table fields)
	;

relation	:	('relation' | 'Relation') '(' table ',' table ':' reltype ',' reltype ')'
		-> ^(RELATION table table reltype reltype)
	;

renom	:	('renom' | 'Renom') TYPE '=' TYPE
		-> ^(RENOM TYPE TYPE)
	;

table	:	TYPE
		-> ^(TABLE TYPE)
	;

fields	:	field (',' field)*
		-> ^(FIELDS field+)
	;
/*
field	:	fieldname ':' a=(datatype?) b=(('[' optional ']')?)
		-> {a!=null && b!=null}? ^(FIELD fieldname datatype optional)
		-> {a==null && b!=null}? ^(FIELD fieldname optional)
		-> {a!=null && b==null}? ^(FIELD fieldname datatype)
		-> ^(FIELD fieldname)
	;
*/
field	:	fieldname ':' datatype '[' optional ']'
		-> ^(FIELD fieldname datatype optional)
		| fieldname ':'  '[' optional ']'
		-> ^(FIELD fieldname optional)
		| fieldname ':' datatype
		-> ^(FIELD fieldname datatype)
		| fieldname
		-> ^(FIELD fieldname)
	;

fieldname	:	TYPE
		-> ^(FIELDNAME TYPE)
	;


optional	:	option (',' option)*
		-> ^(OPTIONAL option+)
	;
datatype	:	TYPE '(' NUM ')'
		-> ^(DATATYPE TYPE NUM)
		| TYPE
		-> ^(DATATYPE TYPE)
		| ('enum' | 'Enum') '(' enumopt ')'
		-> ^(DATATYPE ENUM enumopt)
		| set
		-> ^(DATATYPE set)
/*		| seq
		| map
		| tree
		| tuple*/
	;

set	:	('set' | 'Set') TYPE '(' NUM ')'
		-> ^(SETTYPE TYPE NUM)
		| ('set' | 'Set') TYPE
		-> ^(SETTYPE TYPE)
		| ('set' | 'Set')
		-> ^(SETTYPE SET)
	;

enumopt	:	args (',' args)*
		-> ^(ENUMOPT args+)
	;

args	:	VAL
		-> ^(ARGS VAL)
	;

option	:	(a='editable' | b='visible' | c='optional' | d='masked' | e='key' | 'autoinc')
		-> {a!=null}? ^(OPTION EDITABLE)
		-> {b!=null}? ^(OPTION VISIBLE)
		-> {c!=null}? ^(OPTION OPTIONAL)
		-> {d!=null}? ^(OPTION MASKED)
		-> {e!=null}? ^(OPTION KEY)
		-> ^(OPTION AUTOINC)
	;

reltype	:	(a='1' | b='0..1' | c='1..*' | d='0..*' | e='*' | f=NUM | NUM '..' NUM)
		-> {a!=null}? ^(RELTYPE ONE)
		-> {b!=null}? ^(RELTYPE ZEROTOONE)
		-> {c!=null}? ^(RELTYPE ONETON)
		-> {d!=null}? ^(RELTYPE ZEROTON)
		-> {e!=null}? ^(RELTYPE NTOM)
		-> {f!=null}? ^(RELTYPE NUM)
		-> ^(RELTYPE NUM NUM)
	;

NUM	:	('0'..'9')+
	;

TYPE	:	('A'..'Z' | 'a'..'z' | '_')+
	;

VAL	:	('\'' (options{greedy=false;}:.)*  '\'')
	;

/*
NAME	:	('A'..'Z')('a'..'z' | 'A'..'Z' | '0'..'9')+
	;

NAMENOCAPS	:	('a'..'z' | 'A'..'Z')('a'..'z' | 'A'..'Z' | '0'..'9' | '_')*
	;
*/

NS	:	(' ' | '\t' | '\n' | 'r') { skip(); }
	;

COMMENT	:	'/*' (options {greedy=false; }:.)* '*/' { skip(); }
	;

LINE_COMMENT
	:	 '//' ~('\n'|'\r')* '\r'? '\n' { skip(); }
	;
