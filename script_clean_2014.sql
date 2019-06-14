USE [stackoverflow]
GO

-- CREANDO LA TABLA CON LOS CAMPOS DE TODAS LAS COLUMNAS
DROP TABLE IF EXISTS clean2014

SELECT [column1] pais
      ,[column2] otro_pais
      ,[column3] estado
      ,[column4] edad
      ,[column5] sexo
	  ,[column5] experiencia
      ,[column7] ocupacion
      ,[column8] ingresos
      ,[column9] sector
      ,[column10] desarrolladores_empresa
      ,[column11] usa_remoto
      ,[column12] satisfaccion_remoto
      ,[column13] donde_remoto
      ,[column14] plataforma_mobil_iphone
      ,[column15] plataforma_mobil_ipad
      ,[column16] plataforma_mobil_androidphone
      ,[column17] plataforma_mobil_androidtablet
      ,[column18] plataforma_mobil_windowsphone
      ,[column19] plataforma_mobil_other
      ,[column20] plataforma_mobil_none
      ,[column21] tiempo_desarrollando
      ,[column22] tiempo_refactoring
      ,[column23] tiempo_fixing
      ,[column24] tiempo_technicalsupport
      ,[column25] tiempo_meetings
      ,[column26] tiempo_learning
      ,[column27] tiempo_surfing_internet
      ,[column28] tiempo_looking_job
      ,[column29] tiempo_stack_exchange
      ,[column30] rol_recommender
      ,[column31] rol_influencer
      ,[column32] rol_approver
      ,[column33] rol_purchaser
      ,[column34] rol_no_involvement
      ,[column35] comprador_hardware
      ,[column36] comprador_servers
      ,[column37] comprador_sowtware
      ,[column38] comprador_monitors_pcs_laptops
      ,[column39] comprador_consultants
      ,[column40] comprador_tools_services
      ,[column41] comprador_other
      ,[column42] presupuesto
      ,[column43] lenguaje_c
      ,[column44] [lenguaje_c++]
      ,[column45] lenguaje_c#
      ,[column46] lenguaje_java
      ,[column47] lenguaje_javascript
      ,[column48] lenguaje_nodejs
      ,[column49] lenguaje_objetivec
      ,[column50] lenguaje_php
      ,[column51] lenguaje_python
      ,[column52] lenguaje_ruby
      ,[column53] lenguaje_sql
      ,[column54] lenguaje_other
      ,[column55] tecnologia_favorita_nodejs
      ,[column56] tecnologia_favorita_haskell
      ,[column57] tecnologia_favorita_coffeescript
      ,[column58] tecnologia_favorita_dart
      ,[column59] tecnologia_favorita_cpp11
      ,[column60] tecnologia_favorita_redis
      ,[column61] tecnologia_favorita_mongodb
      ,[column62] tecnologia_favorita_f#
      ,[column63] tecnologia_favorita_go
      ,[column64] tecnologia_favorita_hadoop
      ,[column65] tecnologia_favorita_angularjs
      ,[column66] tecnologia_favorita_cordova
      ,[column67] tecnologia_favorita_arduino
      ,[column68] sistema_operativo
      ,[column69] producto_iphone
      ,[column70] producto_androidphone
      ,[column71] producto_windowsphone
      ,[column72] producto_ipad
      ,[column73] producto_androidtablet
      ,[column74] producto_kindlefire
      ,[column75] producto_windowstablet
      ,[column76] producto_ps3
      ,[column77] producto_ps4
      ,[column78] producto_xbox360
      ,[column79] producto_xboxone
      ,[column80] producto_wii
      ,[column81] producto_wiiu
      ,[column82] producto_other
      ,[column83] cambio_empleo_año
      ,[column84] modo_conseguir_empleo
      ,[column85] modo_conseguir_other
      ,[column86] busca_empleo
      ,[column87] frecuencia_empleo
      ,[column88] modo_contacto_empleo_email
      ,[column89] modo_contacto_empleo_linkedin
      ,[column90] modo_contacto_empleo_phone
      ,[column91] modo_contacto_empleo_stack
      ,[column92] modo_contacto_empleo_twitter
      ,[column93] modo_message_empleo_personalizado
      ,[column94] modo_message_empleo_codestackmencion
      ,[column95] modo_message_empleo_includes_salary
      ,[column96] modo_message_empleo_describe_team
      ,[column97] modo_message_empleo_describe_company
      ,[column98] modo_message_empleo_describe_benefits
      ,[column99] modo_message_empleo_link_stack
      ,[column100] visitas_frecuencia_plataformas_trabajo
      ,[column101] conoce_stack_careers
      ,[column102] tieneperfil_stack_careers
      ,[column103] anuncios_relevantes 
      ,[column104] anuncios_entrenidos
      ,[column105] anuncios_informativos
      ,[column106] anuncios_interesantes
      ,[column107] no_importan_anuncios
      ,[column108] elige_anuncios
      ,[column109] usa_bloqueador_anuncios
      ,[column110] conoce_concurso_apptivate
      ,[column111] participo_concurso_apptivate
      ,[column112] anuncios
      ,[column114] usa_SOF_leer
      ,[column115] usa_SOF_hacer_preguntas
      ,[column116] usa_SOF_responder_preguntas
      ,[column117] usa_SOF_looking_job
      ,[column118] usa_SOF_reputation
      ,[column119] usa_SOF_otros
      ,[column120] encuentra_soluciones_SOF
	  ,2014 año INTO clean2014
  FROM [dbo].[s2014]

  -- CREANDO LA TABLA CON LOS CAMPOS COMUNES
  DROP TABLE IF EXISTS m2014
  SELECT pais
      , estado
	  , experiencia
      , ocupacion
      , ingresos
      , sector
      ,desarrolladores_empresa
      ,plataforma_mobil_iphone
      ,plataforma_mobil_ipad
      ,plataforma_mobil_androidphone
      ,plataforma_mobil_androidtablet
      ,plataforma_mobil_windowsphone
      ,plataforma_mobil_other
      ,plataforma_mobil_none
      ,rol_recommender
      ,rol_influencer
      ,rol_approver
      ,rol_purchaser
      ,rol_no_involvement
      ,comprador_hardware
      ,comprador_servers
      ,comprador_sowtware
      ,comprador_monitors_pcs_laptops
      ,comprador_consultants
      ,comprador_tools_services
      ,presupuesto
      ,[lenguaje_c++]
      ,lenguaje_c#
      ,lenguaje_java
      ,lenguaje_javascript
      ,lenguaje_php
      ,lenguaje_python
      ,lenguaje_ruby
      ,lenguaje_sql
      ,tecnologia_favorita_nodejs
      ,tecnologia_favorita_haskell
      ,tecnologia_favorita_coffeescript
      ,tecnologia_favorita_dart
      ,tecnologia_favorita_cpp11
      ,tecnologia_favorita_redis
      ,tecnologia_favorita_mongodb
      ,tecnologia_favorita_f#
      ,tecnologia_favorita_go
      ,tecnologia_favorita_hadoop
      ,tecnologia_favorita_angularjs
      ,tecnologia_favorita_cordova
      ,tecnologia_favorita_arduino
      ,sistema_operativo
      ,producto_iphone
      ,producto_androidphone
      ,producto_windowsphone
      ,producto_ipad
      ,producto_androidtablet
      ,producto_kindlefire
      ,producto_windowstablet
      ,producto_ps3
      ,producto_ps4
      ,producto_xbox360
      ,producto_xboxone
      ,producto_wii
      ,producto_wiiu
      ,año INTO m2014
  FROM clean2014

  -- ELIMINANDO LOS DOS PRIMEROS REGISTROS

  -- MODIFICANDO EL CAMPO EXPERIENCIA

  UPDATE m2014 SET experiencia = REPLACE (experiencia, '2/5/2014', '2-5')
  UPDATE m2014 SET experiencia = REPLACE (experiencia, '6/10/2014', '6-10')


  -- MODIFICANDO EL CAMPO LENGUAJE
  
  UPDATE m2014 SET lenguaje_java = CASE WHEN lenguaje_java IS NULL THEN 0 ELSE 1 END
  UPDATE m2014 SET lenguaje_javascript = CASE WHEN lenguaje_javascript IS NULL THEN 0 ELSE 1 END
  UPDATE m2014 SET lenguaje_php = CASE WHEN lenguaje_php IS NULL THEN 0 ELSE 1 END
  UPDATE m2014 SET lenguaje_python = CASE WHEN lenguaje_python IS NULL THEN 0 ELSE 1 END
  UPDATE m2014 SET lenguaje_ruby = CASE WHEN lenguaje_ruby IS NULL THEN 0 ELSE 1 END
  UPDATE m2014 SET lenguaje_sql = CASE WHEN lenguaje_sql IS NULL THEN 0 ELSE 1 END
  UPDATE m2014 SET lenguaje_c# = CASE WHEN lenguaje_c# IS NULL THEN 0 ELSE 1 END
  UPDATE m2014 SET [lenguaje_c++] = CASE WHEN [lenguaje_c++] IS NULL THEN 0 ELSE 1 END

  select * from m2014