-- PREGUNTA 4: �Cu�l ha sido el comportamiento hist�rico de cada lenguaje en Colombia por pa�s?

SELECT u.pais, t.a�o, d.Java, d.Python, d.C#, d.[C++], d.Javascript, d.Php, d.Ruby, d.Sql 
FROM
(
	SELECT d.FK_tiempo, d.FK_ubicacion, SUM(lenguaje_java) [Java], SUM(lenguaje_python) [Python], SUM(lenguaje_c#) [C#], SUM([lenguaje_c++]) [C++],
			SUM(lenguaje_javascript) [Javascript], SUM(lenguaje_php) [Php], SUM(lenguaje_ruby) [Ruby], SUM(lenguaje_sql) [Sql]
	FROM dw_stackoverflow d
	GROUP BY d.FK_tiempo, d.FK_ubicacion
) d
INNER JOIN tiempo t ON t.id_tiempo = d.FK_tiempo
INNER JOIN ubicacion u ON u.id_ubicacion = d.FK_ubicacion
WHERE pais = 'Colombia'
ORDER BY u.pais, t.a�o