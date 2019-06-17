-- PREGUNTA 4: ¿Cuál ha sido el rango salarial más popular por ocupación en cada año?

WITH comun AS (
	SELECT d.fk_tiempo, d.fk_ingresos, 
			CASE WHEN ocupacion_Database = 1 THEN 'Database' WHEN ocupacion_Desktop = 1 THEN 'Desktop' WHEN ocupacion_Embedded = 1 THEN 'Embedded' 
				WHEN ocupacion_Staff = 1 THEN 'Staff' WHEN ocupacion_Web = 1 THEN 'Web' END ocupacion
	FROM dw_stackoverflow d
),
ocupacion_año AS (
	SELECT fk_tiempo, ocupacion, COUNT(*) total
	FROM comun c
	WHERE c.ocupacion IS NOT NULL AND c.fk_ingresos IS NOT NULL AND c.fk_tiempo IS NOT NULL
	GROUP BY fk_tiempo, ocupacion
),
ocupacion_año_ingresos AS (
	SELECT c.fk_tiempo, c.fk_ingresos, c.ocupacion, COUNT(*) total
	FROM comun c
	WHERE c.ocupacion IS NOT NULL AND c.fk_ingresos IS NOT NULL AND c.fk_tiempo IS NOT NULL
	GROUP BY c.fk_tiempo, c.fk_ingresos, c.ocupacion
)

SELECT año, d.ocupacion, ingresos, d.total * 100.0 / o.total [porcentaje]
FROM  ocupacion_año_ingresos d
INNER JOIN tiempo t ON t.id_tiempo = d.fk_tiempo
INNER JOIN ingresos i ON i.id_ingresos = d.fk_ingresos
INNER JOIN ocupacion_año o ON o.fk_tiempo = d.fk_tiempo AND o.ocupacion = d.ocupacion
ORDER BY año, ocupacion, i.[order]