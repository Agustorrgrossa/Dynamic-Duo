/* Creaci�n de la base de datos nba_db */
CREATE DATABASE nba_dbpf;

/* Especificar uso de la base de datos creada */
USE nba_dbpf

/* Revisi�n de la informaci�n que se encuentra en la tabla */
SELECT *
FROM [dbo].[line_score]

/* Eliminaci�n de la columna game_sequence debido a que ten�a 100% vac�o */
ALTER TABLE [dbo].[line_score]
DROP COLUMN game_sequence;

/* Eliminaci�n de la columna pts_ot1_home debido a que ten�a 96% vac�o */
ALTER TABLE [dbo].[line_score]
DROP COLUMN pts_ot1_home;

/* Eliminaci�n de la columna pts_ots2_home debido a que ten�a 100% vac�o */
ALTER TABLE [dbo].[line_score]
DROP COLUMN pts_ot2_home;

/* Eliminaci�n de la columna pts_ots3_home debido a que ten�a 100% vac�o */
ALTER TABLE [dbo].[line_score]
DROP COLUMN pts_ot3_home;

/* Eliminaci�n de la columna pts_ots4_home debido a que ten�a 100% vac�o */
ALTER TABLE [dbo].[line_score]
DROP COLUMN pts_ot4_home;

/* Eliminaci�n de la columna pts_ots5_home debido a que ten�a 100% vac�o */
ALTER TABLE [dbo].[line_score]
DROP COLUMN pts_ot5_home;

/* Eliminaci�n de la columna pts_ots6_home debido a que ten�a 100% vac�o */
ALTER TABLE [dbo].[line_score]
DROP COLUMN pts_ot6_home;

/* Eliminaci�n de la columna pts_ots7_home debido a que ten�a 100% vac�o */
ALTER TABLE [dbo].[line_score]
DROP COLUMN pts_ot7_home;

/* Eliminaci�n de la columna pts_ots8_home debido a que ten�a 100% vac�o */
ALTER TABLE [dbo].[line_score]
DROP COLUMN pts_ot8_home;

/* Eliminaci�n de la columna pts_ots9_home debido a que ten�a 100% vac�o */
ALTER TABLE [dbo].[line_score]
DROP COLUMN pts_ot9_home;

/* Eliminaci�n de la columna pts_ots10_home debido a que ten�a 100% vac�o */
ALTER TABLE [dbo].[line_score]
DROP COLUMN pts_ot10_home;

/* Eliminaci�n de la columna pts_ot1_away debido a que ten�a 96% vac�o */
ALTER TABLE [dbo].[line_score]
DROP COLUMN pts_ot1_away;

/* Eliminaci�n de la columna pts_ots2_away debido a que ten�a 100% vac�o */
ALTER TABLE [dbo].[line_score]
DROP COLUMN pts_ot2_away;

/* Eliminaci�n de la columna pts_ots3_away debido a que ten�a 100% vac�o */
ALTER TABLE [dbo].[line_score]
DROP COLUMN pts_ot3_away;

/* Eliminaci�n de la columna pts_ots4_away debido a que ten�a 100% vac�o */
ALTER TABLE [dbo].[line_score]
DROP COLUMN pts_ot4_away;

/* Eliminaci�n de la columna pts_ots5_away debido a que ten�a 100% vac�o */
ALTER TABLE [dbo].[line_score]
DROP COLUMN pts_ot5_away;

/* Eliminaci�n de la columna pts_ots6_away debido a que ten�a 100% vac�o */
ALTER TABLE [dbo].[line_score]
DROP COLUMN pts_ot6_away;

/* Eliminaci�n de la columna pts_ots7_away debido a que ten�a 100% vac�o */
ALTER TABLE [dbo].[line_score]
DROP COLUMN pts_ot7_away;

/* Eliminaci�n de la columna pts_ots8_away debido a que ten�a 100% vac�o */
ALTER TABLE [dbo].[line_score]
DROP COLUMN pts_ot8_away;

/* Eliminaci�n de la columna pts_ots9_away debido a que ten�a 100% vac�o */
ALTER TABLE [dbo].[line_score]
DROP COLUMN pts_ot9_away;

/* Eliminaci�n de la columna pts_ots10_away debido a que ten�a 100% vac�o */
ALTER TABLE [dbo].[line_score]
DROP COLUMN pts_ot10_away;

/* Primer filtrado por temporada, 2020 a 2023 */
SELECT *
FROM [dbo].[line_score]
WHERE game_date_est BETWEEN '2020-01-01' AND '2023-12-31'

/* Dividir la columna team_wins_losses_home en dos columnas separadas 
(una para las victorias y otra para las derrotas), se utiliza la funci�n 
SUBSTRING junto con CHARINDEX para encontrar la posici�n del gui�n (-) 
y extraer las subcadenas correspondientes */
SELECT
    SUBSTRING(team_wins_losses_home, 1, CHARINDEX('-', team_wins_losses_home) - 1) AS wins_home,
    SUBSTRING(team_wins_losses_home, CHARINDEX('-', team_wins_losses_home) + 1, LEN(team_wins_losses_home)) AS losses_home
FROM
    [dbo].[line_score];

/* Incorporarlas a la tabla principal las dos nuevas columnas */
ALTER TABLE [dbo].[line_score] 
ADD wins_home INT,
    losses_home INT;

UPDATE [dbo].[line_score]


