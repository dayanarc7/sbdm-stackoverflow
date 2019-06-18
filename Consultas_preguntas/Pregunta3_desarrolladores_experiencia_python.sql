-- PREGUNTA 3: Rango salarial por años de experiencia por lenguaje

SELECT e.rango [Rango], i.ingresos, d.total [Total]
FROM (
	SELECT d.fk_experiencia, d.fk_ingresos, COUNT(*) total 
	FROM dw_stackoverflow d
	WHERE d.lenguaje_java = 1
	GROUP BY d.fk_experiencia, d.fk_ingresos
) d
INNER JOIN experiencia e ON e.id_experiencia = d.fk_experiencia
INNER JOIN ingresos i ON i.id_ingresos = d.fk_ingresos
ORDER BY Rango, ingresos