USE [stackoverflow]
GO

-- CREANDO LA TABLA CON LOS CAMPOS DE TODAS LAS COLUMNAS
DROP TABLE IF EXISTS clean2016

SELECT [column1]
      ,[collector] fuente_datos
      ,[country] pais
      ,[un_subregion] sub_region
      ,[so_region] region
      ,[age_range] edad
      ,[age_midpoint] edad_promedio
      ,[gender] sexo
      ,[self_identification] perfil
      ,[occupation] ocupacion
      ,[occupation_group] ocupacion_grupo
      ,[experience_range] experiencia
      ,[experience_midpoint] experiencia_promedio
      ,[salary_range] ingresos
      ,[salary_midpoint] ingreso_promedio
      ,[big_mac_index] 
      ,[tech_do] lenguaje
      ,[tech_want] tecnologia_favorita
      ,[programming_ability] habilidad_programacion
      ,[employment_status] estado_empleo
      ,[industry] sector
      ,[company_size_range] tama�o_empresa
      ,[team_size_range] tama�o_team
      ,[women_on_team] mujeres_team
      ,[remote] usa_remoto
      ,[job_satisfaction] trabajo_satisfaccion
      ,[job_discovery] trabajo_describe
      ,[dev_environment] ambiente_desarrollo
      ,[commit_frequency] commit_frequency
      ,[hobby] hobby
      ,[dogs_vs_cats] dogs_cats
      ,[desktop_os] sistemaoperativo
      ,[unit_testing] unit_testing
      ,[rep_range] rep_range
      ,[visit_frequency] 
      ,[why_learn_new_tech]
      ,[education]
      ,[open_to_new_job]
      ,[new_job_value]
      ,[job_search_annoyance]
      ,[interview_likelihood]
      ,[how_to_improve_interview_process]
      ,[star_wars_vs_star_trek]
      ,[agree_tech]
      ,[agree_notice]
      ,[agree_problemsolving]
      ,[agree_diversity]
      ,[agree_adblocker]
      ,[agree_alcohol]
      ,[agree_loveboss]
      ,[agree_nightcode]
      ,[agree_legacy]
      ,[agree_mars]
      ,[important_variety]
      ,[important_control]
      ,[important_sameend]
      ,[important_newtech]
      ,[important_buildnew]
      ,[important_buildexisting]
      ,[important_promotion]
      ,[important_companymission]
      ,[important_wfh]
      ,[important_ownoffice]
      ,[developer_challenges]
      ,[why_stack_overflow]
	  ,2016 a�o INTO clean2016
  FROM [dbo].[s2016]

    -- CREANDO LA TABLA CON LOS CAMPOS COMUNES
  DROP TABLE IF EXISTS m2016
  SELECT pais
      , ocupacion
      ,experiencia
	  , lenguaje
      , ingresos
	  ,a�o INTO m2016
  FROM clean2016

  -- ELIMINANDO LOS DOS PRIMEROS REGISTROS

  -- MODIFICANDO EL CAMPO EXPERIENCIA

  UPDATE m2016 SET experiencia = REPLACE (experiencia, 'Less than 1 year', '2-5')
  UPDATE m2016 SET experiencia = REPLACE (experiencia, '1 - 2 years', '2-5')
  UPDATE m2016 SET experiencia = REPLACE (experiencia, '2 - 5 years', '2-5')
  UPDATE m2016 SET experiencia = REPLACE (experiencia, '6 - 10 years', '6-10')
  UPDATE m2016 SET experiencia = REPLACE (experiencia, '11+ years', '11')
 

-- MODIFICANDO EL CAMPO LENGUAJE
  
 --Agregar columnas para cada lenguaje
ALTER TABLE m2016 ADD [lenguaje_python] [int] NULL
ALTER TABLE m2016 ADD [lenguaje_java] [int] NULL
ALTER TABLE m2016 ADD [lenguaje_c#] [int] NULL
ALTER TABLE m2016 ADD [lenguaje_javascript] [int] NULL
ALTER TABLE m2016 ADD [lenguaje_sql] [int] NULL
ALTER TABLE m2016 ADD [lenguaje_php] [int] NULL
ALTER TABLE m2016 ADD [lenguaje_ruby] [int] NULL
ALTER TABLE m2016 ADD [lenguaje_c++] [int] NULL

--Cursor para desagregar lenguajes
DECLARE @order INT
DECLARE @lenguaje VARCHAR(50)

DECLARE cursor_lenguajes CURSOR FOR 
	SELECT 1, 'JavaScript'
	UNION
	SELECT 2, 'Python'
	UNION
	SELECT 3, 'C#'
	UNION
	SELECT 4, 'PHP'
	UNION
	SELECT 5, 'SQL'
	UNION
	SELECT 6, 'JAVA'
	UNION
	SELECT 7, 'Ruby'
	UNION
	SELECT 8, 'C++'
	ORDER BY 1

OPEN cursor_lenguajes 

FETCH NEXT FROM cursor_lenguajes INTO @order, @lenguaje

WHILE @@FETCH_STATUS = 0
BEGIN

	EXECUTE('
		UPDATE m2016 
		SET [lenguaje_' + @lenguaje + '] = CASE WHEN lenguaje LIKE ''%' + @lenguaje + '%'' THEN 1 ELSE 0 END, 
		   lenguaje = REPLACE(lenguaje,''' + @lenguaje + ''','''')
	')

	FETCH NEXT FROM cursor_lenguajes INTO @order, @lenguaje
END 

CLOSE cursor_lenguajes
DEALLOCATE cursor_lenguajes


--MODIFICANDO EL CAMPO INGRESOS
UPDATE m2016 SET ingresos = NULL WHERE ingresos = 'Other (please specify)'
UPDATE m2016 SET ingresos = NULL WHERE ingresos = 'Rather not say'
UPDATE m2016 SET ingresos = NULL WHERE ingresos = 'Unemployed'
UPDATE m2016 SET ingresos = REPLACE(ingresos, '$10,000 - $20,000','<$20,000')
UPDATE m2016 SET ingresos = REPLACE(ingresos, 'Less than $10,000','<$20,000')
UPDATE m2016 SET ingresos = REPLACE(ingresos, '$140,000 - $150,000','>$140,000')
UPDATE m2016 SET ingresos = REPLACE(ingresos, '$150,000 - $160,000','>$140,000')
UPDATE m2016 SET ingresos = REPLACE(ingresos, '$160,000 - $170,000','>$140,000')
UPDATE m2016 SET ingresos = REPLACE(ingresos, '$170,000 - $180,000','>$140,000')
UPDATE m2016 SET ingresos = REPLACE(ingresos, '$180,000 - $190,000','>$140,000')
UPDATE m2016 SET ingresos = REPLACE(ingresos, '$190,000 - $200,000','>$140,000')
UPDATE m2016 SET ingresos = REPLACE(ingresos, 'More than $200,000','>$140,000')
UPDATE m2016 SET ingresos = REPLACE(ingresos, 'More than $200,000','>$140,000')
UPDATE m2016 SET ingresos = REPLACE(ingresos, '$100,000 - $110,000','$100,000 - $120,000')
UPDATE m2016 SET ingresos = REPLACE(ingresos, '$110,000 - $120,000','$100,000 - $120,000')
UPDATE m2016 SET ingresos = REPLACE(ingresos, '$120,000 - $130,000','$120,000 - $140,000')
UPDATE m2016 SET ingresos = REPLACE(ingresos, '$130,000 - $140,000','$120,000 - $140,000')
UPDATE m2016 SET ingresos = REPLACE(ingresos, '$80,000 - $90,000','$80,000 - $100,000')
UPDATE m2016 SET ingresos = REPLACE(ingresos, '$90,000 - $100,000','$80,000 - $100,000')
UPDATE m2016 SET ingresos = REPLACE(ingresos, '$60,000 - $70,000','$60,000 - $80,000')
UPDATE m2016 SET ingresos = REPLACE(ingresos, '$70,000 - $80,000','$60,000 - $80,000')
UPDATE m2016 SET ingresos = REPLACE(ingresos, '$40,000 - $50,000','$40,000 - $60,000')
UPDATE m2016 SET ingresos = REPLACE(ingresos, '$50,000 - $60,000','$40,000 - $60,000')
UPDATE m2016 SET ingresos = REPLACE(ingresos, '$20,000 - $30,000','$20,000 - $40,000')
UPDATE m2016 SET ingresos = REPLACE(ingresos, '$30,000 - $40,000','$20,000 - $40,000')

-- MODIFICANDO EL CAMPO  OCUPACION
UPDATE m2016 SET ocupacion = REPLACE (ocupacion, 'Front-End Web Developer', 'Web developer')
UPDATE m2016 SET ocupacion = REPLACE (ocupacion, 'Full-Stack Web Developer', 'Web developer')
UPDATE m2016 SET ocupacion = REPLACE (ocupacion, 'Back-End Web Developer', 'Web developer')

ALTER TABLE m2016 ADD [ocupacion_Desktop] [int] NULL
ALTER TABLE m2016 ADD [ocupacion_System] [int] NULL
ALTER TABLE m2016 ADD [ocupacion_Database] [int] NULL
ALTER TABLE m2016 ADD [ocupacion_Embedded] [int] NULL
ALTER TABLE m2016 ADD [ocupacion_Web] [int] NULL

--Cursor para desagregar lenguajes
DECLARE @ocupacion VARCHAR(50)

DECLARE cursor_ocupacion CURSOR FOR 
	SELECT 'Desktop'
	UNION
	SELECT 'System'
	UNION
	SELECT 'Database'
	UNION
	SELECT 'Embedded'
	UNION
	SELECT 'Web'

OPEN cursor_ocupacion

FETCH NEXT FROM cursor_ocupacion INTO @ocupacion

WHILE @@FETCH_STATUS = 0
BEGIN

	EXECUTE('
		UPDATE m2016
		SET [ocupacion_' + @ocupacion + '] = CASE WHEN ocupacion LIKE ''%' + @ocupacion + '%'' THEN 1 ELSE 0 END, 
		  ocupacion = REPLACE(ocupacion,''' + @ocupacion + ''','''')
	')

	FETCH NEXT FROM cursor_ocupacion INTO @ocupacion
END 

CLOSE cursor_ocupacion
DEALLOCATE cursor_ocupacion