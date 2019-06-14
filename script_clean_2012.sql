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
      ,sector
	  ,experiencia
      ,tamaño_empresa
      ,ocupacion
      ,rol_influencer		
      ,rol_recommender
      ,rol_approver
      ,rol_purchaser
      ,rol_check_writer
      ,rol_no_invoment
      ,rol_seller
      ,comprador_hardware
      ,comprador_servers
      ,comprador_sowtware
      ,comprador_monitors_pcs_laptops
      ,comprador_consultants
      ,comprador_other
      ,presupuesto
      ,tipo_proyecto
      ,lenguaje_java
      ,lenguaje_javascript
      ,lenguaje_php
      ,lenguaje_python
      ,lenguaje_ruby
      ,lenguaje_sql
      ,lenguaje_c#
      ,[lenguaje_c++]
      ,sistema_operativo
      ,satisfaccion
      ,ingresos
      ,producto_iphone
      ,producto_android
      ,producto_blackberry
      ,producto_windowsphone
      ,producto_other_smart_phone
      ,producto_regular
      ,producto_kindle
      ,producto_nook
      ,producto_appletv
      ,producto_boxee
      ,producto_streaming_device
      ,producto_netbook
      ,producto_ps3
      ,producto_xbox
      ,producto_wii
      ,producto_other_gaming
      ,producto_kindlefire
      ,producto_ipad
      ,producto_othertablet
      ,producto_other
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

  select * from m2012