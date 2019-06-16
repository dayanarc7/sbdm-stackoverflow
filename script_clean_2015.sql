USE [stackoverflow]
GO

-- CREANDO LA TABLA CON LOS CAMPOS DE TODAS LAS COLUMNAS
DROP TABLE IF EXISTS clean2015 

SELECT [column1] pais
      ,[column2] edad
      ,[column3] sexo 
      ,[column4] tabs_spaces
      ,[column5] experiencia
      ,[column6] ocupacion
      ,[column7] sistemaoperativo
      ,[column8] sistemaoperativo_otro
      ,[column9] producto_android
      ,[column10] lenguaje_arduino
      ,[column11] lenguaje_angular
      ,[column12] lenguaje_c
      ,[column13] [lenguaje_c++]
      ,[column14] lenguaje_cpp11
      ,[column15] lenguaje_c#
      ,[column16] lenguaje_cassandra
      ,[column17] lenguaje_coffeescript
      ,[column18] lenguaje_cordova
      ,[column19] lenguaje_clojure
      ,[column20] lenguaje_cloud
      ,[column21] lenguaje_dart
      ,[column22] lenguaje_f#
      ,[column23] lenguaje_go
      ,[column24] lenguaje_hadoop
      ,[column25] lenguaje_haskell
      ,[column26] lenguaje_ios
      ,[column27] lenguaje_java
      ,[column28] lenguaje_javascript
      ,[column29] lenguaje_LAMP
      ,[column30] lenguaje_matlab
      ,[column31] lenguaje_mongodb
      ,[column32] lenguaje_nodejs
      ,[column33] lenguaje_objetivec
      ,[column34] lenguaje_perl
      ,[column35] lenguaje_php
      ,[column36] lenguaje_python
      ,[column37] lenguaje_r
      ,[column38] lenguaje_redis
      ,[column39] lenguaje_ruby
      ,[column40] lenguaje_rust
      ,[column41] lenguaje_salesforce
      ,[column42] lenguaje_scala
      ,[column43] lenguaje_sharep
      ,[column44] lenguaje_spark
      ,[column45] lenguaje_sql
      ,[column46] lenguaje_sqlserver
      ,[column47] lenguaje_swift
      ,[column48] lenguaje_visualbasic
      ,[column49] lenguaje_windowsphone
      ,[column50] lenguaje_wordpress
      ,[column51] lenguaje_RavenDb
      ,[column52] lenguaje_android
      ,[column53] lenguaje_arduino_rasp_pi
      ,[column54] lenguaje_angularjs
      ,[column55]
      ,[column56]
      ,[column57]
      ,[column58]
      ,[column59]
      ,[column60]
      ,[column61]
      ,[column62]
      ,[column63]
      ,[column64]
      ,[column65]
      ,[column66]
      ,[column67]
      ,[column68]
      ,[column69]
      ,[column70]
      ,[column71]
      ,[column72]
      ,[column73]
      ,[column74]
      ,[column75]
      ,[column76]
      ,[column77]
      ,[column78]
      ,[column79]
      ,[column80]
      ,[column81]
      ,[column82]
      ,[column83]
      ,[column84]
      ,[column85]
      ,[column86]
      ,[column87]
      ,[column88]
      ,[column89]
      ,[column90]
      ,[column91]
      ,[column92]
      ,[column93]
      ,[column94]
      ,[column95] training
      ,[column96] training_job
      ,[column97] training_boot_camp
      ,[column98] training_online
      ,[column99] training_mentors
      ,[column100] educacion_certificado
      ,[column101] educacion_universidad
      ,[column102] educacion_bachelor
      ,[column103] educacion_master_degree
      ,[column104] educacion_phd
      ,[column105] educacion_other
      ,[column106] ingresos
      ,[column107] ingreso_promedio
      ,[column108] estado_empleo
      ,[column109] sector
      ,[column110] trabajo_satisfaccion
      ,[column111] rol_en_compras
      ,[column112] usa_remoto
      ,[column113] 
      ,[column114] busca_trabajo
      ,[column115] forma_de_pago
      ,[column116] 
      ,[column117] make_important_decision
      ,[column118] Health_insurance
      ,[column119]
      ,[column120]
      ,[column121]
      ,[column122]
      ,[column123] work_life_balance
      ,[column124] Opportunity_advancement
      ,[column125]
      ,[column126] Office_location
      ,[column127] Quality_colleagues
      ,[column128] Company_culture
      ,[column129]
      ,[column130] Building_something_matters
      ,[column131] Remote_working_options
      ,[column132] remoto_vs_office
      ,[column133] 
      ,[column134] Finding_time_to_job_search
      ,[column135] Finding_open_job_
      ,[column136] search_job_interesting
      ,[column137] Interesting_companies_rarely_respond
      ,[column138] Writing_my_CV
      ,[column139] Taking_time_off
      ,[column140] interview_process
      ,[column141]
      ,[column142]
      ,[column143]
      ,[column144]
      ,[column145]
      ,[column146]
      ,[column147]
      ,[column148]
      ,[column149]
      ,[column150]
      ,[column151]
      ,[column152]
      ,[column153]
      ,[column154]
      ,[column155]
      ,[column156]
      ,[column157]
      ,[column158]
      ,[column159]
      ,[column160]
      ,[column161]
      ,[column162]
      ,[column163]
      ,[column164]
      ,[column165]
      ,[column166]
      ,[column167]
      ,[column168]
      ,[column169]
      ,[column170]
      ,[column171]
      ,[column172]
      ,[column173]
      ,[column174]
      ,[column175]
      ,[column176]
      ,[column177]
      ,[column178]
      ,[column179]
      ,[column180]
      ,[column181]
      ,[column182]
      ,[column183]
      ,[column184]
      ,[column185]
      ,[column186]
      ,[column187]
      ,[column188]
      ,[column189]
      ,[column190]
      ,[column191]
      ,[column192]
      ,[column193]
      ,[column194]
      ,[column195]
      ,[column196]
      ,[column197]
      ,[column198]
      ,[column199]
      ,[column200]
      ,[column201]
      ,[column202]
      ,[column203]
      ,[column204]
      ,[column205]
      ,[column206]
      ,[column207]
      ,[column208]
      ,[column209]
      ,[column210]
      ,[column211]
      ,[column212]
      ,[column213]
      ,[column214]
      ,[column215]
      ,[column216]
      ,[column217]
      ,[column218]
      ,[column219]
      ,[column220]
      ,[column221]
      ,[column222]
	  ,2015 año INTO clean2015
  FROM [dbo].[s2015]

   -- CREANDO LA TABLA CON LOS CAMPOS COMUNES
  DROP TABLE IF EXISTS m2015
  SELECT pais
      , experiencia
      , ocupacion
	  , ingresos
      ,[lenguaje_c++]
      ,lenguaje_c#
      ,lenguaje_java
      ,lenguaje_javascript
      ,lenguaje_php
      ,lenguaje_python
      ,lenguaje_ruby
      ,lenguaje_sql
      ,año INTO m2015
  FROM clean2015

  -- ELIMINANDO LOS DOS PRIMEROS REGISTROS

  -- MODIFICANDO EL CAMPO EXPERIENCIA

  UPDATE m2015 SET experiencia = REPLACE (experiencia, 'Less than 1 year', '2-5')
  UPDATE m2015 SET experiencia = REPLACE (experiencia, '1 - 2 years', '2-5')
  UPDATE m2015 SET experiencia = REPLACE (experiencia, '2 - 5 years', '2-5')
  UPDATE m2015 SET experiencia = REPLACE (experiencia, '6 - 10 years', '6-10')
  UPDATE m2015 SET experiencia = REPLACE (experiencia, '11+ years', '11')
 

  -- MODIFICANDO EL CAMPO LENGUAJE
  
  UPDATE m2015 SET lenguaje_java = CASE WHEN lenguaje_java IS NULL THEN 0 ELSE 1 END
  UPDATE m2015 SET lenguaje_javascript = CASE WHEN lenguaje_javascript IS NULL THEN 0 ELSE 1 END
  UPDATE m2015 SET lenguaje_php = CASE WHEN lenguaje_php IS NULL THEN 0 ELSE 1 END
  UPDATE m2015 SET lenguaje_python = CASE WHEN lenguaje_python IS NULL THEN 0 ELSE 1 END
  UPDATE m2015 SET lenguaje_ruby = CASE WHEN lenguaje_ruby IS NULL THEN 0 ELSE 1 END
  UPDATE m2015 SET lenguaje_sql = CASE WHEN lenguaje_sql IS NULL THEN 0 ELSE 1 END
  UPDATE m2015 SET lenguaje_c# = CASE WHEN lenguaje_c# IS NULL THEN 0 ELSE 1 END
  UPDATE m2015 SET [lenguaje_c++] = CASE WHEN [lenguaje_c++] IS NULL THEN 0 ELSE 1 END

--MODIFICANDO EL CAMPO INGRESOS
UPDATE m2015 SET ingresos = NULL WHERE ingresos = 'Unemployed'
UPDATE m2015 SET ingresos = NULL WHERE ingresos = 'Rather not say'
UPDATE m2015 SET ingresos = REPLACE(ingresos, 'Less than ','<')
UPDATE m2015 SET ingresos = REPLACE(ingresos, '$140,000 - $160,000','>$140,000')
UPDATE m2015 SET ingresos = REPLACE(ingresos, 'More than $160,000','>$140,000')

-- MODIFICANDO EL CAMPO  OCUPACION
UPDATE m2015 SET ocupacion = REPLACE (ocupacion, 'Front-End Web Developer', 'Web developer')
UPDATE m2015 SET ocupacion = REPLACE (ocupacion, 'Full-Stack Web Developer', 'Web developer')
UPDATE m2015 SET ocupacion = REPLACE (ocupacion, 'Back-End Web Developer', 'Web developer')

ALTER TABLE m2015 ADD [ocupacion_Desktop] [int] NULL
ALTER TABLE m2015 ADD [ocupacion_System] [int] NULL
ALTER TABLE m2015 ADD [ocupacion_Database] [int] NULL
ALTER TABLE m2015 ADD [ocupacion_Embedded] [int] NULL
ALTER TABLE m2015 ADD [ocupacion_Web] [int] NULL

--Cursor para desagregar lenguajes
DECLARE @order INT
DECLARE @ocupacion VARCHAR(50)

DECLARE cursor_ocupacion CURSOR FOR 
	SELECT 1, 'Desktop'
	UNION
	SELECT 2, 'System'
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
		UPDATE m2015
		SET [ocupacion_' + @ocupacion + '] = CASE WHEN ocupacion LIKE ''%' + @ocupacion + '%'' THEN 1 ELSE 0 END, 
		  ocupacion = REPLACE(ocupacion,''' + @ocupacion + ''','''')
	')

	FETCH NEXT FROM cursor_ocupacion INTO @order, @ocupacion
END 

CLOSE cursor_ocupacion
DEALLOCATE cursor_ocupacion

SELECT * FROM m2015 