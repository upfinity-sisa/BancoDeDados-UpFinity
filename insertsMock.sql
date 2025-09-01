USE upfinity;
-- INSERINDO ENDEREÇOS
INSERT INTO Endereco VALUES
(1, '01001-000', 'SP', 'São Paulo', 'Av. Paulista', 'Bela Vista', 'Próximo ao MASP', -23.561684, -46.655981, 1000),
(2, '20040-002', 'RJ', 'Rio de Janeiro', 'Rua da Assembleia', 'Centro', NULL, -22.906847, -43.172896, 50),
(3, '30130-000', 'MG', 'Belo Horizonte', 'Av. Afonso Pena', 'Centro', 'Edifício JK', -19.919052, -43.938668, 400);

-- INSERINDO EMPRESAS
INSERT INTO Empresa VALUES
(1, 'TechVision Ltda', '12345678000199', 1),
(2, 'EcoMonitor S.A.', '98765432000188', 2),
(3, 'DataSense Brasil', '45678912000177', 3);

-- INSERINDO PERMISSÕES
INSERT INTO Permissao VALUES
(1, 'Admin'),
(2, 'Operador'),
(3, 'Visualizador');

-- INSERINDO USUÁRIOS
INSERT INTO Usuario VALUES
(1, 1, 1, 'joao.silva', 'Gerente de TI', 'joao@techvision.com', 'senha123', '11999999999'),
(2, 2, 2, 'maria.oliveira', 'Analista Ambiental', 'maria@ecomonitor.com', 'senha456', '21988888888'),
(3, 3, 3, 'carlos.souza', 'Supervisor de Dados', 'carlos@datasense.com', 'senha789', '31977777777');

-- INSERINDO ATMs
INSERT INTO Atm VALUES
(1, 1, 'ATM-SP-01', 'atm01.techvision.local', 'Model-X', '192.168.0.1', 'AA:BB:CC:DD:EE:01', 'Linux', 'Ativo'),
(2, 2, 'ATM-RJ-01', 'atm01.ecomonitor.local', 'Model-Y', '192.168.0.2', 'AA:BB:CC:DD:EE:02', 'Windows', 'Ativo'),
(3, 3, 'ATM-MG-01', 'atm01.datasense.local', 'Model-Z', '192.168.0.3', 'AA:BB:CC:DD:EE:03', 'Linux', 'Inativo');

-- INSERINDO COMPONENTES
INSERT INTO Componente (tipo, unidadeMedida, funcaoMonitorada) VALUES
('CPU', '%', 'CPU_porcentagem'),
('Memória', '%', 'RAM_percentual'),
('Disco', '%', 'DISK_percentual');

-- Inserir parâmetros
INSERT INTO Parametro (fkComponente, fkAtm, limite) VALUES
(1, 1, '80'),  -- CPU do ATM-1 com limite de 80%
(2, 1, '85'),  -- Memória do ATM-1 com limite de 85%
(3, 1, '90'),  -- Disco do ATM-1 com limite de 90%
(1, 2, '75');  -- CPU do ATM-2 com limite de 75%

-- Inserir alguns registros
INSERT INTO Registro (fkParametro, valor, horario) VALUES
(1, 45.2, NOW() - INTERVAL 1 HOUR),
(1, 82.5, NOW() - INTERVAL 30 MINUTE),
(2, 70.1, NOW() - INTERVAL 45 MINUTE);

-- Inserir alertas (se necessário)
INSERT INTO Alerta (fkParametro, descricao, tipoAlerta, nivel, dataHoraInicio, dataHoraFinal, valor) VALUES
(1, 'Uso de CPU acima do limite', 'Alta utilização', 'Crítico', NOW() - INTERVAL 25 MINUTE, NULL, 10.00);

