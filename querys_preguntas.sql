-- PREGUNTA 1: �Cu�les son los 5 paises con el mayor n�mero de desarrolladores?

SELECT TOP 5 u.pais , COUNT(d.fk_ubicacion) total FROM dw_stackoverflow d, ubicacion u
WHERE d.fk_ubicacion = u.id_ubicacion
GROUP BY d.fk_ubicacion, u.pais 
ORDER BY COUNT(d.fk_ubicacion) DESC 

-- PREGUNTA 2: �Cu�l es la participaci�n del total de encuestas por pa�s ?

WITH total AS
(
	SELECT CAST(COUNT(*) AS FLOAT) total
	FROM dw_stackoverflow
)

SELECT u.pais [Pais], ROUND(y.total_x_pais * 100 / t.total, 2) [Porcentaje]
FROM
(
	SELECT d.fk_ubicacion, CAST(COUNT(*) AS FLOAT) total_x_pais
	FROM dw_stackoverflow d
	GROUP BY d.fk_ubicacion
) y, ubicacion u, total t 
WHERE u.id_ubicacion = y.fk_ubicacion
ORDER BY y.total_x_pais DESC

-- PREGUNTA 3: N�mero de desarrolladores seg�n rango de experiencia    

SELECT e.rango [Rango], t.total [Total]
FROM (
	SELECT d.fk_experiencia, COUNT(*) total 
	FROM dw_stackoverflow d
	GROUP BY d.fk_experiencia
) t 
INNER JOIN experiencia e ON e.id_experiencia = t.fk_experiencia
ORDER BY Rango

-- PREGUNTA 4: �Cu�l es el lenguaje de programaci�n m�s popular en los �ltimos 3 a�os?

SELECT * INTO leng_ FROM (SELECT d.fk_tiempo, (CASE  WHEN lenguaje_java= 1 THEN 'java' END) [Lenguaje] FROM dw_stackoverflow d
WHERE d.lenguaje_java = 1
UNION ALL 
SELECT d.fk_tiempo, (CASE  WHEN lenguaje_python= 1 THEN 'python' END) [Lenguaje] FROM dw_stackoverflow d
WHERE d.lenguaje_python= 1
UNION ALL
SELECT d.fk_tiempo, (CASE  WHEN lenguaje_javascript= 1 THEN 'javascript' END) [Lenguaje] FROM dw_stackoverflow d
WHERE d.lenguaje_javascript = 1
UNION ALL
SELECT d.fk_tiempo, (CASE  WHEN lenguaje_javascript= 1 THEN 'sql' END) [Lenguaje] FROM dw_stackoverflow d
WHERE d.lenguaje_sql = 1
UNION ALL
SELECT d.fk_tiempo, (CASE  WHEN lenguaje_c#= 1 THEN 'c#' END) [Lenguaje] FROM dw_stackoverflow d
WHERE d.lenguaje_c# = 1
UNION ALL
SELECT d.fk_tiempo, (CASE  WHEN [lenguaje_c++]= 1 THEN 'c++' END) [Lenguaje] FROM dw_stackoverflow d
WHERE d.[lenguaje_c++] = 1) t


select * from leng_

SELECT TOP 1 Lenguaje, COUNT(*) FROM leng_ [total] GROUP BY Lenguaje
ORDER BY COUNT(*) DESC



SELECT d.fk_tiempo, SUM(lenguaje_java) [Java] ,SUM(lenguaje_python) [Python], SUM(lenguaje_sql) [Sql] FROM dw_stackoverflow d 
INNER JOIN tiempo t ON t.id_tiempo = d.fk_tiempo 
WHERE t.a�o >= 2013




SELECT SUM(lenguaje_java) [Java], SUM(lenguaje_python) [Python] FROM dw_stackoverflow d
INNER JOIN tiempo t ON t.id_tiempo = d.fk_tiempo 
WHERE t.a�o >= 2013