use nbaplayers

select * from common_player_info

ALTER TABLE common_player_info
DROP COLUMN first_name;
GO

ALTER TABLE common_player_info
DROP COLUMN last_name;
GO

ALTER TABLE common_player_info
DROP COLUMN display_last_comma_first;
GO

ALTER TABLE common_player_info
DROP COLUMN display_fi_last;
GO

ALTER TABLE common_player_info
DROP COLUMN player_slug;
GO

select * from common_player_info

SELECT *
FROM common_player_info
WHERE from_year >= 2020;

SELECT *
INTO jugadores_filtrados
FROM common_player_info
WHERE From_year >= 20200;

SELECT *
FROM jugadores_filtrados;

SELECT *
INTO jugadores_sin_equipo
FROM common_player_info
WHERE team_id = 0;

SELECT *
FROM jugadores_sin_equipo;

DELETE FROM jugadores_filtrados
WHERE team_id = 0;
 
 select * from jugadores_filtrados

 ALTER TABLE jugadores_filtrados
DROP COLUMN games_played_current_season_flag;
GO

SELECT DATA_TYPE 
FROM INFORMATION_SCHEMA.COLUMNS 
WHERE TABLE_NAME = 'jugadores_filtrados' 
AND COLUMN_NAME = 'birthdate';

ALTER TABLE jugadores_filtrados
ALTER COLUMN birthdate DATE;

UPDATE jugadores_filtrados
SET to_year = LEFT(CAST(to_year AS VARCHAR(5)), 4)
WHERE LEN(CAST(to_year AS VARCHAR(5))) > 4;

 select * from jugadores_filtrados

 UPDATE jugadores_filtrados
SET from_year = LEFT(CAST(from_year AS VARCHAR(5)), 4)
WHERE LEN(CAST(from_year AS VARCHAR(5))) > 4;

ALTER TABLE jugadores_filtrados
DROP COLUMN dleague_flag;
GO

ALTER TABLE jugadores_filtrados
DROP COLUMN nba_flag;
GO

ALTER TABLE jugadores_filtrados
DROP COLUMN games_played_flag;
GO

select * from jugadores_filtrados

ALTER TABLE jugadores_filtrados
DROP COLUMN greatest_75_flag;
GO

