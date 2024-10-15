use nbaplayers

select *from line_score

ALTER TABLE [dbo].[line_score]
DROP COLUMN game_sequence;

/* Eliminación de la columna pts_ot1_home debido a que tenía 96% vacío */
ALTER TABLE [dbo].[line_score]
DROP COLUMN pts_ot1_home;

/* Eliminación de la columna pts_ots2_home debido a que tenía 100% vacío */
ALTER TABLE [dbo].[line_score]
DROP COLUMN pts_ot2_home;

/* Eliminación de la columna pts_ots3_home debido a que tenía 100% vacío */
ALTER TABLE [dbo].[line_score]
DROP COLUMN pts_ot3_home;

/* Eliminación de la columna pts_ots4_home debido a que tenía 100% vacío */
ALTER TABLE [dbo].[line_score]
DROP COLUMN pts_ot4_home;

/* Eliminación de la columna pts_ots5_home debido a que tenía 100% vacío */
ALTER TABLE [dbo].[line_score]
DROP COLUMN pts_ot5_home;

/* Eliminación de la columna pts_ots6_home debido a que tenía 100% vacío */
ALTER TABLE [dbo].[line_score]
DROP COLUMN pts_ot6_home;

/* Eliminación de la columna pts_ots7_home debido a que tenía 100% vacío */
ALTER TABLE [dbo].[line_score]
DROP COLUMN pts_ot7_home;

/* Eliminación de la columna pts_ots8_home debido a que tenía 100% vacío */
ALTER TABLE [dbo].[line_score]
DROP COLUMN pts_ot8_home;

/* Eliminación de la columna pts_ots9_home debido a que tenía 100% vacío */
ALTER TABLE [dbo].[line_score]
DROP COLUMN pts_ot9_home;

/* Eliminación de la columna pts_ots10_home debido a que tenía 100% vacío */
ALTER TABLE [dbo].[line_score]
DROP COLUMN pts_ot10_home;

/* Eliminación de la columna pts_ot1_away debido a que tenía 96% vacío */
ALTER TABLE [dbo].[line_score]
DROP COLUMN pts_ot1_away;

/* Eliminación de la columna pts_ots2_away debido a que tenía 100% vacío */
ALTER TABLE [dbo].[line_score]
DROP COLUMN pts_ot2_away;

/* Eliminación de la columna pts_ots3_away debido a que tenía 100% vacío */
ALTER TABLE [dbo].[line_score]
DROP COLUMN pts_ot3_away;

/* Eliminación de la columna pts_ots4_away debido a que tenía 100% vacío */
ALTER TABLE [dbo].[line_score]
DROP COLUMN pts_ot4_away;

/* Eliminación de la columna pts_ots5_away debido a que tenía 100% vacío */
ALTER TABLE [dbo].[line_score]
DROP COLUMN pts_ot5_away;

/* Eliminación de la columna pts_ots6_away debido a que tenía 100% vacío */
ALTER TABLE [dbo].[line_score]
DROP COLUMN pts_ot6_away;

/* Eliminación de la columna pts_ots7_away debido a que tenía 100% vacío */
ALTER TABLE [dbo].[line_score]
DROP COLUMN pts_ot7_away;

/* Eliminación de la columna pts_ots8_away debido a que tenía 100% vacío */
ALTER TABLE [dbo].[line_score]
DROP COLUMN pts_ot8_away;

/* Eliminación de la columna pts_ots9_away debido a que tenía 100% vacío */
ALTER TABLE [dbo].[line_score]
DROP COLUMN pts_ot9_away;

/* Eliminación de la columna pts_ots10_away debido a que tenía 100% vacío */
ALTER TABLE [dbo].[line_score]
DROP COLUMN pts_ot10_away;

/* Primer filtrado por temporada, 2020 a 2023 */
SELECT *
FROM [dbo].[line_score]
WHERE game_date_est BETWEEN '2020-01-01' AND '2023-12-31'

/* Dividir la columna team_wins_losses_home en dos columnas separadas 
(una para las victorias y otra para las derrotas), se utiliza la función 
SUBSTRING junto con CHARINDEX para encontrar la posición del guión (-) 
y extraer las subcadenas correspondientes */
-- Primero, añade las nuevas columnas
ALTER TABLE [dbo].[line_score] 
ADD wins_home INT,
    losses_home INT;

-- Luego, actualiza la tabla con los valores correspondientes
UPDATE [dbo].[line_score]
SET wins_home = CAST(SUBSTRING(team_wins_losses_home, 1, CHARINDEX('-', team_wins_losses_home) - 1) AS INT),
    losses_home = CAST(SUBSTRING(team_wins_losses_home, CHARINDEX('-', team_wins_losses_home) + 1, LEN(team_wins_losses_home)) AS INT);

SELECT game_date_est, team_wins_losses_home, wins_home, losses_home
FROM [dbo].[line_score]
WHERE wins_home IS NOT NULL OR losses_home IS NOT NULL;

select * from line_score

