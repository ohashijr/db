select funcionarios.nome, funcionarios.salario FROM funcionarios ORDER BY salario DESC LIMIT 1;
select funcionarios.nome, funcionarios.salario FROM funcionarios ORDER BY salario LIMIT 1;
select funcionarios.nome, funcionarios.salario FROM funcionarios ORDER BY salario DESC LIMIT 1 offset 1;
update funcionarios SET cargo_id = 11 ORDER BY salario DESC LIMIT 1;
select * FROM funcionarios; #Para verificar mudança no cargo
insert into funcionarios values (5, 'Carlos Andrade', 900.00, 1, 1);
insert into funcionarios values (6, 'Fernando Almeida', 950.00, 7, 1);
insert into funcionarios values (7, 'Marilia Gonçalves', 1050.00, 4, 2);
insert into funcionarios values (8, 'Juliana Farias', 1100.00, 13, 1);
insert into funcionarios values (9, 'Gaspar Viana', 15000.00, 9, 2);
insert into funcionarios values (10, 'Livia Souza', 1200.00, 8, 1);
select * FROM funcionarios limit 3 offset 6;
DELETE FROM funcionarios ORDER BY salario  LIMIT 1; --precisa desabilitar o safemode em preferences
