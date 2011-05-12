create table Grammar (
	Grammar_Name varchar NOT NULL,
	Axiom varchar NOT NULL,
	primary key (Grammar_Name)
	);
create table Symbol_Grammar (
	Id_symbol varchar NOT NULL,
	Grammar_Name varchar NOT NULL,
	primary key (Id_symbol, Grammar_Name),
	foreign key (Id_symbol) references Symbol(Id_symbol),
	foreign key (Grammar_Name) references Grammar(Grammar_Name)
	);
create table Function_Grammar (
	Func_Name varchar NOT NULL,
	Grammar_Name varchar NOT NULL,
	primary key (Func_Name, Grammar_Name),
	foreign key (Func_Name) references Function(Func_Name),
	foreign key (Grammar_Name) references Grammar(Grammar_Name)
	);
create table Production (
	Prod_Name varchar NOT NULL,
	Expression text NOT NULL,
	primary key (Prod_Name)
	);
create table Attribute_Grammar (
	Id_attrib varchar NOT NULL,
	Grammar_Name varchar NOT NULL,
	primary key (Id_attrib, Grammar_Name),
	foreign key (Id_attrib) references Attribute(Id_attrib),
	foreign key (Grammar_Name) references Grammar(Grammar_Name)
	);
create table Attribute (
	Id_attrib varchar NOT NULL,
	Type varchar NOT NULL,
	Classe varchar NOT NULL,
	Id_symbol varchar NOT NULL,
	primary key (Id_attrib),
	foreign key (Id_symbol) references Symbol(Id_symbol)
	);
create table Computation_Production (
	Comp_Name varchar NOT NULL,
	Prod_Name varchar NOT NULL,
	primary key (Comp_Name, Prod_Name),
	foreign key (Comp_Name) references Computation(Comp_Name),
	foreign key (Prod_Name) references Production(Prod_Name)
	);
create table Symbol (
	Id_symbol varchar NOT NULL,
	Value text NULL,
	Type varchar NOT NULL,
	primary key (Id_symbol)
	);
create table Production_Grammar (
	Prod_Name varchar NOT NULL,
	Grammar_Name varchar NOT NULL,
	primary key (Prod_Name, Grammar_Name),
	foreign key (Prod_Name) references Production(Prod_Name),
	foreign key (Grammar_Name) references Grammar(Grammar_Name)
	);
create table Argument_Computation (
	Cod_Arg int NOT NULL,
	Comp_Name varchar NOT NULL,
	primary key (Cod_Arg, Comp_Name),
	foreign key (Cod_Arg) references Argument(Cod_Arg),
	foreign key (Comp_Name) references Computation(Comp_Name)
	);
create table Computation (
	Comp_Name varchar NOT NULL,
	Position int NOT NULL,
	ReturnType varchar NOT NULL,
	Modus varchar NOT NULL,
	Id_attrib varchar NOT NULL,
	primary key (Comp_Name),
	foreign key (Id_attrib) references Attribute(Id_attrib)
	);
create table Importation_Grammar (
	Import varchar NOT NULL,
	Grammar_Name varchar NOT NULL,
	primary key (Import, Grammar_Name),
	foreign key (Import) references Importation(Import),
	foreign key (Grammar_Name) references Grammar(Grammar_Name)
	);
create table Function (
	Func_Name varchar NOT NULL,
	Specification text NOT NULL,
	primary key (Func_Name)
	);
create table Importation (
	Import varchar NOT NULL,
	primary key (Import)
	);
create table Argument (
	Cod_Arg int NOT NULL,
	Position int NOT NULL,
	Id_attrib varchar NOT NULL,
	primary key (Cod_Arg),
	foreign key (Id_attrib) references Attribute(Id_attrib)
	);
