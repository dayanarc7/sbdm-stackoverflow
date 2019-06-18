-- CREAR TABLA PARA MAP REDUCE (LENGUAJES EN UNA SOLA COLUMNA)


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