(
SELECT Avos.Nome AS nome1, Neto.nome AS nome2
FROM (AvouDe INNER JOIN Pessoas as Avos ON AvouDe.Avo = Avos.id
INNER JOIN Pessoas AS Neto ON AvouDe.neto = Neto.id)
)
    UNION   
(
SELECT Avos.Nome AS nome1, Neto.Nome AS nome2
FROM (AvohDe INNER JOIN Pessoas as Avos ON AvohDe.avo = Avos.id
INNER JOIN Pessoas AS Neto ON AvohDe.neto = Neto.id)
)     


ORDER BY nome1 ASC, nome2 ASC;