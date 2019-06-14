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
      ,sector
      ,tamaño_empresa
      ,ocupacion
      ,rol_influencer
      ,rol_recommender
      ,rol_approver
      ,rol_purchaser
      ,rol_check_writer
      ,rol_no_involvement
      ,rol_seller
      ,comprador_hardware
      ,comprador_servers
      ,comprador_sowtware
      ,comprador_monitors_pcs_laptops
      ,comprador_consultants
      ,comprador_other
      ,presupuesto_menor_10000
      ,presupuesto_10001_25000
      ,presupuesto_25001_40000
      ,presupuesto_41000_75000
      ,presupuesto_75001_100000
      ,presupuesto_100001_150000
      ,presupuesto_mayor_150000
      ,pesupuesto_dont_know
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
      ,producto_other_smart_phone
      ,producto_regular
      ,producto_kindle
      ,producto_nook
      ,producto_bluray
      ,producto_hdtv
      ,producto_appletv
      ,producto_ipad
      ,producto_other_netbook
      ,prodcuto_ps3
      ,producto_xbox
      ,producto_wii
	  , año INTO m2011
  FROM clean2011

  -- ELIMINANDO LOS DOS PRIMEROS REGISTROS

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
 
 select * from m2011