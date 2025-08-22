DROP VIEW IF EXISTS avo_e_n_netos;
DROP VIEW IF EXISTS AvouDe;
DROP VIEW IF EXISTS AvohDe;
    
    -- Vista AvouDe: Quem é avô de quem
CREATE VIEW AvouDe AS
    SELECT A.pai as avo, N.filho as Neto 
    from paide as A, paide as N
    where A.filho = N.pai
UNION
    SELECT A.pai as avo, N.filho 
    from paide as A, maede as N
    where A.filho = N.mae;

-- Vista AvohDe: Quem é avó de quem
CREATE VIEW AvohDe AS
    SELECT A.mae as avo , N.filho as Neto
    from maede as A, maede as N
    where A.filho = N.mae
UNION
    SELECT A.mae as avo, N.filho 
    from maede as A, paide as N
    where A.filho = N.pai;


Select * from AvouDe;
Select * from AvohDe;