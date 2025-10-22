CREATE DATABASE IF NOT EXISTS upfinity;
USE upfinity;

-- Tabela TipoUsuario

CREATE TABLE IF NOT EXISTS TipoUsuario (
    idTipoUsuario INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(45) NOT NULL
);

-- Tabela TipoComponente

CREATE TABLE IF NOT EXISTS TipoComponente (
    idTipoComponente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL,
    unidadeMedida VARCHAR(45) NOT NULL,
    processos VARCHAR(45)
);

-- Tabela Endereco

CREATE TABLE IF NOT EXISTS Endereco (
    idEndereco INT PRIMARY KEY AUTO_INCREMENT,
    logradouro VARCHAR(45) NOT NULL,
    num CHAR(5) NOT NULL,
    bairro VARCHAR(45) NOT NULL,
    cidade VARCHAR(45) NOT NULL,
    UF CHAR(2) NOT NULL,
    CEP CHAR(8) NOT NULL,
	complemento VARCHAR(100)
);

-- Tabela TipoAlerta

CREATE TABLE IF NOT EXISTS TipoAlerta (
    idTipoAlerta INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(45),
    nivel INT NOT NULL
);


-- Tabela Empresa

CREATE TABLE IF NOT EXISTS Empresa (
    idEmpresa INT PRIMARY KEY AUTO_INCREMENT,
    razaoSocial VARCHAR(45) NOT NULL,
	CNPJ CHAR(14) NOT NULL,
    nomeFantasia VARCHAR(45)
);

-- Tabela Usuario

CREATE TABLE IF NOT EXISTS Usuario (
    idUsuario INT AUTO_INCREMENT,
    fkTipoUsuario INT NOT NULL,
    fkEmpresa INT NOT NULL,
    nome VARCHAR(45) NOT NULL,
    CPF CHAR(11) NOT NULL UNIQUE,
    email VARCHAR(45) NOT NULL UNIQUE,
    senha VARCHAR(45) NOT NULL,
    FOREIGN KEY (fkTipoUsuario) REFERENCES TipoUsuario(idTipoUsuario),
    FOREIGN KEY (fkEmpresa) REFERENCES Empresa(idEmpresa)
);

-- Tabela Atm

CREATE TABLE IF NOT EXISTS Atm (
    idAtm INT PRIMARY KEY AUTO_INCREMENT,
    fkEmpresa INT NOT NULL,
    fkEndereco INT NOT NULL,
    numeracao INT NOT NULL,
    latitude DOUBLE NOT NULL,
    longitude DOUBLE NOT NULL,
    statusEstado VARCHAR(45),
    statusOperacao INT,
    FOREIGN KEY (fkEmpresa) REFERENCES Empresa(idEmpresa),
    FOREIGN KEY (fkEndereco) REFERENCES Endereco(idEndereco)
);


---------------------------- DESENVOLVENDO:

-- Tabela Componente

CREATE TABLE IF NOT EXISTS Componente (
    idComponente INT,
    fkAtm INT NOT NULL,
    fkTipoComponente INT NOT NULL,
    PRIMARY KEY (idComponente, fkAtm),
    FOREIGN KEY (fkAtm) REFERENCES Atm(idAtm),
    FOREIGN KEY (fkTipoComponente) REFERENCES TipoComponente(idTipoComponente)
);

-- Tabela Captura

CREATE TABLE IF NOT EXISTS Captura (
    idCaptura INT PRIMARY KEY AUTO_INCREMENT,
    fkAtmComponente INT NOT NULL,
    valor DOUBLE,
    horario DATETIME,
    FOREIGN KEY (fkAtmComponente) REFERENCES Componente(idComponente)
);
