CREATE DATABASE upfinity;
USE upfinity;

-- Criação das tabelas do modelo

CREATE TABLE TipoComponente (
    idTipoComponente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL,
    unidadeMedida VARCHAR(45) NOT NULL
);

CREATE TABLE Empresa (
    idEmpresa INT PRIMARY KEY AUTO_INCREMENT,
    razaoSocial VARCHAR(45) NOT NULL,
    nomeFantasia VARCHAR(45),
    CNPJ CHAR(14) NOT NULL
);

CREATE TABLE Endereco (
    idEndereco INT PRIMARY KEY AUTO_INCREMENT,
    logradouro VARCHAR(45) NOT NULL,
    num CHAR(5) NOT NULL,
    complemento VARCHAR(100),
    bairro VARCHAR(45) NOT NULL,
    cidade VARCHAR(45) NOT NULL,
    UF CHAR(2) NOT NULL,
    CEP CHAR(8) NOT NULL
);

CREATE TABLE Atm (
    idAtm INT PRIMARY KEY AUTO_INCREMENT,
    fkEmpresa INT NOT NULL,
    fkEndereco INT NOT NULL,
    numeroAtm INT NOT NULL,
    ip VARCHAR(45) NOT NULL,
    macAddress VARCHAR(45) NOT NULL,
    latitude DOUBLE NOT NULL,
    longitude DOUBLE NOT NULL,
    status INT,
    FOREIGN KEY (fkEmpresa) REFERENCES Empresa(idEmpresa),
    FOREIGN KEY (fkEndereco) REFERENCES Endereco(idEndereco)
);

CREATE TABLE Componente (
    idComponente INT PRIMARY KEY AUTO_INCREMENT,
    fkAtm INT NOT NULL,
    fkTipoComponente INT NOT NULL,
    FOREIGN KEY (fkAtm) REFERENCES Atm(idAtm),
    FOREIGN KEY (fkTipoComponente) REFERENCES TipoComponente(idTipoComponente)
);

CREATE TABLE Captura (
    idCaptura INT PRIMARY KEY AUTO_INCREMENT,
    fkAtmComponente INT NOT NULL,
    valor DOUBLE,
    horario DATETIME,
    FOREIGN KEY (fkAtmComponente) REFERENCES Componente(idComponente)
);

CREATE TABLE TipoAlerta (
    idTipoAlerta INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(45),
    nivel INT
);

CREATE TABLE Alerta (
    idAlerta INT PRIMARY KEY AUTO_INCREMENT,
    fkTipoAlerta INT NOT NULL,
    fkCaptura INT NOT NULL,
    FOREIGN KEY (fkTipoAlerta) REFERENCES TipoAlerta(idTipoAlerta),
    FOREIGN KEY (fkCaptura) REFERENCES Captura(idCaptura)
);

CREATE TABLE Parametro (
    idParametro INT PRIMARY KEY AUTO_INCREMENT,
    fkTipoComponente INT NOT NULL,
    fkEmpresa INT NOT NULL,
    limiteMin DOUBLE,
    limiteMax DOUBLE,
    FOREIGN KEY (fkTipoComponente) REFERENCES TipoComponente(idTipoComponente),
    FOREIGN KEY (fkEmpresa) REFERENCES Empresa(idEmpresa)
);

CREATE TABLE TipoUsuario (
    idTipoUsuario INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(45)
);

CREATE TABLE Usuario (
    idUsuario INT PRIMARY KEY AUTO_INCREMENT,
    fkTipoUsuario INT NOT NULL,
    nome VARCHAR(45) NOT NULL,
    CPF CHAR(11) NOT NULL,
    email VARCHAR(45) NOT NULL,
    senha VARCHAR(45) NOT NULL,
    FOREIGN KEY (fkTipoUsuario) REFERENCES TipoUsuario(idTipoUsuario)
);

CREATE TABLE Token (
    idToken INT PRIMARY KEY AUTO_INCREMENT,
    fkEmpresa INT NOT NULL,
    fkUsuario INT NOT NULL,
    statusToken TINYINT,
    dtGeracao TIMESTAMP,
    duracaoHoras INT,
    codigo CHAR(8),
    FOREIGN KEY (fkEmpresa) REFERENCES Empresa(idEmpresa),
    FOREIGN KEY (fkUsuario) REFERENCES Usuario(idUsuario)
);
