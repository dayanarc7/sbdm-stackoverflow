-- PREGUNTA 1: �Cu�les son los 5 paises con el mayor n�mero de desarrolladores?

SELECT TOP 5 u.pais , COUNT(d.fk_ubicacion) total FROM dw_stackoverflow d, ubicacion u
WHERE d.fk_ubicacion = u.id_ubicacion
GROUP BY d.fk_ubicacion, u.pais 
ORDER BY COUNT(d.fk_ubicacion) DESC 