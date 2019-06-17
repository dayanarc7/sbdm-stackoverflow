-- PREGUNTA 3: Número de desarrolladores según rango de experiencia    

SELECT e.rango [Rango], t.total [Total]
FROM (
	SELECT d.fk_experiencia, COUNT(*) total 
	FROM dw_stackoverflow d
	GROUP BY d.fk_experiencia
) t 
INNER JOIN experiencia e ON e.id_experiencia = t.fk_experiencia
ORDER BY Rango