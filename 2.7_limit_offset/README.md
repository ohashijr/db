# DATASET
Essa aula é baseada no schema definido no arquivo [script.sql](script.sql)

# LIMIT
Função principal é restringir a quantidade de linhas de uma consulta.
Considerando a performance da aplicação/banco, não é uma boa prática realizar uma consulta que retorna uma grande quantidade de linhas do banco de dados e apenas mostrar parte dessas linhas. É mais otimizado buscar no banco apenas a informação que será apresentada.

ex: retorne todos os campos da tabela "cargo", porém limite a apenas 1 linha.
```sql
SELECT * FROM cargos limit 1;
```

ex: retornando apenas as 10 primeiras linhas
```sql
SELECT * FROM cargos limit 10;
```

ex: retornando apenas as últimas 10 linhas
```sql
SELECT * FROM cargos order by id desc limit 10;
```

# PAGINAÇÃO
Uma empresa de e-commerce não disponibiliza em uma única página todos os itens a venda.
A prática mais comum é limitar a quantidade de itens por página, por ex: 20 itens. Para o usuário
visualizar os próximos 20 itens é necessário uma ação como, navegar para outra página.
A nível de banco de dados carregar todo o catálogo de itens e mostrar apenas 20 seria um imenso desperdício de recursos computacionais.

ex: mostrar 5 cargos pulando os 3 primeiros.
```sql
SELECT * FROM cargos limit 5 offset 3;
SELECT * FROM cargos limit 3, 5; # consulta equivalente, sem a palavra offset
```

Considerando um sistema que tem diversos itens e mostra 4 itens por página:

| pagina   | sql                 | itens             |
| :------: | :-----------------: | :---------------: |
| 1        | limit 4 offset 0    | 1, 2, 3 e 4       |
| 2        | limit 4 offset 4    | 5, 6, 7 e 8       |
| 3        | limit 4 offset 8    | 9, 10, 11 e 12    |
| 4        | limit 4 offset 12   | 13, 14, 15 e 16   |

pagina n = limit 4 offset 4 * (n-1)

obs: como o offset do sql da pagina 1 é igual a zero, este poderia ser ignorado ficando apenas "limit 4".

# LIMIT no DELETE
É possível restringir a quantidade de um delete com o limit.
"If the DELETE statement includes an ORDER BY clause, rows are deleted in the order specified by the clause. This is useful primarily in conjunction with LIMIT."
https://dev.mysql.com/doc/refman/5.6/en/delete.html

ex: deleta o funcionário com o maior salário.
```sql
DELETE FROM funcionarios ORDER BY salario DESC LIMIT 1;
```
# LIMIT no UPDATE
É possível restringir a quantidade de linhas afetadas num update.

ex: atualiza o salário de quem ganha mais para o valor 1000.
```sql
UPDATE funcionarios SET salario = 1000 ORDER BY salario DESC LIMIT 1;
```

# Exercícios, utilizando LIMIT:
1. Quem é o funcionário com o maior salário?
2. Quem é o funcionário com o menor salário?
3. Quem é o funcionário e cargo, que possui o 2º maior salário?
4. Atualize o cargo do funcionario com o maior salario para DBA nivel 2.
5. Cadastre mais 6 Funcionários. Considerando um sistema paginação que exibe 3 funcionários por página, qual seria a consulta para mostrar a 3ª página de funcionários?
6. Delete os dois funcionarios com os menores salários.
