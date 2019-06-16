-- CREACIÓN TABLA TIEMPO
DROP TABLE IF EXISTS tiempo

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
SET s.tiempo = t.id_tiempo
--SELECT *
FROM dw_stackoverflow s
INNER JOIN tiempo t ON t.año = s.tiempo

-- CONFIGURACIÓN LLAVE FORÁNEA
ALTER TABLE dw_stackoverflow 
ADD FOREIGN KEY (tiempo) REFERENCES tiempo(id_tiempo)