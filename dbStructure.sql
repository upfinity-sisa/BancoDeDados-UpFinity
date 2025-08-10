DROP DATABASE db;
CREATE DATABASE db;
USE db;

CREATE TABLE IF NOT EXISTS EMPRESA (
    id_empresa         INT           NOT NULL auto_increment,
    razao_social       VARCHAR(45)   NOT NULL UNIQUE,
    nome_fantasia      VARCHAR(50)   NOT NULL,
    cnpj               VARCHAR(45)   NULL UNIQUE,
    data_criacao       DATETIME      NULL,
    date_edicao        DATETIME      NULL,
    PRIMARY KEY (id_empresa)
);

CREATE TABLE IF NOT EXISTS USUARIO (
    id_usuario         INT           NOT NULL AUTO_INCREMENT,
    nome               VARCHAR(45)   NOT NULL,
    email              VARCHAR(85)   NOT NULL UNIQUE,
    senha              VARCHAR(64)   NOT NULL,
    fk_empresa         INT           NOT NULL,
    cpf                VARCHAR(11)   NOT NULL UNIQUE,
    data_nasc          DATE          NOT NULL,
    funcao_empresa     VARCHAR(45)   NOT NULL,
    data_criacao       DATETIME      NOT NULL,
    data_edicao        DATETIME      NOT NULL,
    PRIMARY KEY (id_usuario),
    FOREIGN KEY (fk_empresa) REFERENCES EMPRESA(id_empresa)
);

CREATE TABLE IF NOT EXISTS LOG (
    id_logs            INT           NOT NULL AUTO_INCREMENT,
    tipo_processo      VARCHAR(80)   NOT NULL,
    status             VARCHAR(50)   NULL,
    mensagem           VARCHAR(255)  NULL,
    usuario            VARCHAR(90)   NULL,
    data_criacao       DATETIME      NULL,
    data_edicao        DATETIME      NULL,
    PRIMARY KEY (id_logs)
);

CREATE TABLE IF NOT EXISTS TELEFONE (
    id_telefone        INT           NOT NULL AUTO_INCREMENT,
    telefone           CHAR(11)      NULL,
    fk_empresa         INT           NOT NULL,
    data_criacao       DATETIME      NULL,
    data_edicao        DATETIME      NULL,
    PRIMARY KEY (id_telefone),
    FOREIGN KEY (fk_empresa) REFERENCES EMPRESA(id_empresa)
);

CREATE TABLE IF NOT EXISTS ENDERECO (
    id_endereco        INT           NOT NULL AUTO_INCREMENT,
    rua                VARCHAR(75)   NULL,
    bairro             VARCHAR(45)   NULL,
    cep                CHAR(8)       NULL,
    cidade             VARCHAR(45)   NULL,
    uf                 CHAR(2)       NULL,
    fk_empresa         INT           NOT NULL,
    data_criacao       DATETIME      NULL,
    data_edicao        DATETIME      NULL,
    PRIMARY KEY (id_endereco),
    FOREIGN KEY (fk_empresa) REFERENCES EMPRESA(id_empresa)
);

CREATE TABLE IF NOT EXISTS NOTIFICACAO (
    id_notificacao     INT           NOT NULL AUTO_INCREMENT,
    canal              VARCHAR(45)   NULL,
    cargo              VARCHAR(45)   NULL,
    status             TINYINT       NULL,
    fk_usuario         INT           NOT NULL,
    fk_empresa         INT           NOT NULL,
    data_criacao       DATETIME      NULL,
    data_edicao        DATETIME      NULL,
    PRIMARY KEY (id_notificacacoes)
);

