USE [stackoverflow]
GO

-- CREANDO LA TABLA CON LOS CAMPOS DE TODAS LAS COLUMNAS
DROP TABLE IF EXISTS clean2012
SELECT [column1] pais
      ,[column2] estado
      ,[column3] edad
	  ,[column4] experiencia
      ,[column5] sector
      ,[column6] tamaño_empresa
      ,[column7] ocupacion
      ,[column8] rol_influencer		
      ,[column9] rol_recommender
      ,[column10] rol_approver
      ,[column11] rol_purchaser
      ,[column12] rol_check_writer
      ,[column13] rol_no_invoment
      ,[column14] rol_seller
      ,[column15] comprador_hardware
      ,[column16] comprador_servers
      ,[column17] comprador_sowtware
      ,[column18] comprador_monitors_pcs_laptops
      ,[column19] comprador_consultants
      ,[column20] comprador_other
      ,[column21] presupuesto
      ,[column22] tipo_proyecto
      ,[column23] lenguaje_java
      ,[column24] lenguaje_javascript
      ,[column25] lenguaje_css
      ,[column26] lenguaje_php
      ,[column27] lenguaje_python
      ,[column28] lenguaje_objetivec
      ,[column29] lenguaje_ruby
      ,[column30] lenguaje_sql
      ,[column31] lenguaje_c#
      ,[column32] [lenguaje_c++]
      ,[column33] lenguaje_c
      ,[column34] lenguaje_perl
      ,[column35] lenguaje_html5 
      ,[column36] lenguaje_none
      ,[column37] lenguaje_other
      ,[column38] sistema_operativo
      ,[column39] satisfaccion
      ,[column40] ingresos
      ,[column41] conoce_stack_careers
      ,[column42] tieneperfil_stack_careers
      ,[column43] porque_notieneperfil_stack_careers
      ,[column44] respuesta_stack_careers_other
      ,[column45] producto_iphone
      ,[column46] producto_android
      ,[column47] producto_blackberry
      ,[column48] producto_windowsphone
      ,[column49] producto_other_smart_phone
      ,[column50] producto_regular
      ,[column51] producto_kindle
      ,[column52] producto_nook
      ,[column53] producto_appletv
      ,[column54] producto_boxee
      ,[column55] producto_streaming_device
      ,[column56] producto_netbook
      ,[column57] producto_ps3
      ,[column58] producto_xbox
      ,[column59] producto_wii
      ,[column60] producto_other_gaming
      ,[column61] producto_kindlefire
      ,[column62] producto_ipad
      ,[column63] producto_othertablet
      ,[column64] producto_other
      ,[column65] gasto_anual_tecnologia
      ,[column66] anuncios_relevantes 
      ,[column67] anuncios_entrenidos
      ,[column68] anuncios_informativos
	  ,[column69] anuncios_interesantes
      ,[column70] anuncios
      ,[column71] usa_bloqueador_anuncios
      ,[column72] anunciantes_stack
      ,[column73] reputacion_stack
      ,[column74] sitios_frecuentados
      ,[column75] sitios_frecuentados_otros
	  ,2012 año INTO clean2012
  FROM [dbo].[s2012]

  -- CREANDO LA TABLA CON LOS CAMPOS COMUNES
  DROP TABLE IF EXISTS m2012
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
  	  ,año INTO m2012
  FROM clean2012

  -- ELIMINANDO LOS DOS PRIMEROS REGISTROS

  -- MODIFICANDO EL CAMPO EXPERIENCIA

  UPDATE m2012 SET experiencia = REPLACE (experiencia, '40944', '2-5')
  UPDATE m2012 SET experiencia = REPLACE (experiencia, '41070', '6-10')


  -- MODIFICANDO EL CAMPO LENGUAJE
  
  UPDATE m2012 SET lenguaje_java = CASE WHEN lenguaje_java IS NULL THEN 0 ELSE 1 END
  UPDATE m2012 SET lenguaje_javascript = CASE WHEN lenguaje_javascript IS NULL THEN 0 ELSE 1 END
  UPDATE m2012 SET lenguaje_php = CASE WHEN lenguaje_php IS NULL THEN 0 ELSE 1 END
  UPDATE m2012 SET lenguaje_python = CASE WHEN lenguaje_python IS NULL THEN 0 ELSE 1 END
  UPDATE m2012 SET lenguaje_ruby = CASE WHEN lenguaje_ruby IS NULL THEN 0 ELSE 1 END
  UPDATE m2012 SET lenguaje_sql = CASE WHEN lenguaje_sql IS NULL THEN 0 ELSE 1 END
  UPDATE m2012 SET lenguaje_c# = CASE WHEN lenguaje_c# IS NULL THEN 0 ELSE 1 END
  UPDATE m2012 SET [lenguaje_c++] = CASE WHEN [lenguaje_c++] IS NULL THEN 0 ELSE 1 END

  
-- -- MODIFICANDO EL CAMPO OCUPACION

ALTER TABLE m2012 ADD [ocupacion_Desktop] [int] NULL
ALTER TABLE m2012 ADD [ocupacion_Staff] [int] NULL
ALTER TABLE m2012 ADD [ocupacion_Database] [int] NULL
ALTER TABLE m2012 ADD [ocupacion_Embedded] [int] NULL
ALTER TABLE m2012 ADD [ocupacion_Web] [int] NULL

--Cursor para desagregar lenguajes
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
		UPDATE m2012
		SET [ocupacion_' + @ocupacion + '] = CASE WHEN ocupacion LIKE ''%' + @ocupacion + '%'' THEN 1 ELSE 0 END, 
		  ocupacion = REPLACE(ocupacion,''' + @ocupacion + ''','''')
	')

	FETCH NEXT FROM cursor_ocupacion INTO @order, @ocupacion
END 

CLOSE cursor_ocupacion
DEALLOCATE cursor_ocupacion

ALTER TABLE m2012 DROP COLUMN ocupacion

 -- MODIFICANDO EL CAMPO INGRESOS
 UPDATE m2012 SET ingresos = NULL WHERE ingresos = 'Student / Unemployed'
 UPDATE m2012 SET ingresos = NULL WHERE ingresos = 'Rather not say'

 --ELIMINANDO LAS PRIMERAS DOS FILAS

DELETE FROM m2012 WHERE pais = 'What Country or Region do you live in?' OR pais = 'Response'

