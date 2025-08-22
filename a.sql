SELECT M.nome AS "nome da mae", P.nome AS "nome do filho"
FROM MaeDe AS MDF
JOIN Pessoas AS M ON MDF.mae = M.id     
JOIN Pessoas AS P ON MDF.filho = P.id 
ORDER BY M.nome ASC , P.nome ASC;