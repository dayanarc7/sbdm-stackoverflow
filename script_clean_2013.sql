USE [stackoverflow]
GO

-- CREANDO LA TABLA CON LOS CAMPOS DE TODAS LAS COLUMNAS
DROP TABLE IF EXISTS clean2013

SELECT [column1] pais
      ,[column2] estado
      ,[column3] edad
	  ,[column4] experiencia
      ,[column5] sector
      ,[column6] tamaño_empresa
      ,[column7] ocupacion
      ,[column8] desarrolladores_empresa
      ,[column9] tamaño_equipo_desarrollo
      ,[column10] interactuacon_systemadministrators
      ,[column11] interactuacon_designers
      ,[column12] interactuacon_productmanagements
      ,[column13] interactuacon_testers
      ,[column14] interactuacon_technicalsupport
      ,[column15] interactuacon_marketing
      ,[column16] interactuacon_consultants
      ,[column17] interactuacon_customers
      ,[column18] interactuacon_finance
      ,[column19] interactuacon_humanrsources
      ,[column20] plataforma_mobil_iphone
      ,[column21] plataforma_mobil_ipad
      ,[column22] plataforma_mobil_androidphone
      ,[column23] plataforma_mobil_androidtablet
      ,[column24] plataforma_mobil_blackberry
      ,[column25] plataforma_mobil_other
      ,[column26] plataforma_mobil_none
      ,[column27] hacerdinero_publicidad
      ,[column28] hacerdinero_ventas_directas_cliente
      ,[column29] hacerdinero_ventas_compañías
      ,[column30] hacerdinero_servicio
      ,[column31] hacerdinero_mobile_app_sales
      ,[column32] hacerdinero_consulting
      ,[column33] hacerdinero_grants
      ,[column34] hacerdinero_other
      ,[column35] tiempo_desarrollando
      ,[column36] tiempo_refactoring
      ,[column37] tiempo_fixing
      ,[column38] tiempo_technicalsupport
      ,[column39] tiempo_meetings
      ,[column40] tiempo_learning
      ,[column41] tiempo_surfing_internet
      ,[column42] tiempo_commuting
      ,[column43] rol_recommender
      ,[column44] rol_influencer
      ,[column45] rol_approver
      ,[column46] rol_purchaser
      ,[column47] rol_check_writer
      ,[column48] rol_no_involvement
      ,[column49] rol_seller
      ,[column50] comprador_hardware
      ,[column51] comprador_servers
      ,[column52] comprador_sowtware
      ,[column53] comprador_monitors_pcs_laptops
      ,[column54] comprador_consultants
      ,[column55] comprador_other
      ,[column56] presupuesto
      ,[column57] lenguaje_c
      ,[column58] [lenguaje_c++]
      ,[column59] lenguaje_c#
      ,[column60] lenguaje_java
      ,[column61] lenguaje_javascript
      ,[column62] lenguaje_jQuery
      ,[column63] lenguaje_jotaQuery
      ,[column64] lenguaje_Nodejs
      ,[column65] lenguaje_objetivec
      ,[column66] lenguaje_php
      ,[column67] lenguaje_python
      ,[column68] lenguaje_ruby
      ,[column69] lenguaje_sql
      ,[column70] lenguaje_other
      ,[column71] tecnologia_favorita_nodejs
      ,[column72] tecnologia_favorita_haskell
      ,[column73] tecnologia_favorita_coffeescript
      ,[column74] tecnologia_favorita_dart
      ,[column75] tecnologia_favorita_typescript
      ,[column76] tecnologia_favorita_cpp11
      ,[column77] tecnologia_favorita_winrt
      ,[column78] tecnologia_favorita_redis
      ,[column79] tecnologia_favorita_mongodb
      ,[column80] tecnologia_favorita_f#
      ,[column81] tecnologia_favorita_phonegap
      ,[column82] sistema_operativo
      ,[column83] caracteristicas_empresa_trabajar_sueldo
      ,[column84] caracteristicas_empresa_trabajar_options
      ,[column85] caracteristicas_empresa_trabajar_metas
      ,[column86] caracteristicas_empresa_trabajar_productos
      ,[column87] caracteristicas_empresa_trabajar_aprender
      ,[column88] caracteristicas_empresa_trabajar_crecer
      ,[column89] caracteristicas_empresa_trabajar_espacios
      ,[column90] caracteristicas_empresa_trabajar_team
      ,[column91] caracteristicas_empresa_trabajar_infraestructura
      ,[column92] caracteristicas_empresa_trabajar_autonomia_decisiones
      ,[column93] caracteristicas_empresa_trabajar_equipamiento
      ,[column94] caracteristicas_empresa_trabajar_autonomia_presupuesto
      ,[column95] caracteristicas_empresa_trabajar_cercania
      ,[column96] caracteristicas_empresa_trabajar_teletrabajo
      ,[column97] caracteristicas_empresa_trabajar_horas_trabajo
      ,[column98] caracteristicas_empresa_trabajar_nohorasextras
      ,[column99] cambio_empleo_año
      ,[column100] satisfaccion
      ,[column101] ingresos
      ,[column102] producto_iphone
      ,[column103] producto_android
      ,[column104] producto_blackberry
      ,[column105] producto_windowsphone
      ,[column106] producto_ipad
      ,[column107] producto_androidtablet
      ,[column108] producto_kindlefire
      ,[column109] producto_windowstablet
      ,[column110] producto_kindle
	  ,[column111] producto_nook
      ,[column112] producto_ps3
      ,[column113] producto_xbox
      ,[column114] producto_wii
      ,[column115] producto_other
      ,[column116] gasto_anual_tecnologia
      ,[column117] anuncios_relevantes 
      ,[column118] anuncios_entrenidos
      ,[column119] anuncios_informativos
      ,[column120] anuncios_interesantes
      ,[column121] anuncios
      ,[column122] usa_bloqueador_anuncios
      ,[column123] anunciantes_stack
      ,[column125] usa_SOF_leer
      ,[column126] usa_SOF_hacer_preguntas
      ,[column127] usa_SOF_responder_preguntas
      ,[column128] usa_SOF_otros
	  , 2013 año INTO clean2013 
  FROM [dbo].[s2013]

  -- CREANDO LA TABLA CON LOS CAMPOS COMUNES
  DROP TABLE IF EXISTS m2013
  SELECT pais
      ,experiencia
      ,ocupacion
      ,[lenguaje_c++]
      ,lenguaje_c#
      ,lenguaje_java
      ,lenguaje_javascript
      ,lenguaje_php
      ,lenguaje_python
      ,lenguaje_ruby
      ,lenguaje_sql
      , ingresos
	  , año INTO m2013 
  FROM clean2013

  -- ELIMINANDO LOS DOS PRIMEROS REGISTROS

  -- MODIFICANDO EL CAMPO EXPERIENCIA

  UPDATE m2013 SET experiencia = REPLACE (experiencia, '2/5/2013', '2-5')
  UPDATE m2013 SET experiencia = REPLACE (experiencia, '6/10/2013', '6-10')


  -- MODIFICANDO EL CAMPO LENGUAJE
  
  UPDATE m2013 SET lenguaje_java = CASE WHEN lenguaje_java IS NULL THEN 0 ELSE 1 END
  UPDATE m2013 SET lenguaje_javascript = CASE WHEN lenguaje_javascript IS NULL THEN 0 ELSE 1 END
  UPDATE m2013 SET lenguaje_php = CASE WHEN lenguaje_php IS NULL THEN 0 ELSE 1 END
  UPDATE m2013 SET lenguaje_python = CASE WHEN lenguaje_python IS NULL THEN 0 ELSE 1 END
  UPDATE m2013 SET lenguaje_ruby = CASE WHEN lenguaje_ruby IS NULL THEN 0 ELSE 1 END
  UPDATE m2013 SET lenguaje_sql = CASE WHEN lenguaje_sql IS NULL THEN 0 ELSE 1 END
  UPDATE m2013 SET lenguaje_c# = CASE WHEN lenguaje_c# IS NULL THEN 0 ELSE 1 END
  UPDATE m2013 SET [lenguaje_c++] = CASE WHEN [lenguaje_c++] IS NULL THEN 0 ELSE 1 END

  -- MODIFICANDO EL CAMPO OCUPACION
    
UPDATE m2013 SET ocupacion = REPLACE (ocupacion, 'Front-End Web Developer', 'Web developer')
UPDATE m2013 SET ocupacion = REPLACE (ocupacion, 'Full-Stack Web Developer', 'Web developer')
UPDATE m2013 SET ocupacion = REPLACE (ocupacion, 'Back-End Web Developer', 'Web developer')

ALTER TABLE m2013 ADD [ocupacion_Desktop] [int] NULL
ALTER TABLE m2013 ADD [ocupacion_Staff] [int] NULL
ALTER TABLE m2013 ADD [ocupacion_Database] [int] NULL
ALTER TABLE m2013 ADD [ocupacion_Embedded] [int] NULL
ALTER TABLE m2013 ADD [ocupacion_Web] [int] NULL

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
		UPDATE m2013
		SET [ocupacion_' + @ocupacion + '] = CASE WHEN ocupacion LIKE ''%' + @ocupacion + '%'' THEN 1 ELSE 0 END, 
		  ocupacion = REPLACE(ocupacion,''' + @ocupacion + ''','''')
	')

	FETCH NEXT FROM cursor_ocupacion INTO @order, @ocupacion
END 

CLOSE cursor_ocupacion
DEALLOCATE cursor_ocupacion

ALTER TABLE m2013 DROP COLUMN ocupacion

 -- MODIFICANDO EL CAMPO INGRESOS
UPDATE m2013 SET ingresos = NULL WHERE ingresos = 'Student / Unemployed'
UPDATE m2013 SET ingresos = NULL WHERE ingresos = 'Rather not say'


 --ELIMINANDO LAS PRIMERAS DOS FILAS

DELETE FROM m2013 WHERE pais = 'What Country or Region do you live in?' OR pais = 'Response'
