ALTER TABLE dw_stackoverflow DROP CONSTRAINT IF EXISTS FK_ubicacion;
DROP TABLE IF EXISTS ubicacion
GO

-- UNIFICACI�N DE PAISES IGUALES CON DIFERENTE NOMBRE
UPDATE dw_stackoverflow SET pais = 'Ireland' WHERE pais = 'Ireland {Republic}'
UPDATE dw_stackoverflow SET pais = 'Macedonia' WHERE pais = 'Macedonia [FYROM]'
UPDATE dw_stackoverflow SET pais = 'United States' WHERE pais = 'United States of America'
UPDATE dw_stackoverflow SET pais = 'Bosnia Herzegovina' WHERE pais = 'Bosnia and Herzegovina'
UPDATE dw_stackoverflow SET pais = 'Myanmar [Burma]' WHERE pais = 'Myanmar, {Burma}'
UPDATE dw_stackoverflow SET pais = 'Russia' WHERE pais = 'Russian Federation'
UPDATE dw_stackoverflow SET pais = 'Korea South' WHERE pais = 'South Korea'

-- CREACI�N TABLA UBICACI�N
CREATE TABLE [dbo].[ubicacion](
	[id_ubicacion] [int] IDENTITY(1,1) NOT NULL,
	[pais] [nvarchar] (MAX) NOT NULL,
	 CONSTRAINT [PK_ubicacion] PRIMARY KEY CLUSTERED 
	(
		[id_ubicacion] ASC
	)
)

-- NORMALIZACI�N UBICACI�N
INSERT INTO ubicacion
SELECT DISTINCT pais
FROM dw_stackoverflow
WHERE pais IS NOT NULL

-- ACTUALIZACI�N DE LA LLAVE FOR�NEA
UPDATE s
SET s.fk_ubicacion = u.id_ubicacion
--SELECT *
FROM dw_stackoverflow s
INNER JOIN ubicacion u ON u.pais = s.pais

-- CONFIGURACI�N LLAVE FOR�NEA
ALTER TABLE dw_stackoverflow 
ADD CONSTRAINT FK_ubicacion
FOREIGN KEY (fk_ubicacion) REFERENCES ubicacion(id_ubicacion)

-- ELIMINACI�N COLUMNA PAIS
ALTER TABLE dw_stackoverflow
DROP COLUMN IF EXISTS pais