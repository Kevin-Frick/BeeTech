-- Criação do banco
CREATE DATABASE IF NOT EXISTS beeTechDB
  DEFAULT CHARACTER SET utf8mb4
  COLLATE utf8mb4_0900_ai_ci;

USE beeTechDB;

-- ============================
-- Tabela: administrador
-- ============================
DROP TABLE IF EXISTS administrador;

CREATE TABLE administrador (
  id INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(50) NOT NULL,
  cpf VARCHAR(16) NOT NULL,
  telefone VARCHAR(15) NOT NULL,
  senha_hash VARCHAR(255) NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY cpf_UNIQUE (cpf)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO administrador VALUES
(1,'João Silva','12345678900','(11) 99999-9999','$2a$10$z5yspDRq9Zt5S8XslIY.WuI5bbWQHq9pZ2I/91c.NJvK2aR6qQbA2'),
(2,'Maicon Oliveira','12345678','(75) 98888-8888','$2b$12$MTxG/8PBCAWt2Ky9R5zJxuXBXMKVoUcvIhsXHQxeLqfoxhgFSL7GO'),
(3,'Maicon','12345','0000000','$2a$10$YWsPfCGTyCVVmz185BaRUuN0iQGo6Qnea.csNbMMi8gs1L.Xo51F2');

-- ============================
-- Tabela: agenteNegocios
-- ============================
DROP TABLE IF EXISTS agenteNegocios;

CREATE TABLE agenteNegocios (
  id INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(50) NOT NULL,
  cpf VARCHAR(16) NOT NULL,
  telefone VARCHAR(15) NOT NULL,
  senha_hash VARCHAR(255) NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY cpf_UNIQUE (cpf)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO agenteNegocios VALUES
(1,'Anakin Skywalker','98765432100','(71) 98888-8888','$2a$10$T2xT0oQz9bUw4QxAeqEVQOMzS1dN9fVABeL4WphF1QpTzfsR8E5lG'),
(2,'Maicon de Oliveira','1234','0000000','$2a$10$YWsPfCGTyCVVmz185BaRUuN0iQGo6Qnea.csNbMMi8gs1L.Xo51F2'),
(3,'Saruman','0001','258989898','$2a$10$1qAkZ8JM.9a4d4Yv5vTRPOMbW/OUPwg9cCuFk9cb6XgNRtuRtrCyy');

-- ============================
-- Tabela: apicultor
-- ============================
DROP TABLE IF EXISTS apicultor;

CREATE TABLE apicultor (
  id INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(45) NOT NULL,
  cpfCnpj VARCHAR(45) NOT NULL,
  telefone VARCHAR(20),
  endereco VARCHAR(45),
  PRIMARY KEY (id),
  UNIQUE KEY cpfCnpj_UNIQUE (cpfCnpj)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO apicultor VALUES
(1,'João Silva de Souza','123.456.789-00','71-99999-0001','R. das Flores, 100, Salvador - BA'),
(2,'Maria Legolas','987.654.321-00','71-99999-0002','Av. Central, 200, Feira de Santana - BA'),
(3,'Carlos Boromir','12.345.678/0001-90','71-99999-0003','Estr. do Campo, 50, Santo Amaro - BA'),
(4,'Leia','55.666.777-88','71-99999-0004','R. do Mel, 77, Ilhéus - BA'),
(5,'Gabriel 1','123.444.555-80','75-99932-0053','Rua da Subestação, Euclides da Cunha - BA'),
(6,'Gabriel 2','123.445.566-80','75-99932-0055','Euclides da Cunha - BA'),
(7,'Kevin','123.666.666-69','75-99945-6669','Nova América, Euclides da Cunha - BA');

-- ============================
-- Tabela: inventario
-- ============================
DROP TABLE IF EXISTS inventario;

CREATE TABLE inventario (
  id INT NOT NULL AUTO_INCREMENT,
  id_apicultor INT UNIQUE,
  PRIMARY KEY (id),
  FOREIGN KEY (id_apicultor) REFERENCES apicultor(id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO inventario VALUES
(1,1),(2,2),(3,3),(4,4),(5,5),(6,6);

-- ============================
-- Tabela: apiario
-- ============================
DROP TABLE IF EXISTS apiario;

CREATE TABLE apiario (
  id INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(45) NOT NULL,
  localizacao VARCHAR(50) NOT NULL,
  id_apicultor INT NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (id_apicultor) REFERENCES apicultor(id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO apiario VALUES
(1,'Apiário Flor do Campo','Fazenda Boa Vista, Zona Rural',1),
(2,'Apiário Vale Doce','Sítio Vale Verde, Zona Rural',1),
(3,'Apiário Doce Mel','Fazenda Nova Esperança',2),
(4,'Apiário Beira Rio','Margem do Rio Grande',3),
(5,'Apiário Canto das Abelhas','Sítio Alegria',4),
(6,'Flor de Maracujá','Euclides da Cunha - BA',7),
(7,'Apiário do Condado','Rua da Subestação, Euclides da Cunha -BA',5),
(8,'Apiário de Mordor','Pov. Cachorro de cócoras, Euclides da Cunha - BA',5),
(9,'Apiário Vai Corinthians','MCMV, Euclides da Cunha - BA',6);

-- ============================
-- Tabela: caixa
-- ============================
DROP TABLE IF EXISTS caixa;

CREATE TABLE caixa (
  id INT NOT NULL AUTO_INCREMENT,
  identificacao VARCHAR(45) NOT NULL,
  id_apiario INT,
  PRIMARY KEY (id),
  FOREIGN KEY (id_apiario) REFERENCES apiario(id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO caixa VALUES
(1,'CX-001',1),(2,'CX-002',1),(3,'CX-003',2),(4,'CX-004',3),(5,'CX-005',4),
(6,'CX-006',5),(7,'01',7),(8,'02',7),(9,'03',7),(10,'04',7),(11,'05',7),
(12,'06',8),(13,'07',8),(14,'08',8),(15,'09',8),
(17,'10 - caixa editada',8),(18,'01 - caixa editada',9),(19,'02',9),(20,'03',9),
(21,'caixa 666',6);

-- ============================
-- Tabela: bem
-- ============================
DROP TABLE IF EXISTS bem;

CREATE TABLE bem (
  id INT NOT NULL AUTO_INCREMENT,
  item VARCHAR(45) NOT NULL,
  quantidade INT NOT NULL,
  descricao VARCHAR(255),
  valor DECIMAL(10,2) NOT NULL,
  data DATE NOT NULL,
  id_inventario INT NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (id_inventario) REFERENCES inventario(id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO bem VALUES
(1,'Favo de Mel Tipo A',10,'Favos extraídos na safra de outono',250.00,'2025-09-15',1),
(2,'Colmeia Completa',2,'Colmeias de madeira com moldes',1200.00,'2025-06-10',1),
(3,'Carrinho Transp.',1,'Carrinho para transporte de caixas',450.50,'2025-07-03',2),
(4,'Pente de Cera',20,'Pentes para produção de cera',15.00,'2025-08-01',3),
(5,'Roupas de Proteção',5,'Macacões completos',320.00,'2025-05-20',4),
(6,'Extrator de Mel',1,'Extrator centrífugo 20kg',1800.00,'2025-04-12',2),
(7,'Fumegador',1,'',120.00,'2025-11-14',4),
(8,'Roupas de proteção',6,'',500.00,'2025-12-02',5),
(9,'Caixas',10,'Caixas para o criatório',1000.00,'2025-12-09',5),
(10,'Abelhas Rainhas',2,'Abelhas Rainhas para início de colméias',100.00,'2025-12-09',6);

-- ============================
-- Tabela: gasto
-- ============================
DROP TABLE IF EXISTS gasto;

CREATE TABLE gasto (
  id INT NOT NULL AUTO_INCREMENT,
  tipo ENUM('TRANSPORTE','INSUMOS','MANUTENÇAO') NOT NULL,
  valor DECIMAL(10,2) NOT NULL,
  data DATE,
  id_apicultor INT NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (id_apicultor) REFERENCES apicultor(id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO gasto VALUES
(1,'TRANSPORTE',150.75,'2025-09-20',1),
(2,'INSUMOS',320.00,'2025-08-05',1),
(3,'MANUTENÇAO',480.00,'2025-07-28',2),
(4,'INSUMOS',75.50,'2025-06-30',3),
(5,'TRANSPORTE',220.00,'2025-10-01',4),
(6,'MANUTENÇAO',120.00,'2025-05-15',2),
(7,'TRANSPORTE',500.00,'2025-12-01',5),
(8,'INSUMOS',25.00,'2025-12-02',5),
(9,'TRANSPORTE',100.00,'2025-12-10',6),
(10,'MANUTENÇAO',15.00,'2025-12-26',6),
(11,'MANUTENÇAO',125.00,'2025-12-13',7);

-- ============================
-- Tabela: producao
-- ============================
DROP TABLE IF EXISTS producao;

CREATE TABLE producao (
  id INT NOT NULL AUTO_INCREMENT,
  tipo ENUM('MEL','CERA','PROPOLIS') NOT NULL,
  quantidade DECIMAL(10,2) NOT NULL,
  data DATE NOT NULL,
  id_caixa INT NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (id_caixa) REFERENCES caixa(id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO producao VALUES
(1,'MEL',35.50,'2025-09-10',1),
(2,'CERA',12.00,'2025-08-20',2),
(3,'MEL',20.75,'2025-07-15',3),
(4,'PROPOLIS',3.50,'2025-06-10',4),
(5,'MEL',40.00,'2025-10-02',5),
(6,'CERA',8.25,'2025-04-22',6),
(7,'MEL',10.00,'2025-12-11',7),
(8,'CERA',12.00,'2025-12-11',8);
