#CATARINA TABLES

use upfinity;

CREATE TABLE IF NOT EXISTS Seguranca (
idSeguranca INT PRIMARY KEY,
categoria VARCHAR(45),
salvamento BOOLEAN,
fkAtm INT,
FOREIGN KEY (fkAtm) references Atm(idAtm),
CHECK (categoria in('arquivo', 'conexao', 'invasao', 'processo'))
);

CREATE TABLE IF NOT EXISTS ItemSalvo (
idItemSalvo INT AUTO_INCREMENT,
categoria VARCHAR(45),
conteudo01 VARCHAR(200),
conteudo02 VARCHAR(200),
fkSeguranca INT,
PRIMARY KEY (idItemSalvo, fkSeguranca),
FOREIGN KEY (fkSeguranca) REFERENCES Seguranca(idSeguranca),
CHECK (categoria in('arquivo', 'conexao', 'processo'))
);

CREATE TABLE IF NOT EXISTS AlertaSeguranca (
idAlertaSeguranca INT PRIMARY KEY AUTO_INCREMENT,
categoria VARCHAR(45),
mensagem VARCHAR(60),
horario DATETIME,
CHECK (categoria in('arquivo', 'conexao', 'invasao', 'processo'))
);

CREATE TABLE IF NOT EXISTS Invasao (
idInvasao INT AUTO_INCREMENT,
horarioCaptura DATETIME,
horarioInvasao DATETIME,
IP CHAR(15),
fkSeguranca INT,
fkAlertaSeguranca INT,
PRIMARY KEY (idInvasao, fkSeguranca, fkAlertaSeguranca),
FOREIGN KEY (fkSeguranca) REFERENCES Seguranca(idSeguranca),
FOREIGN KEY (fkAlertaSeguranca) REFERENCES AlertaSeguranca(idAlertaSeguranca)
);

CREATE TABLE IF NOT EXISTS ConexaoAberta (
idConexaoAberta INT AUTO_INCREMENT,
portaLocal VARCHAR(45),
IPremoto VARCHAR(45),
horario DATETIME,
fkSeguranca INT,
fkAlertaSeguranca INT,
PRIMARY KEY (idConexaoAberta, fkSeguranca),
FOREIGN KEY (fkSeguranca) REFERENCES Seguranca(idSeguranca),
FOREIGN KEY (fkAlertaSeguranca) REFERENCES AlertaSeguranca(idAlertaSeguranca)
);

CREATE TABLE IF NOT EXISTS ProcessoPrivilegiado (
idProcessoPrivilegiado INT AUTO_INCREMENT,
nome VARCHAR(60),
horario DATETIME,
fkSeguranca INT, 
fkAlertaSeguranca INT,
PRIMARY KEY (idProcessoPrivilegiado, fkSeguranca),
FOREIGN KEY (fkSeguranca) REFERENCES Seguranca(idSeguranca),
FOREIGN KEY (fkAlertaSeguranca) REFERENCES AlertaSeguranca(idAlertaSeguranca)
);

CREATE TABLE IF NOT EXISTS ArquivoCritico (
idArquivoCritico INT AUTO_INCREMENT,
nome VARCHAR(60),
hashArqCritico VARCHAR(200),
horario DATETIME,
fkSeguranca INT, 
fkAlertaSeguranca INT,
PRIMARY KEY (idArquivoCritico, fkSeguranca),
FOREIGN KEY (fkSeguranca) REFERENCES Seguranca(idSeguranca),
FOREIGN KEY (fkAlertaSeguranca) REFERENCES AlertaSeguranca(idAlertaSeguranca)
);