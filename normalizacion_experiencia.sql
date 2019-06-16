ALTER TABLE dw_stackoverflow DROP CONSTRAINT IF EXISTS FK_experiencia
DROP TABLE IF EXISTS experiencia
GO

-- CREACIÓN TABLA EXPERIENCIA
CREATE TABLE [dbo].[experiencia](
	[id_experiencia] [int] IDENTITY(1,1) NOT NULL,
	[rango] [NVARCHAR] (max) NOT NULL,
	 CONSTRAINT [PK_experiencia] PRIMARY KEY CLUSTERED 
	(
		[id_experiencia] ASC
	)
)

-- NORMALIZACIÓN EXPERIENCIA
INSERT INTO experiencia
SELECT DISTINCT experiencia
FROM dw_stackoverflow
WHERE experiencia IS NOT NULL

-- ACTUALIZACIÓN DE LA LLAVE FORÁNEA
UPDATE s
SET s.fk_experiencia = e.id_experiencia
--SELECT *
FROM dw_stackoverflow s
INNER JOIN experiencia e ON e.rango = s.experiencia

-- CONFIGURACIÓN LLAVE FORÁNEA
ALTER TABLE dw_stackoverflow 
ADD CONSTRAINT FK_experiencia
FOREIGN KEY (fk_experiencia) REFERENCES experiencia(id_experiencia)

-- ELIMINACIÓN COLUMNA EXPERIENCIA
ALTER TABLE dw_stackoverflow
DROP COLUMN IF EXISTS experiencia
