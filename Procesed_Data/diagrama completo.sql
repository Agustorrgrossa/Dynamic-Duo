use nbaplayers

--EQUIPOS COMPLETOS Y JUGADORES FILTRADOS--
ALTER TABLE nba_equipos_completos
ADD CONSTRAINT PK_nba_equipos_completos PRIMARY KEY (id_nec);

ALTER TABLE jugadores_filtrados
ADD CONSTRAINT PK_jugadores_filtrados PRIMARY KEY (id_jf);


ALTER TABLE jugadores_filtrados
ADD CONSTRAINT FK_jugadores_filtrados_id_nec
FOREIGN KEY (id_player)
REFERENCES nba_equipos_completos(id_nec);

--LINE SCORE Y NBA STATS--

SELECT ID_ls
FROM line_score
Where ID_ls NOT IN (SELECT ID_ns FROM nba_stats);

DELETE FROM line_score
WHERE TEAM_ID NOT IN (SELECT ID_ns FROM nba_stats);



ALTER TABLE line_score
ADD CONSTRAINT FK_line_score_nba_stats
FOREIGN KEY (TEAM_ID)
REFERENCES nba_stats(ID_ns);

--SALARIOS Y COMMON PLAYER INFO--

SELECT ID_s
FROM salarios
Where ID_s NOT IN (SELECT ID_player FROM common_player_info);

DELETE FROM salarios
WHERE ID_player NOT IN (SELECT ID_player FROM common_player_info);

ALTER TABLE common_player_info
ADD CONSTRAINT PK_common_player_info PRIMARY KEY (ID_player);

ALTER TABLE salarios
ADD CONSTRAINT FK_salarios_common_player_info
FOREIGN KEY (ID_player)
REFERENCES common_player_info(ID_player);

--COMMON PLAYER INFO Y NBA EQUIPOS COMPLETOS--
---sirve--
SELECT ID_player 
FROM common_player_info 
WHERE ID_player NOT IN (SELECT ID_nec FROM nba_equipos_completos);

DELETE FROM salarios
WHERE ID_player NOT IN (SELECT ID_nec FROM nba_equipos_completos);

DELETE FROM common_player_info
WHERE ID_player NOT IN (SELECT ID_nec FROM nba_equipos_completos);

ALTER TABLE salarios
ADD CONSTRAINT FK_salarios_common_player_info
FOREIGN KEY (ID_player)
REFERENCES common_player_info(ID_player);

ALTER TABLE common_player_info
ADD CONSTRAINT FK_common_player_info_nba_equipos_completos
FOREIGN KEY (ID_player)
REFERENCES nba_equipos_completos(ID_nec);
----------------------

--common player info y nba stats--

SELECT ID_ns 
FROM nba_stats 
WHERE ID_ns NOT IN (SELECT ID_player FROM common_player_info);

DELETE FROM nba_stats
WHERE ID_ns NOT IN (SELECT ID_player FROM common_player_info);

ALTER TABLE nba_stats
ADD CONSTRAINT FK_nba_stats_common_player_info
FOREIGN KEY (ID_ns)
REFERENCES common_player_info(ID_player);

--SALARIOS Y sueldos jugadores --

DELETE FROM salarios
WHERE ID_player NOT IN (SELECT ID_sj FROM sueldos_jugadores);

ALTER TABLE sueldos_jugadores
ADD CONSTRAINT PK_sueldos_jugadores PRIMARY KEY (ID_sj);

ALTER TABLE salarios
ADD CONSTRAINT FK_salarios_sueldos_jugadores
FOREIGN KEY (ID_player)
REFERENCES sueldos_jugadores (ID_sj);

-- common player info y draft combine stats--

SELECT ID_dcs 
FROM draft_combine_stats 
WHERE ID_dcs NOT IN (SELECT ID_player FROM common_player_info);

DELETE FROM draft_combine_stats
WHERE ID_dcs NOT IN (SELECT ID_player FROM common_player_info);

DELETE FROM common_player_info
WHERE ID_player NOT IN (SELECT ID_dcs FROM draft_combine_stats);

ALTER TABLE draft_combine_stats
ADD CONSTRAINT FK_draft_combine_stats_common_player_info
FOREIGN KEY (ID_dcs)
REFERENCES common_player_info(ID_player);

--miami heat equipo completo y common player info--

SELECT ID_mhec
FROM miami_heat_equipo_completo
WHERE ID_mhec NOT IN (SELECT ID_player FROM common_player_info);

DELETE FROM miami_heat_equipo_completo
WHERE ID_mhec NOT IN (SELECT ID_player FROM common_player_info);

ALTER TABLE miami_heat_equipo_completo
ADD CONSTRAINT FK_miami_heat_equipo_completo_common_player_info
FOREIGN KEY (ID_mhec)
REFERENCES common_player_info(ID_player);






























