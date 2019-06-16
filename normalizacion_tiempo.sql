-- CREACI�N TABLA TIEMPO
DROP TABLE IF EXISTS tiempo

CREATE TABLE [dbo].[tiempo](
	[id_tiempo] [int] IDENTITY(1,1) NOT NULL,
	[a�o] [int] NOT NULL,
	 CONSTRAINT [PK_tiempo] PRIMARY KEY CLUSTERED 
	(
		[id_tiempo] ASC
	),
	 CONSTRAINT [IX_tiempo] UNIQUE NONCLUSTERED 
	(
		[a�o] ASC
	)
)

-- NORMALIZACI�N TIEMPO
INSERT INTO tiempo
SELECT DISTINCT tiempo
FROM dw_stackoverflow

-- ACTUALIZACI�N DE LA LLAVE FOR�NEA
UPDATE s
SET s.tiempo = t.id_tiempo
--SELECT *
FROM dw_stackoverflow s
INNER JOIN tiempo t ON t.a�o = s.tiempo

-- CONFIGURACI�N LLAVE FOR�NEA
ALTER TABLE dw_stackoverflow 
ADD FOREIGN KEY (tiempo) REFERENCES tiempo(id_tiempo)