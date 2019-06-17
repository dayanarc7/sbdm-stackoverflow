ALTER TABLE dw_stackoverflow DROP CONSTRAINT IF EXISTS FK_tiempo
DROP TABLE IF EXISTS tiempo
GO

-- CREACIÓN TABLA TIEMPO

CREATE TABLE [dbo].[tiempo](
	[id_tiempo] [int] IDENTITY(1,1) NOT NULL,
	[año] [int] NOT NULL,
	 CONSTRAINT [PK_tiempo] PRIMARY KEY CLUSTERED 
	(
		[id_tiempo] ASC
	),
	 CONSTRAINT [IX_tiempo] UNIQUE NONCLUSTERED 
	(
		[año] ASC
	)
)

-- NORMALIZACIÓN TIEMPO
INSERT INTO tiempo
SELECT DISTINCT tiempo
FROM dw_stackoverflow

-- ACTUALIZACIÓN DE LA LLAVE FORÁNEA
UPDATE s
SET s.fk_tiempo = t.id_tiempo
--SELECT *
FROM dw_stackoverflow s
INNER JOIN tiempo t ON t.año = s.tiempo

-- CONFIGURACIÓN LLAVE FORÁNEA
ALTER TABLE dw_stackoverflow 
ADD CONSTRAINT FK_tiempo
FOREIGN KEY (fk_tiempo) REFERENCES tiempo(id_tiempo)

-- ELIMINACIÓN COLUMNA TIEMPO
ALTER TABLE dw_stackoverflow
DROP COLUMN IF EXISTS tiempo