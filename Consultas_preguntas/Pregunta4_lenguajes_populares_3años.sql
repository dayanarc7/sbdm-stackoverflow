-- PREGUNTA 4: �Cu�l es el lenguaje de programaci�n m�s popular en los �ltimos 3 a�os?

SELECT SUM(lenguaje_java) [Java], SUM(lenguaje_python) [Python] FROM dw_stackoverflow d
INNER JOIN tiempo t ON t.id_tiempo = d.fk_tiempo 
WHERE t.a�o >= 2013