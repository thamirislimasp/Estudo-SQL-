use exercicio_sql01;


CREATE TABLE IF NOT EXISTS `alunos` (
	`id_aluno` INT(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`nome` VARCHAR(30) NOT NULL,
	`sobrenome` VARCHAR(30) NOT NULL
    )ENGINE = InnoDB;
    
DROP TABLE IF EXISTS `alunos`;

--

INSERT INTO `alunos` (`id_aluno`, `nome`, `sobrenome`) VALUES
    (1, 'Joao', 'Lopes'),
    (2, 'Ana', 'Pereira'),
    (3, 'Carlos', 'Souza'),
    (4, 'Joaquim', 'Gonzaga'),
    (5, 'Cristina', 'Silva');
        
SELECT nome FROM alunos; 

CREATE TABLE IF NOT EXISTS `cursos` (
	`id_curso` INT(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`nome_curso` VARCHAR(30) NOT NULL
    )ENGINE = InnoDB;

DROP TABLE IF EXISTS `cursos`;

INSERT INTO `cursos` (`id_curso`, `nome_curso`) VALUES
    (1, 'Informática para Internet'),
    (2, 'Administração'),
    (3, 'Segurança do Trabalho');
    
SELECT nome_curso FROM cursos;

CREATE TABLE IF NOT EXISTS `clientes` (
	`id` INT(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`nome` VARCHAR(30) NOT NULL,
    `idade` INT(5) NOT NULL,
    `cidade` VARCHAR(30) NOT NULL
    )ENGINE = InnoDB;
    
DROP TABLE IF EXISTS `clientes`;

INSERT INTO `clientes` (`id`, `nome`, `idade`, `cidade`) VALUES
   (1, 'Joao', '20', 'São Paulo'),
    (2, 'Ana', '19', 'São José dos Campos'),
    (3, 'Carlos', '25', 'Ribeirão Pires');
    
SELECT * FROM clientes;

CREATE TABLE IF NOT EXISTS `pedidos` (
	`pedido_id` INT(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`cliente_id` INT(10) NOT NULL,
    `data_pedido` DATETIME NOT NULL,
    `valor_total` DECIMAL(30) NOT NULL,
    CONSTRAINT `FK_pedidos_clientes` FOREIGN KEY (`cliente_id`) REFERENCES `clientes`(`id`) ON DELETE CASCADE
    )ENGINE = InnoDB;
    
DROP TABLE IF EXISTS `pedidos`;
    
INSERT INTO `pedidos` (`pedido_id`, `cliente_id`, `data_pedido`, `valor_total`) VALUES
   (1, 1, '2024-05-22 23:38:25', '102,99'),
    (2, 2, '2024-05-22 23:38:36', '425,25'),
    (3, 3, '2024-05-22 23:38:57', '63,78');    

SELECT nome, data_pedido FROM clientes, pedidos;

SELECT cidade FROM clientes ORDER BY cidade asc;

CREATE TABLE IF NOT EXISTS `produtos` (
	`produto_id` INT(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`nome_produto` VARCHAR(20) NOT NULL,
    `categoria` VARCHAR(20) NOT NULL,
    `preco` DECIMAL(30) NOT NULL
    )ENGINE = InnoDB;
    
DROP TABLE IF EXISTS `produtos`;

INSERT INTO `produtos` (`produto_id`, `nome_produto`, `categoria`, `preco`) VALUES
	(1, 'Tablet', 'Eletrônicos', '102,99'),
	(2, 'Smartphone', 'Eletrônicos', '425,25'),
    (3, 'Armário', 'Móveis', '63,78'),
    (4, 'Sofá', 'Móveis', '63,78');
    
SELECT clientes.nome, clientes.cidade FROM clientes, pedidos;

