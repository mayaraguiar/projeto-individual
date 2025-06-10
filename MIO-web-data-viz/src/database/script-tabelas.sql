 drop database PI;
 create database PI;
use PI;


create table profissional(
idProfissional int auto_increment primary key,
nomeProfissional varchar(45),
email varchar(45),
senha varchar (45),
codigoAtivacao VARCHAR(7)
);


create table gestante(
idGestante int auto_increment primary key,
nomeGestante varchar(45), 
dtNascimento varchar(45),
telefone varchar (11)
);

create table infoGestante(
idInfoGestante int primary key auto_increment,
fkGestante int,
gesta decimal,
paridade decimal,
aborto decimal,
numPN decimal,
numPC decimal,
dum date,
dpp date,
altoRisco varchar(3),
statusPreNatal varchar (5),
constraint chkAltoRisco
		check (altoRisco in ('Sim', 'Não')),
constraint chkStatus
		check (statusPreNatal in ('Sim', 'Não')),
constraint fk_InfoGestante foreign key (fkGestante)
		references gestante (idGestante));



create table consulta(
idConsulta int, 
fkGestanteAssociativa int,
fkProfissionalAssociativa int,
au decimal,
bcf decimal,
pressaoArt varchar (6),
mf varchar(3),
constraint chkMf
 check (mf in ('Sim','Não')),
primary key (idConsulta, fkGestanteAssociativa, fkProfissionalAssociativa)
 );
 
create table historicoPreNatal(
idFinalizado int primary key auto_increment,
viaParto varchar (45),
complicacoes varchar (3),
rnVivo varchar (3),
dtParto date,
fkGestanteHistorico int,
constraint chkViaParto
		check (viaParto in ('Normal', 'Cesárea')),
constraint chkComplicacoes
		check (complicacoes in ('Sim', 'Não')),
constraint chkRnVivo
		check (rnVivo in ('Sim', 'Não'))
);
 

 insert into profissional values
 ( default, 'Samia', 'samia@email.com', 'Zamj123','bje'),
( default, 'Aline', 'aline@email.com', 'Zamj124','bje'),
( default, 'Beatriz', 'beatriz@email.com', 'Zamj125', 'bje');


insert into gestante values
(default, 'Ana Clara', '1994-03-21', '11999998888'),
(default, 'Beatriz Souza', '1991-07-14', '11988887777'),
(default, 'Camila Rocha', '1993-12-01', '11977776666'),
(default, 'Daniela Lima', '1989-09-20', '11966665555'),
(default, 'Elaine Moraes', '1995-05-10', '11955554444'),
(default, 'Fernanda Alves', '1992-10-05', '11944443333'),
(default, 'Gisele Martins', '1996-02-28', '11933332222'),
(default, 'Helena Ramos', '1990-06-18', '11922221111'),
(default, 'Isabela Freitas', '1997-04-23', '11911110000'),
(default, 'Juliana Tavares', '1993-01-17', '11900009999'),
(default, 'Karen Silva', '1998-08-30', '11888889999'),
(default, 'Laura Castro', '1995-11-11', '11877778888'),
(default, 'Marina Dias', '1991-03-03', '11866667777'),
(default, 'Natália Teixeira', '1992-12-25', '11855556666'),
(default, 'Olívia Prado', '1994-09-09', '11844445555'),
(default, 'Patrícia Leal', '1988-07-07', '11833334444'),
(default, 'Queila Fonseca', '1990-05-02', '11822223333'),
(default, 'Renata Borges', '1996-10-16', '11811112222'),
(default, 'Sabrina Farias', '1993-04-12', '11800001111'),
(default, 'Tatiane Costa', '1997-06-08', '11799998888');

insert into infoGestante values
(default, 1, 2, 1, 0, 0, 1, '2025-03-01', '2025-12-08', 'Sim', 'Não'),
(default, 2, 3, 1, 1, 1, 0, '2025-01-15', '2025-09-22', 'Não', 'Sim'),
(default, 3, 1, 0, 1, 0, 0, '2025-02-12', '2025-10-19', 'Sim', 'Sim'),
(default, 4, 2, 1, 0, 1, 1, '2025-04-01', '2026-01-08', 'Sim', 'Sim'),
(default, 5, 3, 0, 1, 0, 0, '2025-03-22', '2025-12-29', 'Não', 'Sim'),
(default, 6, 2, 1, 1, 1, 1, '2025-05-10', '2026-02-17', 'Sim', 'Sim'),
(default, 7, 1, 0, 0, 0, 1, '2025-04-05', '2026-01-12', 'Sim', 'Não'),
(default, 8, 3, 1, 1, 1, 0, '2025-01-01', '2025-09-08', 'Sim', 'Sim'),
(default, 9, 1, 0, 0, 0, 0, '2025-02-20', '2025-10-27', 'Não', 'Não'),
(default, 10, 2, 0, 1, 0, 1, '2025-03-18', '2025-12-25', 'Sim', 'Sim'),
(default, 11, 1, 1, 0, 1, 0, '2025-05-03', '2026-02-10', 'Sim', 'Sim'),
(default, 12, 2, 1, 1, 0, 1, '2025-02-02', '2025-11-09', 'Não', 'Sim'),
(default, 13, 1, 0, 0, 0, 0, '2025-04-10', '2025-01-17', 'Sim', 'Não'),
(default, 14, 2, 1, 0, 1, 1, '2025-03-12', '2025-12-19', 'Sim', 'Sim'),
(default, 15, 3, 0, 1, 1, 1, '2025-01-28', '2025-11-04', 'Não', 'Sim'),
(default, 16, 1, 0, 1, 0, 0, '2025-04-18', '2026-01-26', 'Sim', 'Não'),
(default, 17, 2, 1, 0, 0, 1, '2025-02-22', '2025-10-29', 'Sim', 'Sim'),
(default, 18, 3, 1, 1, 1, 1, '2025-03-15', '2026-12-22', 'Sim', 'Sim'),
(default, 19, 1, 0, 0, 1, 0, '2025-05-20', '2026-02-27', 'Não', 'Sim'),
(default, 20, 2, 1, 1, 0, 0, '2025-04-01', '2026-01-08', 'Sim', 'Sim');

select * from infoGestante;
select * from gestante;

insert into historicoPreNatal values 
(default, 'Normal', 'Não', 'Sim', '2025-04-05', 4),
(default, 'Cesárea', 'Sim', 'Sim', '2025-05-10', 4),
(default, 'Normal', 'Sim', 'Sim', '2025-02-12', 5),
(default, 'Cesárea', 'Não', 'Sim', '2025-03-18', 5),
(default, 'Normal', 'Sim', 'Sim', '2025-04-22', 6),
(default, 'Normal', 'Sim', 'Sim', '2025-05-20', 7),
(default, 'Cesárea', 'Não', 'Não', '2025-01-25', 8),
(default, 'Normal', 'Sim', 'Sim', '2025-03-12', 9),
(default, 'Normal', 'Não', 'Sim', '2025-04-30', 10),
(default, 'Cesárea', 'Sim', 'Sim', '2025-02-17', 11),
(default, 'Normal', 'Sim', 'Sim', '2025-05-04', 12),
(default, 'Normal', 'Sim', 'Não', '2025-04-19', 13),
(default, 'Cesárea', 'Não', 'Sim', '2025-02-28', 14),
(default, 'Normal', 'Sim', 'Sim', '2025-03-25', 15),
(default, 'Normal', 'Sim', 'Sim', '2025-01-15', 16),
(default, 'Cesárea', 'Não', 'Sim', '2025-04-10', 17),
(default, 'Normal', 'Sim', 'Sim', '2025-03-22', 18),
(default, 'Cesárea', 'Sim', 'Sim', '2025-02-09', 19),
(default, 'Normal', 'Não', 'Sim', '2025-04-01', 20),
(default, 'Normal', 'Sim', 'Sim', '2025-05-15', 21),
(default, 'Cesárea', 'Sim', 'Sim', '2025-01-10', 22),
(default, 'Normal', 'Não', 'Sim', '2025-03-28', 23);

select * from gestante;

 -- Exibir pacientes que estão realizando pré natal ativas (KPI) 
SELECT COUNT(*) AS totalGestantesAtivas
FROM infoGestante
WHERE statusPreNatal = 'Ativo' ;

 -- Gestantes que estão realizando pré natal de de alto risco (KPI)
 SELECT count(*) as nomeGestante 
FROM gestante g
JOIN infoGestante i ON g.idGestante = i.fkGestante
WHERE i.altoRisco = 'Sim';

 -- Gestantes que tiveram complicações no ultimo ano (10/60) Total e complicações.. 7. Total de partos com e sem complicações
SELECT COUNT(*) AS totalComComplicacoes
FROM historicoPreNatal
WHERE complicacoes = 'Sim'
  AND dtParto >= '2024-05-24';

SELECT COUNT(*) AS totalSemComplicacoes
FROM historicoPreNatal
WHERE complicacoes = 'Não'
  AND dtParto >= '2024-05-24';

use pi;
 
 -- Gestante com DPP para cada mês do ano -- barra
 SELECT MONTH(dpp) AS mes, COUNT(*) AS total
FROM infoGestante
GROUP BY MONTH(dpp)
ORDER BY mes;
 -- Via de parto no ultimo ano -- barra
 
SELECT month(dtParto) AS Mes, viaParto, COUNT(*) AS total
FROM historicoPreNatal
where viaParto = 'Normal'
;

SELECT month(dtParto) AS Mes, viaParto, COUNT(*) AS total
FROM historicoPreNatal
where viaParto = 'Cesárea'
GROUP BY month(dtParto)
;
--  6. Total de RN vivos vs óbitos
SELECT rnVivo, COUNT(*) AS total
FROM historicoPreNatal
GROUP BY rnVivo;


select *from profissional ;

select * from infoGestante;



