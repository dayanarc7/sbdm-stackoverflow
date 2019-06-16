ALTER TABLE dw_stackoverflow DROP CONSTRAINT IF EXISTS FK_ingresos
DROP TABLE IF EXISTS ingresos

-- CREACIÓN TABLA INGRESOS
CREATE TABLE [dbo].[ingresos](
	[id_ingresos] [int] IDENTITY(1,1) NOT NULL,
	[ingresos] [nvarchar] (MAX) NOT NULL,
	 CONSTRAINT [PK_ingresos] PRIMARY KEY CLUSTERED 
	(
		[id_ingresos] ASC
	)
)

-- NORMALIZACIÓN INGRESOS
INSERT INTO ingresos
SELECT DISTINCT ingresos
FROM dw_stackoverflow
WHERE ingresos IS NOT NULL

-- ACTUALIZACIÓN DE LA LLAVE FORÁNEA
UPDATE s
SET s.fk_ingresos = i.id_ingresos
--SELECT *
FROM dw_stackoverflow s
INNER JOIN ingresos i ON i.ingresos = s.ingresos

-- CONFIGURACIÓN LLAVE FORÁNEA
ALTER TABLE dw_stackoverflow 
ADD CONSTRAINT FK_ingresos
FOREIGN KEY (fk_ingresos) REFERENCES ingresos(id_ingresos)

-- ELIMINACIÓN COLUMNA INGRESOS
ALTER TABLE dw_stackoverflow
DROP COLUMN IF EXISTS ingresos