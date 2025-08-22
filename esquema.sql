	DROP VIEW IF EXISTS avo_e_n_netos;	
	DROP VIEW IF EXISTS AvouDe;
	DROP VIEW IF EXISTS AvohDe;

	DROP TABLE IF EXISTS MaeDe;
	DROP TABLE IF EXISTS PaiDe;
	DROP TABLE IF EXISTS Pessoas;

	
	
	CREATE TABLE Pessoas(
			id           INTEGER,
			nome            VARCHAR(60),
			sexo        char CHECK (sexo IN ('f','m')),
			dataNasc         DATE,
			PRIMARY KEY (id)
		);
		
	CREATE TABLE MaeDe(
			mae           INTEGER,
			filho         INTEGER,
			PRIMARY KEY (filho),
			FOREIGN KEY (filho) REFERENCES Pessoas(id),
			FOREIGN KEY (mae) REFERENCES Pessoas(id)

		);

	CREATE TABLE PaiDe(
			pai           INTEGER,
			filho         INTEGER,
			PRIMARY KEY (filho),
			FOREIGN KEY (filho) REFERENCES Pessoas(id),
			FOREIGN KEY (pai) REFERENCES Pessoas(id)
		);



	CREATE VIEW AvouDe AS
	SELECT PaiDoPai.pai as Avo, PaiComFilho.filho as Neto 
	FROM PaiDe as PaiDoPai , PaiDe as PaiComFilho
	WHERE PaiDoPai.filho = PaiComFilho.pai
		UNION
	SELECT PaiDaMae.pai as Avo, MaeComFilho.filho as Neto 
	from PaiDe as PaiDaMae , MaeDe as MaeComFilho
	WHERE PaiDaMae.filho = MaeComFilho.mae;


	CREATE VIEW AvohDe AS
	SELECT MaeDoPai.mae as Avo, PaiComFilho.filho as Neto
	from MaeDe as MaeDoPai, PaiDe as PaiComFilho
	WHERE MaeDoPai.filho = PaiComFilho.pai
		UNION
	SELECT MaeDaMae.mae as Avo, MaeComFilho.filho as Neto
	from MaeDe as MaeDaMae, MaeDe as MaeComFilho
	WHERE MaeDaMae.filho = MaeComFilho.mae;

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


	----------------        TRIGGERS --------------------------------------------------------------------------------------------------------------------
	------------------------ PAIS REGRAS --------------------------------------------------------------------------------------------------------------------------------
	CREATE OR REPLACE FUNCTION insere_pais() RETURNS TRIGGER AS $$
	BEGIN

		IF TG_TABLE_NAME = 'PaiDe' THEN
			IF (
					SELECT 1
					FROM pessoas AS P
					WHERE NEW.pai = P.id AND P.sexo != 'm'
				) 
			THEN
				RAISE EXCEPTION 'A pessoa % nao e compativel com esta tabela', NEW.pai;
			END IF;

		ELSIF TG_TABLE_NAME = 'MaeDe' THEN
			IF (
					SELECT 1
					FROM pessoas AS P
					WHERE NEW.mae = P.id AND P.sexo != 'f'
				) 
			THEN
				RAISE EXCEPTION 'A pessoa % nao e compativel com esta tabela', NEW.mae;
			END IF;
		
		END IF;
		RETURN NEW;
	END;
	$$ LANGUAGE plpgsql;



	CREATE TRIGGER insere_paide
	BEFORE INSERT OR UPDATE
		ON Paide
	FOR EACH ROW
		EXECUTE PROCEDURE insere_pais();


	CREATE TRIGGER insere_maede
	BEFORE INSERT OR UPDATE
		ON MaeDe
	FOR EACH ROW
		EXECUTE PROCEDURE insere_pais();

	-----------------------FILHOS REGRAS------------------------------------------------------------------------------------------------------

	CREATE OR REPLACE FUNCTION insere_filho() RETURNS TRIGGER AS $$
	BEGIN
			IF (
					Select M.nome 
					FROM MaeDe AS MDF
					JOIN Pessoas AS M ON MDF.mae = M.id 
					JOIN Pessoas AS P ON MDF.filho = P.id 
					WHERE P.dataNasc < M.dataNasc
				)
			then
				RAISE EXCEPTION 'A pessoa % nao e compativel com esta tabela',
								NEW.filho;
			END IF;

			IF (
					Select M.nome 
					FROM paide AS PDF
					JOIN Pessoas AS M ON PDF.pai = M.id 
					JOIN Pessoas AS P ON PDF.filho = P.id 
					WHERE P.dataNasc < M.dataNasc
				)
			then
				RAISE EXCEPTION 'A pessoa % nao e compativel com esta tabela',
								NEW.filho;
			END IF;

	RETURN NEW;
	END;
	$$ LANGUAGE plpgsql;

	
	CREATE TRIGGER insere_filho_maeDe
		BEFORE INSERT OR UPDATE
			ON maeDe
		FOR EACH ROW
			EXECUTE PROCEDURE insere_filho();

	CREATE TRIGGER insere_filho_paiDe
		BEFORE INSERT OR UPDATE
			ON paide
		FOR EACH ROW
			EXECUTE PROCEDURE insere_filho();
