INSERT INTO TipoUsuario (descricao) VALUES
('Administrador'),
('Técnico');

INSERT INTO TipoComponente (nome, unidadeMedida, processos) VALUES
('CPU', '%', 'Uso'),
('CPU', '°C', 'Temperatura'),
('Memória RAM', 'GB', 'Uso'),
('Disco', '%', 'Uso'),
('Rede', 'MB', 'Tráfego de rede');

INSERT INTO TipoAlerta (descricao, nivel) VALUES
('Crítico', 1),
('Atenção', 2);

INSERT INTO Empresa (razaoSocial, nomeFantasia, CNPJ) VALUES
('Banco Digital Brasileiro S.A.', 'Banco DBB', '12345678000199');

INSERT INTO Endereco (logradouro, num, complemento, bairro, cidade, UF, CEP) VALUES
('Avenida Paulista', '1578', 'Andar 10', 'Bela Vista', 'São Paulo', 'SP', '01310200');

INSERT INTO Usuario (fkTipo, fkEmpresa, nome, CPF, email, senha) VALUES
(1, 1, 'Joãozinho', '11122233344', 'admin@dbb.com', 'senhaForteAdmin');

INSERT INTO Atm (fkEmpresa, fkEndereco, numeroAtm, latitude, longitude, status) VALUES
(1, 1, 100, -23.5613, -46.6565, 1);

INSERT INTO Componente (fkAtm, fkTipoComponente) VALUES
(1, 1), 
(1, 2), 
(1, 3),
(1, 4),
(1, 5);

INSERT INTO Parametro (fkTipoComponente, fkEmpresa, fkTipoAlerta, limiteMin, limiteMax) VALUES
(1, 1, 1, 10.0, 90.0),
(3, 1, 1, 0.0, 85.0);

INSERT INTO plano (fkEmpresa, tipoPlano, valorPlano) VALUES
(1, 2, 350);

INSERT INTO statusEtapas (fkEmpresa, estagioAprovacao, statusPagamento) VALUES
(1, 1, 1);
