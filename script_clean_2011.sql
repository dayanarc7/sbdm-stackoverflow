USE [stackoverflow]
GO

-- CREANDO LA TABLA CON LOS CAMPOS DE TODAS LAS COLUMNAS

DROP TABLE IF EXISTS clean2011
SELECT [column1] pais
      ,[column2] estado
      ,[column3] edad
	  ,[column4] experiencia
      ,[column5] sector
      ,[column6] tamaño_empresa
      ,[column7] ocupacion
      ,[column9] rol_influencer
      ,[column10] rol_recommender
      ,[column11] rol_approver
      ,[column12] rol_purchaser
      ,[column13] rol_check_writer
      ,[column14] rol_no_involvement
      ,[column15] rol_seller
      ,[column16] comprador_hardware
      ,[column17] comprador_servers
      ,[column18] comprador_sowtware
      ,[column19] comprador_monitors_pcs_laptops
      ,[column20] comprador_consultants
      ,[column21] comprador_other
      ,[column22] presupuesto_menor_10000
      ,[column23] presupuesto_10001_25000
      ,[column24] presupuesto_25001_40000
      ,[column25] presupuesto_41000_75000
      ,[column26] presupuesto_75001_100000
      ,[column27] presupuesto_100001_150000
      ,[column28] presupuesto_mayor_150000
      ,[column29] pesupuesto_dont_know
      ,[column30] tipo_proyecto
      ,[column31] lenguaje_java
      ,[column32] lenguaje_javascript
      ,[column33] lenguaje_css
      ,[column34] lenguaje_php
      ,[column35] lenguaje_python
      ,[column36] lenguaje_ruby
      ,[column37] lenguaje_sql
      ,[column38] lenguaje_c#
      ,[column39] [lenguaje_c++]
      ,[column40] lenguaje_c
      ,[column41] lenguaje_perl
      ,[column42] lenguaje_none
      ,[column43] lenguaje_other
      ,[column44] sistema_operativo
      ,[column45] satisfaccion
      ,[column46] ingresos
      ,[column47] producto_iphone
      ,[column48] producto_android
      ,[column49] producto_blackberry
      ,[column50] producto_other_smart_phone
      ,[column51] producto_regular
      ,[column52] producto_kindle
      ,[column53] producto_nook
      ,[column54] producto_bluray
      ,[column55] producto_hdtv
      ,[column56] producto_appletv
      ,[column57] producto_ipad
      ,[column58] producto_other_netbook
      ,[column59] prodcuto_ps3
      ,[column60] producto_xbox
      ,[column61] producto_wii
      ,[column62] producto_other_gaming
      ,[column63] producto_other
      ,[column64] gasto_anual_tecnologia
      ,[column65] sitios_frecuentados
	  , 2011 año INTO clean2011
  FROM [dbo].[s2011]

-- CREANDO LA TABLA CON LOS CAMPOS COMUNES

DROP TABLE IF EXISTS m2011
SELECT pais
	,experiencia
    ,ocupacion
    ,lenguaje_java
    ,lenguaje_javascript
    ,lenguaje_php
    ,lenguaje_python
    ,lenguaje_ruby
    ,lenguaje_sql
    ,lenguaje_c#
    ,[lenguaje_c++]
    ,ingresos
	, año INTO m2011
FROM clean2011

-- MODIFICANDO EL CAMPO EXPERIENCIA

UPDATE m2011 SET experiencia = REPLACE (experiencia, '41310', '2-5')
UPDATE m2011 SET experiencia = REPLACE (experiencia, '41435', '6-10')

-- MODIFICANDO EL CAMPO LENGUAJE

UPDATE m2011 SET lenguaje_java = CASE WHEN lenguaje_java IS NULL THEN 0 ELSE 1 END
UPDATE m2011 SET lenguaje_javascript = CASE WHEN lenguaje_javascript IS NULL THEN 0 ELSE 1 END
UPDATE m2011 SET lenguaje_php = CASE WHEN lenguaje_php IS NULL THEN 0 ELSE 1 END
UPDATE m2011 SET lenguaje_python = CASE WHEN lenguaje_python IS NULL THEN 0 ELSE 1 END
UPDATE m2011 SET lenguaje_ruby = CASE WHEN lenguaje_ruby IS NULL THEN 0 ELSE 1 END
UPDATE m2011 SET lenguaje_sql = CASE WHEN lenguaje_sql IS NULL THEN 0 ELSE 1 END
UPDATE m2011 SET lenguaje_c# = CASE WHEN lenguaje_c# IS NULL THEN 0 ELSE 1 END
UPDATE m2011 SET [lenguaje_c++] = CASE WHEN [lenguaje_c++] IS NULL THEN 0 ELSE 1 END

-- MODIFICANDO EL CAMPO OCUPACION

ALTER TABLE m2011 ADD [ocupacion_Desktop] [int] NULL
ALTER TABLE m2011 ADD [ocupacion_Staff] [int] NULL
ALTER TABLE m2011 ADD [ocupacion_Database] [int] NULL
ALTER TABLE m2011 ADD [ocupacion_Embedded] [int] NULL
ALTER TABLE m2011 ADD [ocupacion_Web] [int] NULL

DECLARE @order INT
DECLARE @ocupacion VARCHAR(50)

DECLARE cursor_ocupacion CURSOR FOR 
	SELECT 1, 'Desktop'
	UNION
	SELECT 2, 'Staff'
	UNION
	SELECT 3, 'Database'
	UNION
	SELECT 4, 'Embedded'
	UNION
	SELECT 5, 'Web'
	ORDER BY 1

OPEN cursor_ocupacion

FETCH NEXT FROM cursor_ocupacion INTO @order, @ocupacion

WHILE @@FETCH_STATUS = 0
BEGIN

	EXECUTE('
		UPDATE m2011 
		SET [ocupacion_' + @ocupacion + '] = CASE WHEN ocupacion LIKE ''%' + @ocupacion + '%'' THEN 1 ELSE 0 END, 
		  ocupacion = REPLACE(ocupacion,''' + @ocupacion + ''','''')
	')

	FETCH NEXT FROM cursor_ocupacion INTO @order, @ocupacion
END 

CLOSE cursor_ocupacion
DEALLOCATE cursor_ocupacion

ALTER TABLE m2011 DROP COLUMN ocupacion

-- MODIFICANDO EL CAMPO INGRESOS

 UPDATE m2011 SET ingresos = NULL WHERE ingresos = 'Student / Unemployed'

 --ELIMINANDO LAS PRIMERAS DOS FILAS

DELETE FROM m2011 WHERE pais = 'What Country or Region do you live in?' OR pais = 'Response'