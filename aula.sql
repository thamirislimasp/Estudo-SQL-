-- Selecionando uma tabela:
SELECT * FROM amigos;

-- Selecionando uma tupla da tabela:

SELECT * FROM amigos WHERE ID = 5;

-- Selecionando uma tupla da tabela:
-- Com o nome aparecendo:

SELECT amigos.nome, telefones.id_amigo FROM amigos, telefones WHERE amigos.id = telefones.id_amigo AND telefones.id_amigo = 5;

-- Selecionando apenas o telefone da Cristina:

SELECT amigos.nome, telefones.numero FROM amigos, telefones WHERE amigos.id = telefones.id_amigo AND amigos.nome = "Cristina";

-- Quero a mesma query, mas com o nome da coluna igual ao nome da Cristina:

SELECT telefones.numero 'Cristina' FROM amigos, telefones WHERE amigos.id = telefones.id_amigo AND amigos.nome = "Cristina";

-- Selecionando uma coluna da tabela:

SELECT nome FROM amigos;

-- Obter dados dos clientes ordenados por ordem alfabetica do nome:

SELECT * FROM amigos ORDER BY nome asc;
SELECT nome FROM amigos ORDER BY nome asc;

-- Quero todos os números que comecem com 5:

SELECT * FROM telefones WHERE numero LIKE '5%'; 
SELECT * FROM amigos WHERE nome LIKE 'J%';

-- Selecionando dois atributos de uma mesma tabela:

SELECT id, nome FROM amigos;

-- CRUD (CREATE, UPDATE e DELETE)
-- Atualizar o nome Cristina para Maria:

UPDATE amigos SET nome = "Maria" WHERE nome = "Cristina";




