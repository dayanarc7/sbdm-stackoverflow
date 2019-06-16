ALTER TABLE dw_stackoverflow DROP CONSTRAINT IF EXISTS FK_ubicacion
DROP TABLE IF EXISTS ubicacion

-- CREACI�N TABLA TIEMPO

CREATE TABLE [dbo].[ubicacion](
	[id_ubicacion] [int] IDENTITY(1,1) NOT NULL,
	[pais] [int] NOT NULL,
	 CONSTRAINT [PK_ubicacion] PRIMARY KEY CLUSTERED 
	(
		[id_ubicacion] ASC
	),
	 CONSTRAINT [IX_ubicacion] UNIQUE NONCLUSTERED 
	(
		[pais] ASC
	)
)

-- NORMALIZACI�N TIEMPO
INSERT INTO ubicacion
SELECT DISTINCT pais
FROM dw_stackoverflow
ORDER BY pais

-- ACTUALIZACI�N DE LA LLAVE FOR�NEA
UPDATE s
SET s.tiempo = t.id_tiempo
--SELECT *
FROM dw_stackoverflow s
INNER JOIN tiempo t ON t.a�o = s.tiempo

-- CONFIGURACI�N LLAVE FOR�NEA
ALTER TABLE dw_stackoverflow 
ADD CONSTRAINT FK_tiempo
FOREIGN KEY (tiempo) REFERENCES tiempo(id_tiempo)



---------------------
-- VERIFICAR NOMBRE DE PAISES REPETIDOS
WITH paises AS
(
	SELECT DISTINCT pais
	FROM dw_stackoverflow
)

SELECT *
FROM (
	SELECT LEFT(pais,8) l_pais, COUNT(*) cant
	FROM paises
	GROUP BY LEFT(pais,8)
	HAVING COUNT(*) > 1
) t
INNER JOIN paises p ON t.l_pais = LEFT(p.pais,8)