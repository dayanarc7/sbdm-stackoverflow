ALTER TABLE dw_stackoverflow DROP CONSTRAINT IF EXISTS FK_tiempo
DROP TABLE IF EXISTS tiempo
GO

-- CREACI�N TABLA TIEMPO

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
SET s.fk_tiempo = t.id_tiempo
--SELECT *
FROM dw_stackoverflow s
INNER JOIN tiempo t ON t.a�o = s.tiempo

-- CONFIGURACI�N LLAVE FOR�NEA
ALTER TABLE dw_stackoverflow 
ADD CONSTRAINT FK_tiempo
FOREIGN KEY (fk_tiempo) REFERENCES tiempo(id_tiempo)

-- ELIMINACI�N COLUMNA TIEMPO
ALTER TABLE dw_stackoverflow
DROP COLUMN IF EXISTS tiempo