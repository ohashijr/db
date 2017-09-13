# Dataset
Essa aula é baseada no schema definido no arquivo [script.sql](script.sql).

# Index
Index pode ser comparado aos indexes nos livros que facilita a busca por determinado conteúdo.
No MySQL, index são utilizados para encontrar uma determinada coluna mais rápido, sem o index a procura é realizada de maneira sequêncial iniciando pela primeira linha da tabela. Processo que pode ser bastante lento em tabelas grandes.

A maioria dos indexes no MySQL (PRIMARY KEY, UNIQUE, INDEX, and FULLTEXT) são armazenados na estrutura de árvore (B-TREE).

https://dev.mysql.com/doc/refman/5.7/en/mysql-indexes.html

# Testando

## Testando algumas consultas sem index
Vamos utilizar com base de teste duas consultas, a primeira que retorna as linhas com valor "a = 20" e "b = 16", e a segunda que retorna os valores de "b > 95" ordernados pelo valor de "b" descrescente. O fator importante nessas consultas é verificar o tempo de resposta do banco na execução das mesmas com diferente estratégias de indexação. Neste testes rodaremos apenas 1 vez cada consulta, num cenário ideal rodariamos várias vezes para obter um grau maior significância estatística nos resultados.

```sql
SELECT * FROM teste WHERE a = 20 AND b = 16 limit 80;  -- 0.037
SELECT * FROM teste WHERE b > 95 ORDER by b desc limit 5000;  -- 0.032
```

Nosso objetivo é melhorar o tempo de respostas dessas consultas, 1ª executou em 0.037 sec e a 2ª em 0.032 sec. Vamos testar várias estratégias de index e verificar o quanto podemos melhorar nessas consultas.

## Adicionando index na coluna "a"

O comando a baixo, cria o index denominado "index_a" na tabela "teste", na coluna "a".
```sql
ALTER TABLE teste ADD INDEX index_a (a);
```

Vamos repetir o testes anteriores e verificar se existiu algum ganho de performance.

```sql
SELECT * FROM teste WHERE a = 20 AND b = 16 limit 80;  -- 0.003
SELECT * FROM teste WHERE b > 95 ORDER by b desc limit 5000;  -- 0.039
```

Na 1ª consulta o ganho foi significativo, reduziu de 0.037 sec para 0.003. Na 2ª consulta ocorreu uma pequena perda de performance, 0.039 comparado com o sem index.

### Tentando entender um pouco esses resultados

```sql
explain SELECT * FROM teste WHERE a = 20 AND b = 16 limit 80;
explain SELECT * FROM teste WHERE b > 95 ORDER by b desc limit 5000;
```

| tipo | query 1 | query 2 |
| ---: | :---: | :---: |
| type: | ref | ALL |
| key: | index_a | NULL |
| rows: | 560 | 80178 |
| extra: | Using where | Using where; Using filesort |

type: ALL - leu toda a tabela
key: NULL - nenhum index foi aplicado
rows: quantidade estimada de linhas lida
extra: etapa posterior ao filtro que precisa ser aplicada

https://dev.mysql.com/doc/refman/5.7/en/explain-output.html

## Mantendo o index_a e adicionando index na coluna "b"

```sql
ALTER TABLE teste ADD INDEX index_b (b);
```
Vamos testar novamente a performance das consultas.

```sql
SELECT * FROM teste WHERE a = 20 AND b = 16 limit 80;  -- 0.001
SELECT * FROM teste WHERE b > 95 ORDER by b desc limit 5000;  -- 0.032
```

Nesta nova estratégia melhorando ainda mais o tempo de resposta da consulta 1. E houve uma pequena melhora no tempo da consulta 2.

## Remover o index "index_a", permanecendo com o index_b

```sql
DROP INDEX index_a on teste;
```

Apenas com index_b a performance foi um pouco pior para a consulta 1, e melhorou significativamente para a consulta 2.

```sql
SELECT * FROM teste WHERE a = 20 AND b = 16 limit 80;  -- 0.005
SELECT * FROM teste WHERE b > 95 ORDER by b desc limit 5000;  -- 0.010
```

# Testando index duplo, remover o index_b e adicionar o index_a_b
```sql
DROP INDEX index_b on teste;
ALTER TABLE teste ADD INDEX index_a_b (a,b);
```

Com a index duplo index_a_b obtivemos a melhor performance até agora para a 1ª consulta e uma piora significativa na 2ª consulta.

```sql
SELECT * FROM teste WHERE a = 20 AND b = 16 limit 80;  -- 0.001
SELECT * FROM teste WHERE b > 95 ORDER by b desc limit 5000;  -- 0.030
```

# Invertendo o index duplo, remover o index_a_b e adicionar o index_b_a
```sql
DROP INDEX index_a_b on teste;
ALTER TABLE teste ADD INDEX index_b_a (b,a);
```

Obtivemos a melhor performance até o momento para as duas consultas, a consulta 1 com 0.001 e a consulta 2 com 0.003. O que é um ganho estupendo em comparado ao teste sem index.

```sql
SELECT * FROM teste WHERE a = 20 AND b = 16 limit 80;  -- 0.001
SELECT * FROM teste WHERE b > 95 ORDER by b desc limit 5000;  -- 0.003
```

# Indexing is not an exact science
- Explain pode dar uma luz
https://dev.mysql.com/doc/refman/5.7/en/explain-output.html
- É necessário testar várias opções

# BAD INDEX
- Slows down writes
- Duplicate indexes: always bad
- Redondant indexes: generally bad
- Unused indexes: always bad
