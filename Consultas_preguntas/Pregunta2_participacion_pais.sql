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

