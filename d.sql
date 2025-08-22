SELECT ps1.nome as nome1 , ps2.nome as nome2
FROM Pessoas as ps1, Pessoas as ps2
WHERE EXISTS (
                SELECT * 
                FROM MaeDe as m1, MaeDe as m2, PaiDe as p1, PaiDe as p2
                       WHERE (
                                m1.mae = m2.mae
                                AND p1.pai = p2.pai
                                And m1.filho = ps1.id
                                AND m2.filho = ps2.id
                                AND p1.filho = ps1.id
                                AND p2.filho = ps2.id
                                AND ps1.id < ps2.id
                            )
            )
ORDER BY nome1 ASC;