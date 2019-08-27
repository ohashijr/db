# Tipos de Dados MySQL

# Tipos de dados numéricos no MySQL
O MySQL tem todos os tipos numéricos possíveis, o que inclui exatos, aproximados, inteiros, de ponto fixo, ponto flutuante etc. A lista, abaixo, mostra um resumo dos tipos de dados possíveis no MySQL:

Existem tipos de dados numéricos, que se podem dividir em dois grandes grupos, os que estão em vírgula flutuante (com decimais) e os que não. 

TinyInt: é um número inteiro com ou sem sinal. Com sinal a margem de valores válidos é desde -128 até 127. Sem sinal, a margem de valores é de 0 até 255 

Bit ou Bool: um número inteiro que pode ser 0 ou 1. 

SmallInt: número inteiro com ou sem sinal. Com sinal a margem de valores válidos é desde -32768 até 32767. Sem sinal, a margem de valores é de 0 até 65535. 

MediumInt: número inteiro com ou sem sinal. Com sinal a margem de valores válidos é desde -8.388.608 até 8.388.607. Sem sinal, a margem de valores é de 0 até 16777215. 

Integer, Int: número inteiro com ou sem sinal. Com sinal a margem de valores válidos é desde -2147483648 até 2147483647. Sem sinal, a margem de valores é de 0 até 429.496.295 

BigInt: número inteiro com ou sem sinal. Com sinal a margem de valores válidos é desde -9.223.372.036.854.775.808 até 9.223.372.036.854.775.807. Sem sinal, a margem de valores é de 0 até 18.446.744.073.709.551.615. 

Float: número pequeno em vírgula flutuante de precisão simples. Os valores válidos vão desde -3.402823466E+38 até -1.175494351E-38,0 eté desde 175494351E-38 até 3.402823466E+38. 

xReal, Double: número em vírgula flutuante de dupla precisão. Os valores permitidos vão desde -1.7976931348623157E+308 até -2.2250738585072014E-308, 0 e desde 2.2250738585072014E-308 até 1.7976931348623157E+308 

Decimal, Dec, Numeric: Número em vírgula flutuante desempacotado. O número armazena-se como uma cadeia. 

# Tipos de dados em strings

Strings são cadeias de caracteres. No MySQL, uma string pode ter qualquer conteúdo, desde texto simples a dados binários – tais como imagens e arquivos (necessário conversão, geralmente encode base 64). Cadeias de caracteres podem ser comparadas e ser objeto de buscas.

Char(n): armazena uma cadeia de longitude fixa. A cadeia poderá conter desde 0 até 255 caracteres. 

VarChar(n): armazena uma cadeia de longitude variável. A cadeia poderá conter desde 0 até 255 caracteres. Dentro dos tipos de cadeia pode-se distinguir dois subtipos, os tipo Test e os tipo Blob (Binary Large Object) A diferença entre um tipo e outro é o tratamento que recebem na hora de ordená-los e compará-los. No tipo test ordena-se sem ter importância as maiúsculas e as minúsculas e no tipo blob ordena-se tendo em conta as maiúsculas e minúsculas. 

Os tipos blob utilizam-se para armazenar dados binários como podem ser ficheiros. 

TinyText e TinyBlob: Coluna com uma longitude máxima de 255 caracteres. 

Blob e Text: um texto com um máximo de 65535 caracteres. 

MediumBlob e MediumText: um texto com um máximo de 16.777.215 caracteres. 

LongBlob e LongText: um texto com um máximo de caracteres 4.294.967.295. Há que ter em conta que devido aos protocolos de comunicação os pacotes podem ter um máximo de 16 Mb. 

Enum: campo que pode ter um único valor de uma lista que se especifica. O tipo Enum aceita até 65535 valores diferentes. 

Set: um campo que pode conter nenhum, um ou vários valores de uma lista. A lista pode ter um máximo de 64 valores. 

# Armazenamento de data e hora
Há várias opções para armazenar dados relacionados a data e hora. Se você quiser apenas armazenar o ano referente a um evento, pode usar o tipo YEAR. O tipo TIMESTAMP pode ser usado para acompanhar as mudanças ocorridas em um campo de uma tabela. Veja os tipos e suas descrições:

Date: tipo data, armazena uma data. A margem de valores vai desde o 1 de Janeiro de 1001 ao 31 de dezembro de 9999. O formato de armazenamento é de ano-mes-dia. 

DateTime: Combinação de data e hora. A margem de valores vai desde o 1 ed Janeiro de 1001 às 0 horas, 0 minutos e 0 segundos ao 31 de Dezembro de 9999 às 23 horas, 59 minutos e 59 segundos. O formato de armazenamento é de ano-mes-dia horas:minutos:segundos 

TimeStamp: Combinação de data e hora. A margem vai desde o 1 de Janeiro de 1970 ao ano 2037. O formato de armazenamento depende do tamanho do campo: 

Time: armazena uma hora. A margem de horas vai desde -838 horas, 59 minutos e 59 segundos. O formato de armazenamento é 'HH:MM:SS'. 

Year: armazena um ano. A margem de valores permitidos vai desde o ano 1901 ao ano 2155. O campo pode ter tamanho dois ou tamanho 4 dependendo de se queremos armazenar o ano com dois ou quatro algarismos. 

# Dados espaciais
O MySQL tem suporte a tipos de dados que correspondem às classes OpenGIS. Alguns destes carregam valores geométricos simples:

GEOMETRY

POINT

LINESTRING

POLYGON

O GEOMETRY pode armazenar qualquer tipo de valor geométrico. Os outros valores simples (POINT, LINESTRING e POLYGON) têm seus valores restritos aos tipos geométricos a que se referem.
Os outros, que seguem listados, carregam valores relativos a coleções/coletivos:

# Referências

https://elias.praciano.com/2014/01/mysql-tipos-de-dados/

http://www.criarweb.com/artigos/118.php