ALTER TABLE dw_stackoverflow DROP CONSTRAINT IF EXISTS FK_experiencia
DROP TABLE IF EXISTS experiencia
GO

-- CREACI�N TABLA EXPERIENCIA
CREATE TABLE [dbo].[experiencia](
	[id_experiencia] [int] IDENTITY(1,1) NOT NULL,
	[rango] [NVARCHAR] (max) NOT NULL,
	 CONSTRAINT [PK_experiencia] PRIMARY KEY CLUSTERED 
	(
		[id_experiencia] ASC
	)
)

-- NORMALIZACI�N EXPERIENCIA
INSERT INTO experiencia
SELECT DISTINCT experiencia
FROM dw_stackoverflow
WHERE experiencia IS NOT NULL

-- ACTUALIZACI�N DE LA LLAVE FOR�NEA
UPDATE s
SET s.fk_experiencia = e.id_experiencia
--SELECT *
FROM dw_stackoverflow s
INNER JOIN experiencia e ON e.rango = s.experiencia

-- CONFIGURACI�N LLAVE FOR�NEA
ALTER TABLE dw_stackoverflow 
ADD CONSTRAINT FK_experiencia
FOREIGN KEY (fk_experiencia) REFERENCES experiencia(id_experiencia)

-- ELIMINACI�N COLUMNA EXPERIENCIA
ALTER TABLE dw_stackoverflow
DROP COLUMN IF EXISTS experiencia
