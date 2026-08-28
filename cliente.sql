DROP TABLE cliente;
CREATE TABLE cliente 
( 
 id INT PRIMARY KEY AUTO_INCREMENT,  
 nome VARCHAR (100) NOT NULL,  
 cpf CHAR (14) UNIQUE,   
 email VARCHAR (200) NOT NULL UNIQUE,  
 senha VARCHAR(255) NOT NULL,  
 celular CHAR(11)
); 

CREATE TABLE compra 
( 
 idcliente INT,  
 idendereço INT,  
 data DATE NOT NULL,  
 forma_pagamente VARCHAR (200) NOT NULL,  
 valor_total FLOAT NOT NULL,  
 UNIQUE (idendereço)
); 

CREATE TABLE endereço 
( 
 idcliente INT,  
 rua VARCHAR (300) NOT NULL,  
 numero INT,  
 bairro VARCHAR (200) NOT NULL,  
 cidade VARCHAR (100) NOT NULL,  
 estado VARCHAR (100) NOT NULL,  
 UNIQUE (numero)
); 

CREATE TABLE produto 
( 
 id INT PRIMARY KEY,  
 nome VARCHAR (100) NOT NULL,  
 descrição VARCHAR (200) NOT NULL,  
 categoria VARCHAR (200) NOT NULL,  
 preço INT NOT NULL,  
 caminho_img VARCHAR (400) NOT NULL,  
 quantidade_img INT NOT NULL,  
); 

CREATE TABLE possui 
( 
 idCOMPRA INT,  
 idPRODUTO INT,  
 quantidade INT NOT NULL,  
 valor_unitario FLOAT NOT NULL,  
 UNIQUE (id,id)
); 

ALTER TABLE compra ADD FOREIGN KEY(idcliente) REFERENCES cliente (idcliente)
ALTER TABLE compra ADD FOREIGN KEY(idendereço) REFERENCES endereço (idendereço)
ALTER TABLE endereço ADD FOREIGN KEY(idcliente) REFERENCES cliente (idcliente)
ALTER TABLE possui ADD FOREIGN KEY(id) REFERENCES compra (id)
ALTER TABLE possui ADD FOREIGN KEY(id) REFERENCES produto (id)
