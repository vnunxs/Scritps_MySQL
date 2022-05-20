drop database db_clinica_medica;

create database db_clinica_medica;

show databases;

use db_clinica_medica;

create table tbMedico(
codMedico int not null auto_increment,
nome varchar(100) not null,
crm char(10) not null unique,
email varchar(100),
tel char(10) not null,
primary key(codMedico)
);

create table tbPaciente(
codPaciente int not null auto_increment,
nome varchar(100) not null,
email varchar(100),
tel char(10) not null,
cpf char(14) not null unique,
convenio varchar(19) not null,
primary key(codPaciente)
);

create table tbReceitaMedica(
codReceita int not null auto_increment,
descricao varchar(250),
primary key (codReceita)
);

create table tbConsulta(
codConsulta int not null auto_increment,
dataConsulta datetime,
codMedico int not null,
codReceita int not null,
codPaciente int not null,
primary key(codConsulta),
foreign key(codMedico)references tbMedico(codMedico),
foreign key(codReceita)references tbReceitaMedica(codReceita),
foreign key(codPaciente)references tbPaciente(codPaciente)
); 

insert into tbMedico(nome,crm,email,tel)values('Dr. Junior Aguilar',35182741-7,'junior.aguilar@medicos.com','98575-8236');
insert into tbMedico(nome,crm,email,tel)values('Dr. Christiane',36471687-1,'christiane.taranto@medicos.com','94712-3641');

insert into tbPaciente(nome,email,tel,cpf,convenio)values('Geraldo Antunes','geraldo.antunes@gmail.com','98742-5214','258.147.369.22','251.147.369.852.785');

insert into tbReceitaMedica(descricao)values('Tomar dipirona 500mg duas vezes na semana durante 5 dias');

insert into tbConsulta(dataConsulta,codMedico,codReceita,codPaciente)values('2022/05/05',2,1,1);