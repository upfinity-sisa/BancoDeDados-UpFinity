use upfinity;

insert into Seguranca values
(1, 'arquivo', 0, now(), 1),
(2, 'conexao', 0, now(), 1),
(3, 'invasao', null, now(), 1);

#semana 1
insert into AlertaSeguranca values
(1, 'arquivo', 'O hash do arquivo /bin/netstats foi alterado', '2025-11-20 00:00:00'),
(2, 'arquivo', 'O hash do arquivo /bin/netstats foi alterado', '2025-11-20 00:00:05');

insert into ArquivoCritico (horario, possuiAlerta, fkSeguranca, fkAlertaSeguranca) values
('2025-11-20 00:00:00', 1, 1, 1),
('2025-11-20 00:00:05', 1, 1, 2);

#semana2
insert into AlertaSeguranca values
(3, 'arquivo', 'O hash do arquivo /bin/netstats foi alterado', '2025-11-13 00:00:00'),
(4, 'arquivo', 'O hash do arquivo /bin/netstats foi alterado', '2025-11-13 00:00:05'),
(5, 'arquivo', 'O hash do arquivo /bin/netstats foi alterado', '2025-11-13 00:00:10');

insert into ArquivoCritico (horario, possuiAlerta, fkSeguranca, fkAlertaSeguranca) values
('2025-11-13 00:00:00', 1, 1, 3),
('2025-11-13 00:00:05', 1, 1, 4),
('2025-11-13 00:00:10', 1, 1, 5);

#semana3
insert into AlertaSeguranca values
(6, 'arquivo', 'O hash do arquivo /bin/netstats foi alterado', '2025-11-06 00:00:00'),
(7, 'arquivo', 'O hash do arquivo /bin/netstats foi alterado', '2025-11-06 00:00:05'),
(8, 'arquivo', 'O hash do arquivo /bin/netstats foi alterado', '2025-11-06 00:00:10'),
(9, 'arquivo', 'O hash do arquivo /bin/netstats foi alterado', '2025-11-06 00:00:15'),
(10, 'arquivo', 'O hash do arquivo /bin/netstats foi alterado', '2025-11-06 00:00:10'),
(11, 'arquivo', 'O hash do arquivo /bin/netstats foi alterado', '2025-11-06 00:00:15');

insert into ArquivoCritico (horario, possuiAlerta, fkSeguranca, fkAlertaSeguranca) values
('2025-11-06 00:00:00', 1, 1, 6),
('2025-11-06 00:00:05', 1, 1, 7),
('2025-11-06 00:00:10', 1, 1, 8),
('2025-11-06 00:00:15', 1, 1, 9),
('2025-11-06 00:00:10', 1, 1, 10),
('2025-11-06 00:00:15', 1, 1, 11);

#semana4
insert into AlertaSeguranca values
(12, 'arquivo', 'O hash do arquivo /bin/netstats foi alterado', '2025-10-30 00:00:00'),
(13, 'arquivo', 'O hash do arquivo /bin/netstats foi alterado', '2025-10-30 00:00:00'),
(14, 'arquivo', 'O hash do arquivo /bin/netstats foi alterado', '2025-10-30 00:00:05'),
(15, 'arquivo', 'O hash do arquivo /bin/netstats foi alterado', '2025-10-30 00:00:10'),
(16, 'arquivo', 'O hash do arquivo /bin/netstats foi alterado', '2025-10-30 00:00:15');

insert into ArquivoCritico (horario, possuiAlerta, fkSeguranca, fkAlertaSeguranca) values
('2025-10-30 00:00:00', 1, 1, 12),
('2025-10-30 00:00:00', 1, 1, 13),
('2025-10-30 00:00:05', 1, 1, 14),
('2025-10-30 00:00:10', 1, 1, 15),
('2025-10-30 00:00:15', 1, 1, 16);

#semana5
insert into AlertaSeguranca values
(17, 'arquivo', 'O hash do arquivo /bin/netstats foi alterado', '2025-10-23 00:00:00'),
(18, 'arquivo', 'O hash do arquivo /bin/netstats foi alterado', '2025-10-23 00:00:05'),
(19, 'arquivo', 'O hash do arquivo /bin/netstats foi alterado', '2025-10-23 00:00:10'),
(20, 'arquivo', 'O hash do arquivo /bin/netstats foi alterado', '2025-10-23 00:00:15');

insert into ArquivoCritico (horario, possuiAlerta, fkSeguranca, fkAlertaSeguranca) values
('2025-10-23 00:00:00', 1, 1, 17),
('2025-10-23 00:00:05', 1, 1, 18),
('2025-10-23 00:00:10', 1, 1, 19),
('2025-10-23 00:00:15', 1, 1, 20);


#semana6
insert into AlertaSeguranca values
(21, 'arquivo', 'O hash do arquivo /bin/netstats foi alterado', '2025-10-16 00:00:00'),
(22, 'arquivo', 'O hash do arquivo /bin/netstats foi alterado', '2025-10-16 00:00:05'),
(23, 'arquivo', 'O hash do arquivo /bin/netstats foi alterado', '2025-10-16 00:00:10'),
(24, 'arquivo', 'O hash do arquivo /bin/netstats foi alterado', '2025-10-16 00:00:15');

insert into ArquivoCritico (horario, possuiAlerta, fkSeguranca, fkAlertaSeguranca) values
('2025-10-16 00:00:00', 1, 1, 21),
('2025-10-16 00:00:05', 1, 1, 22),
('2025-10-16 00:00:10', 1, 1, 23),
('2025-10-16 00:00:15', 1, 1, 24);

#semana7
insert into AlertaSeguranca values
(25, 'arquivo', 'O hash do arquivo /bin/netstats foi alterado', '2025-10-09 00:00:00'),
(26, 'arquivo', 'O hash do arquivo /bin/netstats foi alterado', '2025-10-09 00:00:05'),
(27, 'arquivo', 'O hash do arquivo /bin/netstats foi alterado', '2025-10-09 00:00:10');

insert into ArquivoCritico (horario, possuiAlerta, fkSeguranca, fkAlertaSeguranca) values
('2025-10-09 00:00:00', 1, 1, 25),
('2025-10-09 00:00:05', 1, 1, 26),
('2025-10-09 00:00:10', 1, 1, 27);

#semana8
insert into AlertaSeguranca values
(28, 'arquivo', 'O hash do arquivo /bin/netstats foi alterado', '2025-10-02 00:00:00'),
(29, 'arquivo', 'O hash do arquivo /bin/netstats foi alterado', '2025-10-02 00:00:05');

insert into ArquivoCritico (horario, possuiAlerta, fkSeguranca, fkAlertaSeguranca) values
('2025-10-02 00:00:00', 1, 1, 28),
('2025-10-02 00:00:05', 1, 1, 29);