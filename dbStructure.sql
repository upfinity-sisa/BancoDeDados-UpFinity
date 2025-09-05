
CREATE DATABASE upfinity;
USE upfinity;

CREATE TABLE Endereco (
    idEndereco INT PRIMARY KEY AUTO_INCREMENT ,
    cep CHAR(9) NOT NULL,
    uf CHAR(2) NOT NULL,
    cidade VARCHAR(70) NOT NULL,
    logradouro VARCHAR(70) NOT NULL,
    bairro VARCHAR(70) NOT NULL,
    complemento VARCHAR(80),
    latitude DECIMAL(10,8) NOT NULL,
    longitude DECIMAL(11,8) NOT NULL,
    numero INT NOT NULL
);

CREATE TABLE Empresa (
    idEmpresa INT PRIMARY KEY AUTO_INCREMENT,
    razaoSocial VARCHAR(45) NOT NULL,
    cnpj CHAR(14) NOT NULL,
    fkEndereco INT NOT NULL,
    FOREIGN KEY (fkEndereco) REFERENCES Endereco(idEndereco)
);

CREATE TABLE Atm (
    idAtm INT PRIMARY KEY AUTO_INCREMENT,
    fkEmpresa INT NOT NULL,
    referencia VARCHAR(45) NOT NULL,
    hostname VARCHAR(45) NOT NULL,
    modelo VARCHAR(45) NOT NULL,
    ip VARCHAR(45) NOT NULL,
    macAddress VARCHAR(45) NOT NULL,
    sistemaOperacional VARCHAR(45) NOT NULL,
    statusAtm VARCHAR(45) NOT NULL,
    FOREIGN KEY (fkEmpresa) REFERENCES Empresa(idEmpresa)
);

CREATE TABLE Componente (
    idComponente INT PRIMARY KEY AUTO_INCREMENT,
    tipo VARCHAR(45) NOT NULL,
    unidadeMedida VARCHAR(15) NOT NULL,
    funcaoMonitorada VARCHAR(45) NOT NULL
);

CREATE TABLE Parametro (
    idParametro INT PRIMARY KEY AUTO_INCREMENT,
    fkComponente INT NOT NULL,
    fkAtm INT NOT NULL,
    limite VARCHAR(45) NOT NULL,
    FOREIGN KEY (fkComponente) REFERENCES Componente(idComponente),
    FOREIGN KEY (fkAtm) REFERENCES Atm(idAtm)
);

CREATE TABLE Alerta (
    idAlerta INT PRIMARY KEY AUTO_INCREMENT,
    fkParametro INT NOT NULL,
    descricao VARCHAR(45),
    tipoAlerta VARCHAR(45) NOT NULL,
    nivel VARCHAR(45) NOT NULL,
    valor FLOAT NOT NULL, 
    dataHoraInicio DATETIME NOT NULL,
    dataHoraFinal DATETIME ,
    FOREIGN KEY (fkParametro) REFERENCES Parametro(idParametro)
);

CREATE TABLE Registro (
    idRegistro INT PRIMARY KEY AUTO_INCREMENT,
    fkParametro INT NOT NULL,
    valor FLOAT NOT NULL,
    horario DATETIME NOT NULL,
    FOREIGN KEY (fkParametro) REFERENCES Parametro(idParametro)
);

CREATE TABLE Permissao (
    idPermissao INT PRIMARY KEY AUTO_INCREMENT,
    permissao VARCHAR(15) NOT NULL
);

CREATE TABLE Usuario (
    idUsuario INT PRIMARY KEY AUTO_INCREMENT,
    fkPermissao INT NOT NULL,
    fkEmpresa INT NOT NULL,
    nomeUsuario VARCHAR(45) NOT NULL,
	cargo VARCHAR(100) NOT NULL,
    email VARCHAR(255) NOT NULL,
    senha VARCHAR(250) NOT NULL,
    telefone VARCHAR(20) NOT NULL,
    FOREIGN KEY (fkPermissao) REFERENCES Permissao(idPermissao),
    FOREIGN KEY (fkEmpresa) REFERENCES Empresa(idEmpresa)
);
