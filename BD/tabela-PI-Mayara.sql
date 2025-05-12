drop database PI;
create database PI;
use PI;

create table profissional(
idProfissional int auto_increment primary key,
nomeProfissional varchar(45),
categoriaProfissional varchar (45),
CEP varchar (9),
telefone varchar(11),
email varchar(45),
registroProfissional varchar(5),
constraint chkRegistroProfissional 
	check(registroProfissional in ('Enfermeiro', 'Médico')),
numRegistro varchar(6));


create table gestante(
idGestante int auto_increment,
idPreNatalFinalizada int,
fkProfissional int,
nomeGestante varchar(45), 
dtNascimento varchar(45),
telefone varchar (11),
cep varchar (8),
 constraint fk_Profissional foreign key  (fkProfissional)
		references profissional (idProfissional),
constraint fk_Dependente primary key (idGestante, idPreNatalFinalizada));

create table infoGestante(
idInfoGestante int primary key auto_increment,
fkInfoGestante int,
gesta decimal,
paridade decimal,
aborto decimal,
numPN decimal,
numPC decimal,
dum date,
dpp date,
altoRisco varchar(3),
constraint chkAltoRisco
		check (altoRisco in ('Sim', 'Não')),
constraint fk_InfoGestante foreign key (fkInfoGestante)
		references gestante (idGestante));

create table consulta(
idConsulta int, 
fkGestanteAssociativa int,
fkProfissional int,
au decimal,
bcf decimal,
pressaoArt varchar (6),
mf varchar(3),
constraint chkMf
		check (mf in ('Sim','Não'));




