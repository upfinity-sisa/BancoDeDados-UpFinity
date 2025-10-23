CREATE DATABASE IF NOT EXISTS upfinity;
USE upfinity;

CREATE TABLE IF NOT EXISTS TipoUsuario (
    idTipoUsuario INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(45) NOT NULL
);

CREATE TABLE IF NOT EXISTS TipoComponente (
    idTipoComponente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL,
    unidadeMedida VARCHAR(45) NOT NULL,
    processos VARCHAR(45)
);

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

CREATE TABLE IF NOT EXISTS TipoAlerta (
    idTipoAlerta INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(100) NOT NULL,
    nivel INT NOT NULL
);

CREATE TABLE IF NOT EXISTS Plano (
	idPlano INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL,
    descricao VARCHAR(45) NOT NULL,
    maxATMs INT NOT NULL,
    valorPlano DOUBLE NOT NULL
);

CREATE TABLE IF NOT EXISTS Empresa (
    idEmpresa INT PRIMARY KEY AUTO_INCREMENT,
    fkPlano INT,
    razaoSocial VARCHAR(45) NOT NULL,
	CNPJ CHAR(14) NOT NULL,
    statusAprovacao INT NOT NULL,
    statusPagamento BOOLEAN NOT NULL,
    nomeFantasia VARCHAR(45),
    FOREIGN KEY (fkPlano) REFERENCES Plano(idPlano)
);

CREATE TABLE IF NOT EXISTS Usuario (
    idUsuario INT PRIMARY KEY AUTO_INCREMENT,
    fkTipoUsuario INT NOT NULL,
    fkEmpresa INT NOT NULL,
    nome VARCHAR(45) NOT NULL,
    CPF CHAR(11) NOT NULL UNIQUE,
    email VARCHAR(45) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL,
    FOREIGN KEY (fkTipoUsuario) REFERENCES TipoUsuario(idTipoUsuario),
    FOREIGN KEY (fkEmpresa) REFERENCES Empresa(idEmpresa)
);

CREATE TABLE IF NOT EXISTS Atm (
    idAtm INT PRIMARY KEY AUTO_INCREMENT,
    fkEmpresa INT NOT NULL,
    fkEndereco INT NOT NULL,
    numeracao INT NOT NULL,
    latitude DOUBLE NOT NULL,
    longitude DOUBLE NOT NULL,
    statusEstado INT NOT NULL, -- 0 - desligado, 1 - ligado, 2 - manutenção
    statusMonitoramento INT NOT NULL,
    FOREIGN KEY (fkEmpresa) REFERENCES Empresa(idEmpresa),
    FOREIGN KEY (fkEndereco) REFERENCES Endereco(idEndereco)
);

CREATE TABLE IF NOT EXISTS Componente (
    idComponente INT NOT NULL,
    fkAtm INT NOT NULL,
    fkTipoComponente INT NOT NULL,
    PRIMARY KEY (idComponente, fkAtm),
    FOREIGN KEY (fkAtm) REFERENCES Atm(idAtm),
    FOREIGN KEY (fkTipoComponente) REFERENCES TipoComponente(idTipoComponente)
);

CREATE TABLE IF NOT EXISTS Captura (
    idCaptura INT PRIMARY KEY AUTO_INCREMENT,
    fkComponente INT NOT NULL,
	fkAtm INT NOT NULL,
    valor DOUBLE NOT NULL,
    horario DATETIME NOT NULL,
    FOREIGN KEY (fkComponente, fkAtm) REFERENCES Componente(idComponente, fkAtm)
);

CREATE TABLE IF NOT EXISTS Alerta (
    idAlerta INT PRIMARY KEY AUTO_INCREMENT,
    fkTipoAlerta INT NOT NULL,
    fkCaptura INT NOT NULL UNIQUE,
    FOREIGN KEY (fkTipoAlerta) REFERENCES TipoAlerta(idTipoAlerta),
    FOREIGN KEY (fkCaptura) REFERENCES Captura(idCaptura)
);


-- Tabela Parametro

-- Necessidade de validar no back-end o seguinte problema:

-- fkEmpresa = 1, fkTipoComponente = 1, fkTipoAlerta = 1 (Crítico), limiteMax = 90.0 (%)
-- fkEmpresa = 1, fkTipoComponente = 1, fkTipoAlerta = 2 (Importante), limiteMax = 90.0 (%)

-- Aqui gera dois alertas, um Crítico e um Importante caso Captura > 90.0 (%)

-- O que deveria ser:

-- fkEmpresa = 1, fkTipoComponente = 1, fkTipoAlerta = 1 (Crítico), limiteMax = 90.0 (%)
-- fkEmpresa = 1, fkTipoComponente = 1, fkTipoAlerta = 2 (Importante), limiteMax = 80.0 (%)

-- Aqui gera um alerta, um Crítico para Captura > 90.0 (%) e um Importante para Captura > 80.0 (%)

-- Duas soluções:

-- SOLUÇÃO 1: Antes de salvar um novo parâmetro pelo front da aplicação, ela deveria verificar: "Já existe algum parâmetro para esta Empresa/Componente com um limite conflitante?"

-- SOLUÇÃO 2: O código deve ter uma lógica de prioridade. Por exemplo: "Se múltiplos alertas forem disparados pela mesma captura, gere apenas o alerta de maior severidade".

CREATE TABLE IF NOT EXISTS Parametro (
    idParametro INT PRIMARY KEY AUTO_INCREMENT,
    fkTipoComponente INT NOT NULL,
    fkEmpresa INT NOT NULL,
    fkTipoAlerta INT NOT NULL,
    limiteMin DOUBLE,
    limiteMax DOUBLE,
    UNIQUE(fkEmpresa, fkTipoComponente, fkTipoAlerta),
    FOREIGN KEY (fkTipoComponente) REFERENCES TipoComponente(idTipoComponente),
    FOREIGN KEY (fkEmpresa) REFERENCES Empresa(idEmpresa),
    FOREIGN KEY (fkTipoAlerta) REFERENCES TipoAlerta(idTipoAlerta)
);
