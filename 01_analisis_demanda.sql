/* 
===========================================================
PROYECTO: Diagnóstico de Demanda Operativa - Red Movilidad RM
AUTOR: Analista de Datos Trainee
FECHA: Abril 2025
DESCRIPCIÓN: Consultas de agregación para detectar 
             concentración territorial y patrones horarios.
===========================================================
*/

-- 1. Auditoría general del conjunto de datos
SELECT
  COUNT(*) AS total_filas,
  COUNT(DISTINCT Comuna) AS total_comunas,
  COUNT(DISTINCT Paradero) AS total_paraderos,
  ROUND(SUM(Subidas_Promedio), 2) AS total_subidas_estimadas
FROM
  `repositorio-red.transporte_santiago.subidas_abril_2025`;

-- 2. Concentración geográfica: Top 10 comunas por afluencia
SELECT
  Comuna AS comuna,
  ROUND(SUM(Subidas_Promedio), 2) AS total_subidas
FROM
  `repositorio-red.transporte_santiago.subidas_abril_2025`
WHERE
  Comuna IS NOT NULL
GROUP BY
  Comuna
ORDER BY
  total_subidas DESC
LIMIT 10;

-- 3. Patrones temporales: Bloques horarios punta en días laborales
SELECT
  Media_hora AS bloque_horario,
  ROUND(SUM(Subidas_Promedio), 2) AS total_subidas
FROM
  `repositorio-red.transporte_santiago.subidas_abril_2025`
WHERE
  Tipo_dia = 'LABORAL'
GROUP BY
  Media_hora
ORDER BY
  total_subidas DESC
LIMIT 5;