DROP VIEW IF EXISTS avo_e_N_Netos;
    
CREATE VIEW avo_e_N_Netos as 
SELECT Pessoas.nome as nome_avo, COUNT(TodosOsNetos.neto) as N_netos
FROM Pessoas
JOIN    (
        SELECT avo, neto
        FROM AvouDe

        UNION

        SELECT avo, neto
        FROM AvohDe
    )  AS TodosOsNetos ON Pessoas.id = TodosOsNetos.avo
GROUP BY Pessoas.nome;



SELECT nome_avo as nome
FROM avo_e_N_Netos
WHERE N_netos = 
    (
        SELECT MAX(N_netos)
        FROM avo_e_N_Netos
    );