ALTER TABLE dw_stackoverflow DROP CONSTRAINT IF EXISTS FK_ingresos
DROP TABLE IF EXISTS ingresos
GO

-- CREACIÓN TABLA INGRESOS
CREATE TABLE [dbo].[ingresos](
	[id_ingresos] [int] IDENTITY(1,1) NOT NULL,
	[ingresos] [nvarchar] (MAX) NOT NULL,
	[order] [int] NOT NULL,
	 CONSTRAINT [PK_ingresos] PRIMARY KEY CLUSTERED 
	(
		[id_ingresos] ASC
	)
)

-- NORMALIZACIÓN INGRESOS
INSERT INTO ingresos
SELECT DISTINCT ingresos, CASE ingresos WHEN '<$20,000' THEN 1 WHEN '$20,000 - $40,000' THEN 2 WHEN '$40,000 - $60,000' THEN 3 WHEN '$60,000 - $80,000' THEN 4
										WHEN '$80,000 - $100,000' THEN 5 WHEN '$100,000 - $120,000' THEN 6 WHEN '$120,000 - $140,000' THEN 7 WHEN '>$140,000' THEN 8 END orden
FROM dw_stackoverflow
WHERE ingresos IS NOT NULL
ORDER BY orden

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