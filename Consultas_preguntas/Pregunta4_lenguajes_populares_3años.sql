-- PREGUNTA 4: ¿Cuál es el lenguaje de programación más popular en los últimos 3 años?

SELECT SUM(lenguaje_java) [Java], SUM(lenguaje_python) [Python] FROM dw_stackoverflow d
INNER JOIN tiempo t ON t.id_tiempo = d.fk_tiempo 
WHERE t.año >= 2013