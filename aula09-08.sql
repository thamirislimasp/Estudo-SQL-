-- 09/08

-- crescente
SELECT id, produto FROM produtos ORDER BY produto ASC;

-- decrescente
SELECT produto FROM produtos ORDER BY produto DESC;

-- Um dos dados em ordem, porém quero puxar outros dados junto
SELECT id, nome, email, cidade FROM clientes ORDER BY nome ASC;

-- Um dois dados em ordem, porém quero puxar outros dados junto
-- (desta forma a ordem vem por cidade e depois o nome:)
SELECT id, nome, email, cidade FROM clientes ORDER BY cidade, nome ASC;

-- Para ordenar de forma simultanea usamos a seguinte query:
SELECT id, nome, email, cidade FROM clientes ORDER BY cidade DESC, nome ASC;

-- Organizar a tabela "produto" do mais caro para o mais barato:
SELECT id, produto, preco_unidade FROM produtos ORDER BY preco_unidade DESC;

-- Encomendas mais recentes:
SELECT * FROM encomendas ORDER BY data_hora DESC;

-- Buscar os 10 primeiros da tabela:
SELECT id, nome, email FROM clientes LIMIT 10;

-- Buscar os 10 ultimos da tabela:
SELECT id, nome, email FROM clientes ORDER BY id DESC LIMIT 10, nome ASC;

-- Ele pegará 20 dados a partir do id 6:
SELECT id, nome, email FROM clientes LIMIT 20 OFFSET 5;
