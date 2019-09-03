create schema aula;

use aula;

create table departamentos(
	id int primary key,
	nome varchar(20)
);

insert into departamentos values (1, 'TI');

insert into departamentos values (2, 'Financeiro');

insert into departamentos values (3, 'Compras');

select * from departamentos;

create table funcionarios(
	id int primary key,
	nome varchar(45),
	email varchar(100),
    departamento_id int,
    foreign key (departamento_id) references departamentos(id)
);

-- insert into funcionarios values (1, 'Mario', 'mario@gmail.com', 4);
insert into funcionarios values (1, 'Mario', 'mario@gmail.com', 1);
insert into funcionarios values (2, 'Tereza', 'tereza@gmail.com', 2);
insert into funcionarios values (3, 'Felipe', 'felipe@gmail.com', 3);
insert into funcionarios values (4, 'Fabio', 'fabio@gmail.com', 1);
insert into funcionarios values (5, 'Jose', 'jose@gmail.com', 2);
insert into funcionarios values (6, 'Antonio', 'antonio@gmail.com', 3);
insert into funcionarios values (7, 'Paula', 'paula@gmail.com', 1);

select * from funcionarios;

-- selecionar os funcionarios do departamento TI
select * from funcionarios, departamentos where departamentos.id = funcionarios.departamento_id and departamentos.nome = 'TI'; 

select funcionarios.nome, departamentos.nome from funcionarios, departamentos where departamentos.id = funcionarios.departamento_id and departamentos.nome = 'TI'; 

