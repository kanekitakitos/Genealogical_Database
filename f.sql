SELECT N.nome as "Pessoas que tem mais de 3 filhos"
FROM pessoas as N
WHERE EXISTS
    (
        SELECT N.id
        FROM maede as M
        where  N.id = M.mae
        HAVING COUNT(M.filho) > 3 

            UNION

        SELECT N.id
        FROM paide as P
        where  N.id = P.pai
        HAVING COUNT(P.filho) > 3 
    );
