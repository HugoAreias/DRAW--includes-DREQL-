create table Registo_TipoRegisto (
	TipoRegisto varchar(255) NULL,
	Cod_Registo int(3) NOT NULL,
	primary key (TipoRegisto, Cod_Registo),
	foreign key (Cod_Registo) references Registo(Cod_Registo)
	);
create table Controlo (
	Responsavel varchar(255) NULL,
	Aprovacao boolean,
	Cod_Controlo int(3) NOT NULL,
	Coisas varchar(255) NULL,
	Coisas_ varchar(255) NULL,
	Coisas__ varchar(255) NULL,
	Cod_Registo int(3) NOT NULL,
	primary key (Cod_Controlo),
	foreign key (Cod_Registo) references Registo(Cod_Registo)
	);
create table Emissao (
	Cod_Emissao int(3) NOT NULL,
	Cod_Destinatario int(3) NULL,
	Assunto varchar NULL,
	DataEmissao date NULL,
	Cod_Registo int(3) NOT NULL,
	Cod_Entidade int(3) NOT NULL,
	primary key (Cod_Emissao),
	foreign key (Cod_Registo) references Registo(Cod_Registo),
	foreign key (Cod_Entidade) references Entidade(Cod_Entidade)
	);
create table Recepcao (
	Cod_Recepcao int(3) NOT NULL,
	Cod_Remetente int(3) NULL,
	Assunto varchar NULL,
	DataRecepcao date NULL,
	Cod_Registo int(3) NOT NULL,
	Cod_Entidade int(3) NOT NULL,
	primary key (Cod_Recepcao),
	foreign key (Cod_Registo) references Registo(Cod_Registo),
	foreign key (Cod_Entidade) references Entidade(Cod_Entidade)
	);
create table Registo (
	Cod_Registo int(3) NOT NULL,
	DataRegisto date NULL,
	primary key (Cod_Registo)
	);
create table Entidade (
	Cod_Entidade int(3) NOT NULL,
	Nome varchar(255),
	Morada varchar(255) NOT NULL,
	Telefone varchar(255) NOT NULL,
	Email varchar(255) NOT NULL,
	primary key (Cod_Entidade)
	);
