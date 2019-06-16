SELECT * INTO dw_stackoverflow
FROM (
	SELECT a�o, pais, experiencia, ingresos, lenguaje_java, lenguaje_javascript, lenguaje_php, lenguaje_python, lenguaje_ruby, lenguaje_sql, lenguaje_c#, [lenguaje_c++], ocupacion_Desktop, ocupacion_Staff, ocupacion_Database, ocupacion_Embedded, ocupacion_Web
	FROM m2011
	UNION ALL
	SELECT a�o, pais, experiencia, ingresos, lenguaje_java, lenguaje_javascript, lenguaje_php, lenguaje_python, lenguaje_ruby, lenguaje_sql, lenguaje_c#, [lenguaje_c++], ocupacion_Desktop, ocupacion_Staff, ocupacion_Database, ocupacion_Embedded, ocupacion_Web
	FROM m2012
	UNION ALL
	SELECT a�o, pais, experiencia, ingresos, lenguaje_java, lenguaje_javascript, lenguaje_php, lenguaje_python, lenguaje_ruby, lenguaje_sql, lenguaje_c#, [lenguaje_c++], ocupacion_Desktop, ocupacion_Staff, ocupacion_Database, ocupacion_Embedded, ocupacion_Web
	FROM m2013
	UNION ALL
	SELECT a�o, pais, experiencia, ingresos, lenguaje_java, lenguaje_javascript, lenguaje_php, lenguaje_python, lenguaje_ruby, lenguaje_sql, lenguaje_c#, [lenguaje_c++], ocupacion_Desktop, ocupacion_Staff, ocupacion_Database, ocupacion_Embedded, ocupacion_Web
	FROM m2014
	UNION ALL
	SELECT a�o, pais, experiencia, ingresos, lenguaje_java, lenguaje_javascript, lenguaje_php, lenguaje_python, lenguaje_ruby, lenguaje_sql, lenguaje_c#, [lenguaje_c++], ocupacion_Desktop, ocupacion_System, ocupacion_Database, ocupacion_Embedded, ocupacion_Web
	FROM m2015
	UNION ALL
	SELECT a�o, pais, experiencia, ingresos, lenguaje_java, lenguaje_javascript, lenguaje_php, lenguaje_python, lenguaje_ruby, lenguaje_sql, lenguaje_c#, [lenguaje_c++], ocupacion_Desktop, ocupacion_System, ocupacion_Database, ocupacion_Embedded, ocupacion_Web
	FROM m2016
) t