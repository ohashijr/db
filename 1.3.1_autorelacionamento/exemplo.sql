create schema aula3;
use aula3;

create table funcionarios(
	id integer primary key,
	nome varchar(45),
    gerente_id int,
    foreign key (gerente_id) references funcionarios(id)
);

insert into funcionarios values (1, "Ohashi", NULL);
insert into funcionarios values (2, "Rafael", 1);
insert into funcionarios values (3, "Rodrigo", 4); -- error, na chave do gerente
insert into funcionarios values (3, "Rodrigo", 2);
insert into funcionarios values (4, "Pedro", 1);

# Quais são os funcionarios cujo o gerente é o Ohashi?
select id, nome from funcionarios where gerente_id = 1;

# Quem é o gerente do funcionário Rodrigo
select gerente_id from funcionarios where nome = "Rodrigo";
select id, nome from funcionarios where id = 2;

# td junto (avançado - subquery)
select id, nome from funcionarios where id = (select gerente_id from funcionarios where nome = "Rodrigo");


