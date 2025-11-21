USE upfinity;

INSERT INTO Plano (nome, descricao, maxATMs, valorPlano) VALUES
('Básico', 'Monitoramento de até 12 ATMs', 12, 4790.00),
('Médio', 'Monitoramento de até 30 ATMs', 30, 10749.00),
('Avançado', 'Monitoramento de até 50 ATMs', 50, 20649.00);

INSERT INTO TipoUsuario (descricao) VALUES
('Suporte UpFinity'),
('Administrador'),
('Analista');

INSERT INTO TipoComponente (nome, unidadeMedida) VALUES
('CPU', '%'),
('Memória RAM', '%'),
('Disco', '%'),
('Placa de rede', 'mb');

INSERT INTO TipoComponente (nome, unidadeMedida, processos) VALUES
('CPU', 'ºC', 'Temperatura'), 
('CPU', 'MHz', 'Frequência');

INSERT INTO TipoAlerta (descricao, nivel) VALUES
('Crítico', 1),
('Moderado', 2);

INSERT INTO Endereco (logradouro, num, bairro, cidade, UF, CEP, complemento) VALUES
('Avenida Paulista', '1000', 'Bela Vista', 'São Paulo', 'SP', '01310100', 'Próximo ao metrô Trianon-Masp'),
('Avenida Rio Branco', '250', 'Centro', 'Rio de Janeiro', 'RJ', '20040009', 'Andar 15, Bloco B');

INSERT INTO Empresa (fkEndereco, fkPlano, razaoSocial, CNPJ, statusAprovacao, statusPagamento, nomeFantasia) VALUES
(1, 1, 'Banco Digital Exemplo SA', '12345678000190', 1, TRUE, 'Banco Exemplo'),
(2, null, 'Banco Digital Exemplo XY', '12345678000110', 1, FALSE, 'Banco Exemplo');

INSERT INTO Usuario (fkTipoUsuario, fkEmpresa, nome, CPF, email, senha) VALUES
(2, 1, 'João da Silva', '11122233344', 'joao.silva@bancoexemplo.com', 'senhaForte123'),
(3, 2, 'Maria Oliveira', '55566677788', 'maria.oliveira@bancoexemplo.com', 'outraSenha456');

INSERT INTO Atm (fkEmpresa, numeracao, IP, statusEstado, statusMonitoramento) VALUES
(1, 1, 123365907822356, 1, 1),
(1, 2, 901832106892356, 3, 2),
(1, 3, "169.254.238.99", 3, 2),
(2, 4, " ", 1, 0);

INSERT INTO Componente (idComponente, fkAtm, fkTipoComponente) VALUES
(1, 1, 1), 
(2, 1, 2),
(3, 1, 3), 
(4, 1, 4),
(5, 4, 5),
(6, 4, 6);

INSERT INTO Parametro (fkTipoComponente, fkEmpresa, fkTipoAlerta, limiteMax) VALUES
(1, 1, 1, 95.0), -- Alerta Crítico para CPU > 95%
(1, 1, 2, 85.0), -- Alerta Importante para CPU > 85%
(1, 2, 1, 95.0), -- Alerta Crítico para CPU > 95%
(1, 2, 2, 85.0); -- Alerta Importante para CPU > 85%

INSERT INTO Parametro (fkTipoComponente, fkEmpresa, fkTipoAlerta, limiteMax) VALUES
(2, 1, 1, 90.0), -- Alerta Crítico para RAM > 90%
(2, 1, 2, 80.0), -- Alerta Importante para RAM > 80%
(2, 2, 1, 90.0), -- Alerta Crítico para RAM > 90%
(2, 2, 2, 80.0); -- Alerta Importante para RAM > 80%

INSERT INTO Parametro (fkTipoComponente, fkEmpresa, fkTipoAlerta, limiteMax) VALUES
(3, 1, 1, 98.0), -- Alerta Crítico para Disco > 98%
(3, 1, 2, 90.0), -- Alerta Importante para Disco > 90%
(3, 2, 1, 98.0), -- Alerta Crítico para Disco > 98%
(3, 2, 2, 90.0); -- Alerta Importante para Disco > 90%

-- BRENO
UPDATE Empresa SET idSlack = 'C09UCNHCEAD' WHERE idEmpresa = 2;

-- BRENO
UPDATE Atm SET IP = '10.18.33.139' WHERE fkEmpresa = 2;

