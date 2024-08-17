-- selecionando uma tabela
SELECT * FROM amigos;

-- selecionando uma tupla da tabela:

select * from amigos where id = 5;
-- selecionando uma tupla da tabela
--com o nome aparecendo:
select amigos.nome, telefones.id_amigo
from amigos, telefones
where amigos.id = telefones.id_amigo
and telefones.id_amigo = 5;

--selecionando apenas o telefone 
--da cristina
select amigos.nome, telefones.numero
from amigos, telefones
where amigos.id = telefones.id_amigo
and amigos.nome = "Cristina";

--quero a mesma query, mas com o 
--nome da coluna igual ao nome da 
--cristina
select telefones.numero 'Cristina' 
from amigos,telefones 
where amigos.id = telefones.id_amigo
and amigos.nome = "Cristina";

-- selecionando uma coluna da tabela:
select nome from amigos;

-- obter dados dos clientes ordenados por 
-- ordem alfabetica do nome: 
select * from amigos order by nome asc;
select nome from amigos order by nome asc;

-- Quero todos os numeros que comecem com 5
select * from telefones where numero LIKE '5%';

-- selecionando dois atributos de uma mesma tabela:
select id, nome from amigos;

-- CRUD
-- Atuliaza o neme cristina para Maria ( para essa opção no worckbench desabilitar a segurança em edit/preferencias)
UPDATE amigos set nome = "Maria" 
where nome = "Cristina";


/*
==================== 09/08/2024
*/

-- crescente
SELECT produto FROM produtos ORDER BY produto asc;
--decrescente
SELECT produto FROM produtos ORDER BY produto DESC;

SELECT nome, email, cidade FROM clientes ORDER BY nome ASC;

-- desta forma a ordem vem por cidade e depois o nome: 
SELECT id, nome, email, cidade FROM clientes ORDER BY cidade, nome;

--para ordenar de forma simultanea usamos a seguinte query: 
SELECT  nome, email, cidade FROM clientes ORDER BY cidade DESC, nome ASC;

--organizar a tabela "produto" do mais caro para o mais barato
SELECT id, produto, preco_unidade FROM produtos ORDER BY preco_unidade DESC;

--encomendas mais recente: 
SELECT * FROM encomendas ORDER BY data_hora DESC;

-- buscar os 10 primeiros da tabela
SELECT id, nome, email FROM clientes LIMIT 10;

-- buscar os 10 ultimos da tabela
SELECT id, nome, email FROM clientes order by id DESC LIMIT 10;

-- ele pegará 20 dados a partir do id 6:
SELECT id, nome, email FROM clientes LIMIT 9 offset 5;



/*
==================== 14/08/2024
*/
SELECT id, nome, email FROM clientes LIMIT 10, 3;

-- buscar pelo produto mais caro
select * from produto ORDER by preco_unidade DESC LIMIT 1
--buscar o produto mais barato
select * from produtos ORDER by preco_unidade ASC LIMIT 1;
-- 3 produtos mais caro
select * from produtos ORDER by preco_unidade DESC LIMIT 2,1;
-- DISTINCT = remove valores duplicados nas querys 
select DISTINCT cidade from clientes;
-- ordenar de forma alfabetica
select DISTINCT cidade from clientes order by cidade;
-- IMPORTANTE: se alguma coluna estiver com valores nulos (NULL), o distinct vai incluir  esse valor na consulta.

-- Buscar apenas dos clientes  que moram na cidade de LISBOA.
select * from clientes where cidade = "Lisboa";
select * from clientes where sexo = "f";
-- Homens que moram em Coimbra
select * from clientes where cidade = "Coimbra" and sexo = "m"; 
-- operadores lógicos usando os diferente "<>"
select * from colaboradores where sexo <> "f";
-- produtos cujo o preço é superior a 1 
select * from produtos where preco_unidade > 1;
-- buscando um intervalo de informações
select * from produtos where preco_unidade >=1 and preco_unidade <= 2;
-- neste caso só funciona com numeros e não com caracteres
-- OR
select nome, email from clientes where cidade = "Paris" OR sexo = "m";
--NOT 
select nome from clientes where NOT sexo = "m";
-- BETWEEN
select * from produtos where preco_unidade BETWEEN 1 and 2

-- buscar as encomendas na ultima 24h do dia 08/03/2030.
select * from encomendas where data_hora BETWEEN '2030-03-08 00:00:00' and '2030-03-08 23:59:59';

-- IN = devolve todos os registros que estejam compreendidos dentro de uma coleção de valores
select * from clientes where cidade IN("Lisboa", "Viseu");

--selecionando dados os caracteres específicos %

--Neste caso o que estiver na frente da% query fará a busca
select nome from clientes where nome LIKE "Daniel%";

--Neste caso os caracteres que estiver entre a % será buscado na query
select nome from clientes where nome LIKE "%Daniel%";

--Neste caso será buscado o que estiver depois da %
select nome, email from clientes where email LIKE "%gmail.com";

--Neste caso será feito uma busca dentro do compo onde o caracter começa com A e termina com S
select nome from clientes where nome LIKE "A%S";

-- Neste caso será buscado o que estiver antes da % e o "_" será mostrará o caractere que representa o espaça (um caracter)
select nome from clientes where nome LIKE "Francisc_%";

-- Neste caso o "_" está buscando caracteres não especificados, poré o terceiro caracter deverá ser a letra "a"
select nome from clientes where nome LIKE "__a%";

-- -------------------------------- 15/08
-- Buscar as primeiras 5 encomendas, juntando duas tabelas: encomendas e clientes.
SELECT clientes.nome, encomendas * FROM clientes, encomendas WHERE clientes.id = encomendas.id_clientes LIMIT 5;

-- Mesma query com ALIAS
SELECT c.nome, e. * FROM clientes c, ecomendas e WHERE c.id = e.id_cliente LIMIT 5;

-- Concatenação entre as colunas CONCAT
SELECT CONCAT('O meu nome é ', nome, 'e meu email é: ', email) frase FROM clientes LIMIT 10;


-- ------- JOIN
/*(INNER) Join == Registros de retorno que têm valores correspondentes em ambas as tabelas
 
LEFT JOIN == Retorna todos os registros da tabela da esquerda  e os registros combinados da tabela da direita
 
RIGHT JOIN == Retorna todos os registros da tabela da direita, e os registros
combinados da tabela da esquerda
 
FULL JOIN Devolve todos os registros quando há uma correspondência
na tabela da esquerda ou da direita
 
mostrar a tabela de conjuntos do joins
https://alyssontmv.wordpress.com/2014/09/30/representando-sql-joins-graficamente-exemplo-usado-em-aula/

== RELAÇÕES ==
encomendas x clientes
encomendas x colaboradores
encomendas_produtos x encomendas x produtos */

--  Queremos dados sobre as encomendas de uma cliente cujo id = 20
SELECT c. *, e. * FROM clientes c LEFT Join encomendas  e  ON c.id = e.id_cliente WHERE c.id = 20;
 
-- 20 primeiros clientes que fizeram encomendas na loja:
SELECT e.id, e.data_hora, c.nome, c.email FROM encomendas e LEFT JOIN clientes c ON e.id_cliente = c.id LIMIT 20;

SELECT count(*) total FROM encomendas_produtos;

-- Detalhes da encomenda 3, quando foi efetuada a compra, que produtos foram comprados e as quantidades:
SELECT e.data_hora, p.produto, ep.quantidade FROM encomendas_produtos ep LEFT JOIN  encomendas e ON e.id = ep.id_encomenda LEFT JOIN produtos p ON p.id = ep.id_produto WHERE e.id = 3;

SELECT e.data_hora, p.produto, ep.quantidade, CONCAT(round(p.preco_unidade * ep.quantidade,2), 'R$') as total FROM encomendas_produtos ep LEFT JOIN  encomendas e ON e.id = ep.id_encomenda LEFT JOIN produtos p ON p.id = ep.id_produto WHERE e.id = 3;
-- CONCAT == concatenação 
-- round == vai arredondar os valores para duas casas decimais

------------- 16/08
-- Outras formas de agregação

-- MIN - Permitir ver o valor mínimo em um conjunto de resultados
-- MAX - Permitir ver o valor máximo em um conjunto de resultados

-- quero saber qual é o rpimeiro cliente de Lisboa na tabela cliente.
SELECT id, nome FROM clientes WHERE cidade = "Lisboa" LIMIT 1;
SELECT MIN(id), nome FROM clientes WHERE cidade = "Lisboa";

SELECT MAX(id), nome FROM clientes WHERE email LIKE "%gmail.com";

-- AGV - Permite calcular a média de um conjunto de resultados NUMÉRICOS.
-- SUM - Permite ver o somatório (calculo total) de um conjunto de resultados.  

-- Média de preços dos produtos
SELECT round (AVG(preco_unidade),2) preco_medio FROM produtos; 

-- Soma 
SELECT round (SUM(preco_unidade),2) total_preco FROM produtos; 

-- Vamos calcular uma determinada encomenda, buscando primeiramente seus dados. (id = 50)
SELECT e.id, -- atributo da tabela encomendas
  e.data_hora, -- atributo da tabela encomendas
  p.produto, -- atributo da tabela produto
  p.preco_unidade, -- atributo da tabela produto
  ep.quantidade -- atributo da tabela encomenda_produto
  FROM encomendas_produtos ep LEFT JOIN encomendas e ON ep.id_encomenda = e.id LEFT JOIN produtos p ON ep.id_produto = p.id WHERE e.id = 50;

-- 3 produtos (preco_unidade * quantidade)
SELECT e.id, -- atributo da tabela encomendas
  e.data_hora, -- atributo da tabela encomendas
  p.produto, -- atributo da tabela produto
  p.preco_unidade, -- atributo da tabela produto
  ep.quantidade, -- atributo da tabela encomenda_produto
  round(ep.quantidade * p.preco_unidade) AS total
  FROM encomendas_produtos ep LEFT JOIN encomendas e ON ep.id_encomenda = e.id LEFT JOIN produtos p ON ep.id_produto = p.id WHERE e.id = 50;

SELECT e.id, -- atributo da tabela encomendas
  e.data_hora, -- atributo da tabela encomendas
  p.produto, -- atributo da tabela produto
  p.preco_unidade, -- atributo da tabela produto
  ep.quantidade, -- atributo da tabela encomenda_produto
  round(SUM(ep.quantidade * p.preco_unidade,2)) AS `total encomendas`
  FROM encomendas_produtos ep LEFT JOIN encomendas e ON ep.id_encomenda = e.id LEFT JOIN produtos p ON ep.id_produto = p.id WHERE e.id = 50;


  SELECT id_encomenda, id_cliente, SUM(total) total FROM (SELECT ep.id_encomenda, e.id_cliente, ep.quantidade, p.produto, CAST(ep.quantidade * p.preco_unidade AS decimal(10,2)) AS total FROM encomendas_produtos ep LEFT JOIN produtos p ON ep.id_produto = p.id LEFT JOIN encomendas e ON e.id = ep.id_encomenda WHERE e.id = 50) a GROUP BY id_encomenda;