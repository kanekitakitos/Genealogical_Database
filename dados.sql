INSERT INTO Pessoas VALUES -- id/INTEGER  nome/STRING sexo/CHAR dataNasc/DATA
    (100,'Kelly Mejia', 'f','1982-01-07'),-- mama
    (101,'Antonio Correia', 'm','1982-03-04'),-- papa
    (102,'Brandon Mejia', 'm','2003-06-04'),-- yo
    (103,'Antonio Mejia', 'm','2003-06-04'),-- hermano de padres iguales
    (104,'Maria Da Silva', 'f','1951-01-03'),-- abuela por parte de papa
    (105,'Manuel Jorgue Correia', 'm','1940-09-20'),-- abuelo por parte de papa
    (106,'Luz Gomez', 'f','1960-03-04'),-- abuela por parte de mama
    (107,'Pedro Mejia', 'm','1960-03-04'),-- abuelo por parte de mama
    (108, 'Maria de Lourdes','f','1967-03-04'),-- tia por parte de papa
    (112, 'Jorgue Correia','m','1968-03-25'), -- tio por parte de papa
    (113, 'Quininha Correia','f','1965-10-19'),-- tia por parte de papa
    (109,'Maria Freitas', 'f','1995-08-04'),-- prima
    (110,'Enrique Correia', 'm','1969-08-21'),-- primo
    (114,'Manuel Correia', 'm','2008-07-25'),-- medio hermano de brandon y antonio
    (115,'Karla Thor', 'f','1968-08-13'),-- madre de manuel exEsposa de mi papa
    (111,'Enrique Correia Camacho', 'm','1989-05-03'); -- primo


INSERT INTO MaeDe VALUES -- maeDe/INTEGER  filhoDe/INTEGER
    (100,102),
    (100,103),
    (115,114),
    (104,101),
    (106,100),
    (108,109),
    (104,112),
    (104,110),
    (104,108),
    (104,113);

INSERT INTO PaiDe VALUES -- paiDe/INTEGER  filhoDe/INTEGER
    (101,102),
    (101,103),
    (101,114),
    (105,101),
    (107,100),
    (105,108),
    (105,113),
    (105,110),
    (105,112),
    (110,111);