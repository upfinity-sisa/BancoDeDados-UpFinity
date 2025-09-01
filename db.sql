create database upfinity;
use upfinity;
-- Tabela ATM tabelas teste
CREATE TABLE Atm (
    idAtm INT PRIMARY KEY AUTO_INCREMENT,
    hostname VARCHAR(45),
    modelo VARCHAR(45),
    ip VARCHAR(45),
    macAddress VARCHAR(45),
    sistemaOperacional VARCHAR(45),
    statusAtm VARCHAR(45)
);

-- Tabela Componente
CREATE TABLE Componente (
    idComponente INT PRIMARY KEY AUTO_INCREMENT,
    tipo VARCHAR(45),
    unidadeMedida VARCHAR(45),
    funcaoMonitorada VARCHAR(100)
);

-- Tabela Parametro
CREATE TABLE Parametro (
    idParametro INT PRIMARY KEY AUTO_INCREMENT,
    fkComponente INT,
    fkAtm INT,
    limite VARCHAR(45),
    FOREIGN KEY (fkComponente) REFERENCES Componente(idComponente),
    FOREIGN KEY (fkAtm) REFERENCES Atm(idAtm)
);

-- Tabela Alerta
CREATE TABLE Alerta (
    idAlerta INT PRIMARY KEY AUTO_INCREMENT,
    fkParametro INT,
    descricao VARCHAR(45),
    tipoAlerta VARCHAR(45),
    nivel VARCHAR(45),
    dataHoraInicio DATETIME,
    dataHoraFinal DATETIME,
    FOREIGN KEY (fkParametro) REFERENCES Parametro(idParametro)
);

-- Tabela Registro
CREATE TABLE Registro (
    idRegistro INT PRIMARY KEY AUTO_INCREMENT,
    fkParametro INT,
    valor FLOAT,
    horario DATETIME,
    FOREIGN KEY (fkParametro) REFERENCES Parametro(idParametro)
);


-- Inserir alguns ATMs
INSERT INTO Atm (hostname, modelo, ip, macAddress, sistemaOperacional, statusAtm) VALUES
('ATM-001', 'Modelo-X', '192.168.1.100', '00:1A:2B:3C:4D:5E', 'Windows', 'Ativo'),
('ATM-002', 'Modelo-Y', '192.168.1.101', '00:1B:2C:3D:4E:5F', 'Linux', 'Ativo');

select * from Registro;

-- Inserir componentes
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
INSERT INTO Alerta (fkParametro, descricao, tipoAlerta, nivel, dataHoraInicio, dataHoraFinal) VALUES
(1, 'Uso de CPU acima do limite', 'Alta utilização', 'Crítico', NOW() - INTERVAL 25 MINUTE, NULL);

select * from Registro;
select * from Alerta;
select * from Atm;
select * from Parametro;
truncate Alerta;
        SELECT idAlerta, nivel
        FROM Alerta
        WHERE fkParametro = 3 AND tipoAlerta = 'DISK_percentual' AND dataHoraFinal IS NULL
        ORDER BY dataHoraInicio DESC
        LIMIT 1;
        
-- SELECT PARA MOSTRAR O TEMPO TOTAL EM CADA TIPO DE ALERTA HOJE - TIMESTAMPDIFF()

Select a.hostname as HOSTNAME, a.modelo AS MODELO, a.ip AS IP, 
	concat(p.limite, '', c.unidadeMedida) AS LIMITE, 
		al.tipoAlerta AS 'TIPO DO ALERTA', al.nivel AS 'NIVEL DO ALERTA', al.dataHoraInicio 'HORARIO INICIAL ', 
			ifnull(dataHoraFinal, 'Alerta em andamento') AS 'HORARIO FINAL', 
				concat(timestampdiff(second, al.dataHoraInicio, al.dataHoraFinal), ' s') AS 'TEMPO TOTAL EM ALERTA'
	From Atm as a 
		join Parametro as p 
			on a.idAtm = p.fkAtm 
		join Alerta as al
			on p.idParametro = al.fkParametro
		join Componente as c 
			on p.fkComponente = c.idComponente;
					
		
        

