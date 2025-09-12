drop view vw_historico_alertas;
CREATE VIEW vw_historico AS
SELECT
    COALESCE(a_atm.hostname, a_comp_atm.hostname) AS nomeAtm,
    CASE
        WHEN al.fkAtm IS NOT NULL THEN 'ATM'
        ELSE 'Componente'
    END AS origemAlerta,
    CASE
        WHEN al.fkAtmComponente IS NOT NULL THEN c.tipo 
        ELSE 'Geral'
    END AS tipoAlertaDetalhado,
    al.nivel,
    al.tipoAlerta,
    ifnull(concat(al.valorInicial, c.unidadeMedida), 'off-line') as valorInicial, 
	ifnull(concat(al.valorFinal, c.unidadeMedida ), 'off-line')as valorFinal,
	DATE_FORMAT(al.dataHoraInicio, '%d/%m/%Y %H:%i:%s') AS dataHoraInicio,
    ifnull( DATE_FORMAT(al.dataHoraFinal, '%d/%m/%Y %H:%i:%s'), 'Em andamento') as dataHoraFinal, 
	CASE
		WHEN al.dataHoraFinal IS NOT NULL THEN CONCAT(TIMESTAMPDIFF(MINUTE, al.dataHoraInicio, al.dataHoraFinal), ' min')
		ELSE 'Em Andamento'
	END AS duracaoAlertaMinutos
FROM Alerta AS al
LEFT JOIN Atm AS a_atm ON al.fkAtm = a_atm.idAtm
LEFT JOIN AtmComponente AS ac ON al.fkAtmComponente = ac.idAtmComponente
LEFT JOIN Atm AS a_comp_atm ON ac.fkAtm = a_comp_atm.idAtm
LEFT JOIN Componente AS c ON ac.fkComponente = c.idComponente;
