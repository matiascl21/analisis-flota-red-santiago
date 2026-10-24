# Diagnóstico de Demanda Operativa y Concentración Territorial - Red Movilidad RM

## 1. Alcance y Objetivos de Negocio (Fase Ask)
El Directorio de Transporte Público Metropolitano (DTPM) requiere información cuantitativa para planificar la distribución operativa de flota de superficie y la priorización de infraestructura para transporte de bajas o nulas emisiones en el Gran Santiago.

### Objetivos Específicos:
* Cuantificar la distribución territorial de la afluencia de pasajeros en días laborales para identificar las comunas de mayor concentración de demanda.
* Determinar los bloques horarios punta que imponen la mayor exigencia operativa sobre la red de superficie.

---

## 2. Origen de Datos y Metadatos (Fase Prepare)
* **Fuente de Información:** Directorio de Transporte Público Metropolitano (DTPM), plataforma de Datos Abiertos (Open Data).
* **Dataset:** Reporte oficial consolidado de subidas promedio por paradero, servicio y media hora.
* **Granularidad:** Nivel de paradero y bloque horario (30 minutos) por tipo de jornada.
* **Gobernanza y Ética:** Información pública de acceso abierto, debidamente anonimizada a nivel transaccional sin riesgo de exposición de identificadores individuales de tarjeta bip!.

---

## 3. Procesamiento y Estandarización Técnica (Fase Process)
El procesamiento se ejecutó en el entorno Google BigQuery SQL (dialecto estándar), implementando las siguientes convenciones:
* Cláusulas reservadas del lenguaje y funciones de agregación en mayúsculas sostenidas (`SELECT`, `FROM`, `WHERE`, `GROUP BY`, `ORDER BY`, `SUM`, `ROUND`).
* Asignación de alias y variables bajo formato `snake_case` para asegurar consistencia y portabilidad en motores relacionales.
* Filtrado explícito de valores nulos y validación estricta de cadenas de caracteres sensibles a mayúsculas (`Tipo_dia = 'LABORAL'`).

---

## 4. Resultados Principales (Fase Analyze)

### Distribución Geográfica
* El volumen principal de subidas en la red de transporte en superficie se concentra de manera predominante en las comunas de **Santiago**, **Providencia** y **Las Condes**.
* Estas tres comunas constituyen el principal polo laboral, financiero y de transferencias intermodales con las líneas troncales de Metro de Santiago.

### Comportamiento Temporal
* La demanda en días laborales exhibe una curva bimodal marcada, concentrando picos de demanda durante los bloques matutinos (acceso a centros laborales y educacionales) y vespertinos (retorno residencial).

---

## 5. Recomendaciones Estratégicas (Fase Act)
1. **Asignación Prioritaria de Flota Eléctrica:** Focalizar la renovación e inserción de unidades de tracción 100% eléctrica en recorridos troncales que cruzan el eje Santiago-Providencia-Las Condes, maximizando la mitigación de emisiones acústicas y de material particulado en las zonas de mayor exposición de transeúntes.
2. **Programación Operativa de Carga:** Planificar los turnos de recarga de batería e itinerarios de mantención técnica fuera de las franjas horarias punta identificadas, asegurando un coeficiente de disponibilidad de flota cercano al 100% en las horas de máxima exigencia.
3. **Escalamiento del Análisis:** Integrar mediciones semestrales posteriores para evaluar la elasticidad de la demanda en paraderos de superficie tras la inauguración o extensión de nuevas estaciones de la red de Metro.

---

## 6. Estructura del Repositorio
* `sql/`: Scripts de consultas SQL (`01_analisis_demanda.sql`).
* `data/raw/`: Datos de origen en formato CSV.
* `data/processed/`: Tablas de resultados agregados exportadas para reporte.