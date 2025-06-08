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
statusPreNatal varchar (3),
constraint chkAltoRisco
		check (altoRisco in ('Sim', 'Não')),
constraint chkStatus
		check (statusPreNatal in ('Ativo', 'Inativo')),
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
(default, 'Thamires', '1996-11-25', '11959477652'),
(default, 'Juliana', '1990-05-02', '11959477656'),
(default, 'Leidiane', '1996-12-31', '11959477682');

insert into infoGestante values
(default, 1,  1, 0, 0, 0, 0, '2024-03-15', '2025-11-25', 'Sim', 'Ativo'),
(default, 2,  3, 1, 1, 0, 1, '2025-02-09', '2025-02-09', 'Sim', 'Ativo'),
(default, 3, 1, 0, 1, 0, 0, '2025-04-06', '2025-08-16', 'Não', 'Ativo');

describe infoGestante;

insert into historicoPreNatal values 
(default, 'Normal', 'Não', 'Sim', '2025-04-15', 1),
(default, 'Cesárea', 'Sim', 'Sim', '2025-02-08', 2),
(default, 'Normal', 'Sim', 'Sim', '2025-02-04', 2),
(default, 'Normal', 'Não', 'Sim', '2025-01-05', 3),
(default, 'Cesárea', 'Sim', 'Sim', '2025-03-22', 1);

select * from gestante;

 -- Exibir pacientes que estão realizando pré natal ativas (KPI) 
SELECT COUNT(*) AS totalGestantesAtivas
FROM infoGestante
WHERE statusPreNatal = 'Ativo' AND  gestante;

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

