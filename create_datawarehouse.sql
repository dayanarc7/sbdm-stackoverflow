USE stackoverflow

DROP TABLE IF EXISTS dw_stackoverflow
GO

SELECT * INTO dw_stackoverflow
FROM (
	SELECT año tiempo, pais, experiencia, ingresos, lenguaje_java, lenguaje_javascript, lenguaje_php, lenguaje_python, lenguaje_ruby, lenguaje_sql, lenguaje_c#, [lenguaje_c++], ocupacion_Desktop, ocupacion_Staff, ocupacion_Database, ocupacion_Embedded, ocupacion_Web
	FROM m2011
	UNION ALL
	SELECT año tiempo, pais, experiencia, ingresos, lenguaje_java, lenguaje_javascript, lenguaje_php, lenguaje_python, lenguaje_ruby, lenguaje_sql, lenguaje_c#, [lenguaje_c++], ocupacion_Desktop, ocupacion_Staff, ocupacion_Database, ocupacion_Embedded, ocupacion_Web
	FROM m2012
	UNION ALL
	SELECT año tiempo, pais, experiencia, ingresos, lenguaje_java, lenguaje_javascript, lenguaje_php, lenguaje_python, lenguaje_ruby, lenguaje_sql, lenguaje_c#, [lenguaje_c++], ocupacion_Desktop, ocupacion_Staff, ocupacion_Database, ocupacion_Embedded, ocupacion_Web
	FROM m2013
	UNION ALL
	SELECT año tiempo, pais, experiencia, ingresos, lenguaje_java, lenguaje_javascript, lenguaje_php, lenguaje_python, lenguaje_ruby, lenguaje_sql, lenguaje_c#, [lenguaje_c++], ocupacion_Desktop, ocupacion_Staff, ocupacion_Database, ocupacion_Embedded, ocupacion_Web
	FROM m2014
	UNION ALL
	SELECT año tiempo, pais, experiencia, ingresos, lenguaje_java, lenguaje_javascript, lenguaje_php, lenguaje_python, lenguaje_ruby, lenguaje_sql, lenguaje_c#, [lenguaje_c++], ocupacion_Desktop, ocupacion_System, ocupacion_Database, ocupacion_Embedded, ocupacion_Web
	FROM m2015
	UNION ALL
	SELECT año tiempo, pais, experiencia, ingresos, lenguaje_java, lenguaje_javascript, lenguaje_php, lenguaje_python, lenguaje_ruby, lenguaje_sql, lenguaje_c#, [lenguaje_c++], ocupacion_Desktop, ocupacion_System, ocupacion_Database, ocupacion_Embedded, ocupacion_Web
	FROM m2016
) t

ALTER TABLE dw_stackoverflow ADD fk_tiempo INT NULL
ALTER TABLE dw_stackoverflow ADD fk_ubicacion INT NULL