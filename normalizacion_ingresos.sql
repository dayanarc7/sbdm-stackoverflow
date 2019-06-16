ALTER TABLE dw_stackoverflow DROP CONSTRAINT IF EXISTS FK_ingresos
DROP TABLE IF EXISTS ingresos

-- CREACI�N TABLA INGRESOS
CREATE TABLE [dbo].[ingresos](
	[id_ingresos] [int] IDENTITY(1,1) NOT NULL,
	[ingresos] [nvarchar] (MAX) NOT NULL,
	 CONSTRAINT [PK_ingresos] PRIMARY KEY CLUSTERED 
	(
		[id_ingresos] ASC
	)
)

-- NORMALIZACI�N INGRESOS
INSERT INTO ingresos
SELECT DISTINCT ingresos
FROM dw_stackoverflow
WHERE ingresos IS NOT NULL

-- ACTUALIZACI�N DE LA LLAVE FOR�NEA
UPDATE s
SET s.fk_ingresos = i.id_ingresos
--SELECT *
FROM dw_stackoverflow s
INNER JOIN ingresos i ON i.ingresos = s.ingresos

-- CONFIGURACI�N LLAVE FOR�NEA
ALTER TABLE dw_stackoverflow 
ADD CONSTRAINT FK_ingresos
FOREIGN KEY (fk_ingresos) REFERENCES ingresos(id_ingresos)

-- ELIMINACI�N COLUMNA INGRESOS
ALTER TABLE dw_stackoverflow
DROP COLUMN IF EXISTS ingresos