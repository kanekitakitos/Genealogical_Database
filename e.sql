SELECT N1.nome as nome1, N2.nome as nome2
FROM pessoas as N1, pessoas N2
where EXISTS
    (
        SELECT * 
        FROM maede as M1, maede as M2
        where EXISTS
                (
                SELECT * 
                FROM paide as P1, paide as P2
                where 
                      ((M1.mae != M2.mae AND P1.pai = P2.pai) 
                        OR
                      (M1.mae = M2.mae AND P1.pai != P2.pai) )

                      AND M1.filho = N1.id AND M2.filho = N2.id
                      AND P1.filho = N1.id AND P2.filho = N2.id
                      AND N1.id < N2.id

                )
    )
    ORDER BY nome1 ;
