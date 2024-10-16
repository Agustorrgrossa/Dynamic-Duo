

/* Usamos la BD del servidor */
USE nbaplayers

/* Creación de columna FechaIngesta en tabla nba_stats */
ALTER TABLE [dbo].[nba_stats]
ADD ingestion_date DATETIME DEFAULT GETDATE();

/* Actualizar las filas existentes con la fecha y hora actuales */
UPDATE nba_stats
SET ingestion_date = GETDATE()
WHERE ingestion_date IS NULL;

SELECT *
FROM nba_stats

/* Creación de columna FechaIngesta en tabla common_player_info */
ALTER TABLE [dbo].[common_player_info]
ADD ingestion_date DATETIME DEFAULT GETDATE();

/* Actualizar las filas existentes con la fecha y hora actuales */
UPDATE common_player_info
SET ingestion_date = GETDATE()
WHERE ingestion_date IS NULL;

SELECT *
FROM common_player_info

/* Creación de columna FechaIngesta en tabla draft_combine_stats */
ALTER TABLE [dbo].[draft_combine_stats]
ADD ingestion_date DATETIME DEFAULT GETDATE();

/* Actualizar las filas existentes con la fecha y hora actuales */
UPDATE draft_combine_stats
SET ingestion_date = GETDATE()
WHERE ingestion_date IS NULL;

SELECT *
FROM draft_combine_stats

/* Creación de columna FechaIngesta en tabla jugadores_filtrados */
ALTER TABLE [dbo].[jugadores_filtrados]
ADD ingestion_date DATETIME DEFAULT GETDATE();

/* Actualizar las filas existentes con la fecha y hora actuales */
UPDATE jugadores_filtrados
SET ingestion_date = GETDATE()
WHERE ingestion_date IS NULL;

SELECT *
FROM jugadores_filtrados

/* Creación de columna FechaIngesta en tabla line_score */
ALTER TABLE [dbo].[line_score]
ADD ingestion_date DATETIME DEFAULT GETDATE();

/* Actualizar las filas existentes con la fecha y hora actuales */
UPDATE line_score
SET ingestion_date = GETDATE()
WHERE ingestion_date IS NULL;

SELECT *
FROM line_score

/* Creación de columna FechaIngesta en tabla miami_heat_equipo_completo */
ALTER TABLE [dbo].[miami_heat_equipo_completo]
ADD ingestion_date DATETIME DEFAULT GETDATE();

/* Actualizar las filas existentes con la fecha y hora actuales */
UPDATE miami_heat_equipo_completo
SET ingestion_date = GETDATE()
WHERE ingestion_date IS NULL;

SELECT *
FROM miami_heat_equipo_completo

/* Creación de columna FechaIngesta en tabla nba_equipos_completos */
ALTER TABLE [dbo].[nba_equipos_completos]
ADD ingestion_date DATETIME DEFAULT GETDATE();

/* Actualizar las filas existentes con la fecha y hora actuales */
UPDATE nba_equipos_completos
SET ingestion_date = GETDATE()
WHERE ingestion_date IS NULL;

SELECT *
FROM nba_equipos_completos

/* Creación de columna FechaIngesta en tabla salarios */
ALTER TABLE [dbo].[salarios]
ADD ingestion_date DATETIME DEFAULT GETDATE();

/* Actualizar las filas existentes con la fecha y hora actuales */
UPDATE salarios
SET ingestion_date = GETDATE()
WHERE ingestion_date IS NULL;

SELECT *
FROM salarios

/* Creación de columna FechaIngesta en tabla sueldos_jugadores */
ALTER TABLE [dbo].[sueldos_jugadores]
ADD ingestion_date DATETIME DEFAULT GETDATE();

/* Actualizar las filas existentes con la fecha y hora actuales */
UPDATE sueldos_jugadores
SET ingestion_date = GETDATE()
WHERE ingestion_date IS NULL;

SELECT *
FROM sueldos_jugadores
