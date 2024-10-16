
/* Usamos la BD del servidor */
USE nbaplayers

/* Revisamos el contenido de la tabla common_player_info */
SELECT *
FROM [dbo].[common_player_info]

/* Creamos una nueva columna en la tabla common_player_info denominada ID_Player IDENTITY(1,1) */
ALTER TABLE [dbo].[common_player_info]
ADD ID_Player int IDENTITY(1,1);

/* Eliminación de columna person_id en la tabla common_player_info */
ALTER TABLE [dbo].[common_player_info]
DROP COLUMN person_id

/* Creamos una nueva columna en la tabla nba_equipos_completos denominada ID_Player */
ALTER TABLE [dbo].[nba_equipos_completos]
ADD ID_player INT;

/* Confirmamos la creación de la columna en la tabla */
SELECT *
FROM [dbo].[nba_equipos_completos]

/* Hacemos un JOIN que relacione el nombre con el ID_player generado en la tabla common_player_info
y actualizamos esta información en la tabla nba_equipos_completos */
UPDATE nec
SET nec.ID_player = cpi.ID_player
FROM nba_equipos_completos nec
INNER JOIN common_player_info cpi ON nec.Jugador = cpi.display_first_last;

/* 19 jugadores no encontraron MATCH en la tabla common_player_info por lo que 
se les asignó un ID_player */
UPDATE nba_equipos_completos
SET ID_player = CASE 
    WHEN Jugador = 'Tyler Herro' THEN 4172
    WHEN Jugador = 'Brook Lopez' THEN 4173
	WHEN Jugador = 'Serge Ibaka' THEN 4174
	WHEN Jugador = 'Tyrese Maxey' THEN 4175
	WHEN Jugador = 'Ricky Rubio' THEN 4176
	WHEN Jugador = 'Julius Randle' THEN 4177
	WHEN Jugador = 'Josh Hart' THEN 4178
	WHEN Jugador = 'Dorian Finney-Smith' THEN 4179
	WHEN Jugador = 'Michael Porter Jr.' THEN 4181
	WHEN Jugador = 'Robert Williams' THEN 4182
	WHEN Jugador = 'Malcolm Brogdon' THEN 4183
	WHEN Jugador = 'Kevin Huerter' THEN 4184
	WHEN Jugador = 'Trey Lyles' THEN 4185
	WHEN Jugador = 'Jonathan Kuminga' THEN 4186
	WHEN Jugador = 'Jaden McDaniels' THEN 4187
	WHEN Jugador = 'Taurean Prince' THEN 4188
	WHEN Jugador = 'Isaiah Joe' THEN 4189
	WHEN Jugador = 'Kenrich Williams' THEN 4190
	ELSE ID_player  -- Mantén el ID actual si ya existe
END
WHERE ID_player IS NULL;

/* Se asignó el ID_player a esta jugador cuyo nombre tiene un apóstrofe y generaba conflicto
en el proceso anterior */
UPDATE nba_equipos_completos
SET ID_player = 4180
WHERE Jugador = 'Day''Ron Sharpe';

/* Revisamos el contenido de la tabla draft_combine_stats */
SELECT *
FROM [dbo].[draft_combine_stats]

/* Modificación del nombre de columna */
EXEC sp_rename 'draft_combine_stats.player_id', 'ID_player', 'COLUMN';

/* Relacionar las tablas basadas en el nombre del jugador */
UPDATE dcs
SET dcs.ID_player = cpi.ID_player
FROM draft_combine_stats dcs
INNER JOIN common_player_info cpi ON dcs.player_name = cpi.display_first_last;

/* 21 jugadores no encontraron MATCH en la tabla common_player_info por lo que 
se les asignó un ID_player */
UPDATE draft_combine_stats
SET ID_player = CASE 
    WHEN player_name = 'Yoeli Childs' THEN 4191
	WHEN player_name = 'Kaleb Wesson' THEN 4192
	WHEN player_name = 'Kahlil Whitney' THEN 4193
	WHEN player_name = 'Hugo Besson' THEN 4194
	WHEN player_name = 'Ousmane Dieng' THEN 4195
	WHEN player_name = 'Khalifa Diop' THEN 4196
	WHEN player_name = 'Ismael Kamagate' THEN 4197
	WHEN player_name = 'Aminu Mohammed' THEN 4198
	WHEN player_name = 'Iverson Molinar' THEN 4199
	WHEN player_name = 'Terquavion Smith' THEN 4200
	WHEN player_name = 'Bryson Williams' THEN 4201
	WHEN player_name = 'Fanbo Zeng' THEN 4202
	WHEN player_name = 'Emoni Bates' THEN 4203
	WHEN player_name = 'Toumani Camara' THEN 4204
	WHEN player_name = 'Bilal Coulibaly' THEN 4205
	WHEN player_name = 'Mojave King' THEN 4206
	WHEN player_name = 'Terquavion Smith' THEN 4207
	WHEN player_name = 'Amen Thompson' THEN 4208
	WHEN player_name = 'Ausar Thompson' THEN 4209
	WHEN player_name = 'Azuolas Tubelis' THEN 4210
	WHEN player_name = 'Cason Wallace' THEN 4211
    ELSE ID_player  -- Mantén el ID actual si ya existe
END

/* Revisamos el contenido de la tabla miami_heat_equipo_completo */
SELECT *
FROM [dbo].[miami_heat_equipo_completo]

/* Creamos una nueva columna en la tabla miami_heat_equipo_completo denominada ID_Player */
ALTER TABLE [dbo].[miami_heat_equipo_completo]
ADD ID_player INT;

/* Relacionar las tablas basadas en el nombre del jugador */
UPDATE mhec
SET mhec.ID_player = cpi.ID_player
FROM miami_heat_equipo_completo mhec
INNER JOIN common_player_info cpi ON mhec.Jugador = cpi.display_first_last;

/* Actualización de ID_player de Tyler Herro */
UPDATE miami_heat_equipo_completo
SET ID_player = CASE 
    WHEN Jugador = 'Tyler Herro' THEN 4172
	ELSE ID_player  -- Mantén el ID actual si ya existe
END

/* Revisamos el contenido de la tabla nba_stats */
SELECT *
FROM [dbo].[nba_stats]

/* Modificación del nombre de columna */
EXEC sp_rename 'nba_stats.PLAYER_ID', 'ID_player', 'COLUMN';

/* Relacionar las tablas basadas en el nombre del jugador */
UPDATE ns
SET ns.ID_player = cpi.ID_player
FROM nba_stats ns
INNER JOIN common_player_info cpi ON ns.PLAYER_NAME = cpi.display_first_last;

UPDATE ns
SET ns.ID_player = nec.ID_player
FROM nba_stats ns
INNER JOIN nba_equipos_completos nec ON ns.PLAYER_NAME = nec.Jugador;

/* 98 jugadores no encontraron MATCH en la tabla common_player_info ni nba_equipos_completos
por lo que  se les asignó un ID_player */
UPDATE nba_stats
SET ID_player = CASE 
    WHEN player_name = 'Alex Fudge' THEN 4212
	WHEN player_name = 'Amir Coffey' THEN 4213
	WHEN player_name = 'Andrew Funk' THEN 4214
	WHEN player_name = 'Boban Marjanović' THEN 4215
	WHEN player_name = 'Bogdan Bogdanović' THEN 4216
	WHEN player_name = 'Bojan Bogdanović' THEN 4217
	WHEN player_name = 'CJ McCollum' THEN 4218
	WHEN player_name = 'Chuma Okeke' THEN 4219
	WHEN player_name = 'Colin Castleton' THEN 4220
	WHEN player_name = 'Collin Sexton' THEN 4221
	WHEN player_name = 'Craig Porter Jr.' THEN 4222
	WHEN player_name = 'D.J. Carton' THEN 4224
	WHEN player_name = 'Danté Exum' THEN 4225
	WHEN player_name = 'Dario Šarić' THEN 4226
	WHEN player_name = 'Deni Avdija' THEN 4227
	WHEN player_name = 'Dennis Schröder' THEN 4228
	WHEN player_name = 'Dereck Lively II' THEN 4229
	WHEN player_name = 'Derrick Rose' THEN 4230
	WHEN player_name = 'Devin Vassell' THEN 4231
	WHEN player_name = 'Dexter Dennis' THEN 4232
	WHEN player_name = 'Dmytro Skapintsev' THEN 4233
	WHEN player_name = 'Drew Peterson' THEN 4234
	WHEN player_name = 'Dru Smith' THEN 4235
	WHEN player_name = 'Duop Reath' THEN 4236
	WHEN player_name = 'Dwight Powell' THEN 4237
	WHEN player_name = 'Filip Petrusev' THEN 4238
	WHEN player_name = 'Franz Wagner' THEN 4239
	WHEN player_name = 'Fred VanVleet' THEN 4240
	WHEN player_name = 'Gary Trent Jr.' THEN 4241
	WHEN player_name = 'Gui Santos' THEN 4242
	WHEN player_name = 'Henri Drell' THEN 4243
	WHEN player_name = 'Hunter Tyson' THEN 4244
	WHEN player_name = 'Ibou Badji' THEN 4245
	WHEN player_name = 'Ish Smith' THEN 4246
	WHEN player_name = 'Izaiah Brockington' THEN 4247
	WHEN player_name = 'JaVale McGee' THEN 4248
	WHEN player_name = 'Jacob Gilyard' THEN 4249
	WHEN player_name = 'Jacob Toppin' THEN 4250
	WHEN player_name = 'Jakob Pöltl' THEN 4251
	WHEN player_name = 'James Bouknight' THEN 4252
	WHEN player_name = 'Javon Freeman-Liberty' THEN 4253
	WHEN player_name = 'Jerami Grant' THEN 4254
	WHEN player_name = 'Jermaine Samuels Jr.' THEN 4255
	WHEN player_name = 'Jerome Robinson' THEN 4256
	WHEN player_name = 'Jonas Valančiūnas' THEN 4257
	WHEN player_name = 'Jordan Ford' THEN 42508
	WHEN player_name = 'Justin Jackson' THEN 4259
	WHEN player_name = 'Justin Minaya' THEN 4260
	WHEN player_name = 'Jusuf Nurkić' THEN 4261
	WHEN player_name = 'KJ Martin' THEN 4262
	WHEN player_name = 'Kaiser Gates' THEN 4263
	WHEN player_name = 'Keita Bates-Diop' THEN 4264
	WHEN player_name = 'Keldon Johnson' THEN 4265
	WHEN player_name = 'Kessler Edwards' THEN 4266
	WHEN player_name = 'Kira Lewis Jr.' THEN 4267
	WHEN player_name = 'Kobi Simmons' THEN 4268
	WHEN player_name = 'Kristaps Porziņģis' THEN 4269
	WHEN player_name = 'Leaky Black' THEN 4270
	WHEN player_name = 'Luka Dončić' THEN 4271
	WHEN player_name = 'Luka Garza' THEN 4272
	WHEN player_name = 'Luke Kornet' THEN 4273
	WHEN player_name = 'Malachi Flynn' THEN 4274
	WHEN player_name = 'Malcolm Cazalon' THEN 4275
	WHEN player_name = 'Malik Williams' THEN 4276
	WHEN player_name = 'Marcus Morris Sr.' THEN 4277
	WHEN player_name = 'Markquis Nowell' THEN 4278
	WHEN player_name = 'Matt Hurt' THEN 4279
	WHEN player_name = 'Matt Ryan' THEN 4280
	WHEN player_name = 'Mo Bamba' THEN 4281
	WHEN player_name = 'Monté Morris' THEN 4282
	WHEN player_name = 'Moritz Wagner' THEN 4283
	WHEN player_name = 'Moussa Diabaté' THEN 4284
	WHEN player_name = 'Mãozinha Pereira' THEN 4285
	WHEN player_name = 'Nate Hinton' THEN 4286
	WHEN player_name = 'Nathan Mensah' THEN 4287
	WHEN player_name = 'Nikola Jokić' THEN 4288
	WHEN player_name = 'Nikola Jović' THEN 4289
	WHEN player_name = 'Nikola Vučević' THEN 4290
	WHEN player_name = 'OG Anunoby' THEN 4291
	WHEN player_name = 'Onuralp Bitim' THEN 4292
	WHEN player_name = 'P.J. Washington' THEN 4293
	WHEN player_name = 'Patty Mills' THEN 4294
	WHEN player_name = 'Paul George' THEN 4295
	WHEN player_name = 'Paul Reed' THEN 4296
	WHEN player_name = 'Pete Nance' THEN 4297
	WHEN player_name = 'Quenton Jackson' THEN 4298
	WHEN player_name = 'Reggie Bullock Jr.' THEN 4299
	WHEN player_name = 'Russell Westbrook' THEN 4300
	WHEN player_name = 'Sasha Vezenkov' THEN 4301
	WHEN player_name = 'Tazé Moore' THEN 4302
	WHEN player_name = 'Timmy Allen' THEN 4303
	WHEN player_name = 'Tosan Evbuomwan' THEN 4304
	WHEN player_name = 'Trendon Watford' THEN 4305
	WHEN player_name = 'Trey Jemison' THEN 4306
	WHEN player_name = 'Vasilije Micić' THEN 4307
	WHEN player_name = 'Vít Krejčí' THEN 4308
	WHEN player_name = 'Yuta Watanabe' THEN 4309
	WHEN player_name = 'Zavier Simpson' THEN 4310
	ELSE ID_player  -- Mantén el ID actual si ya existe
END

/* Se asignó el ID_player a esta jugador cuyo nombre tiene un apóstrofe y generaba conflicto
en el proceso anterior */
UPDATE nba_stats
SET ID_player = 4223
WHERE player_name = 'D''Moi Hodge'; 

/* Revisamos el contenido de la tabla salarios */
SELECT *
FROM [dbo].[salarios]

/* Modificación del nombre de columna */
EXEC sp_rename 'salarios.ID_Player', 'ID_player', 'COLUMN';

/* Relacionar las tablas basadas en el nombre del jugador */
UPDATE s
SET s.ID_player = cpi.ID_player
FROM salarios s
INNER JOIN common_player_info cpi ON s.Player = cpi.display_first_last;

UPDATE s
SET s.ID_player = nec.ID_player
FROM salarios s
INNER JOIN nba_equipos_completos nec ON s.Player = nec.Jugador;

UPDATE s
SET s.ID_player = ns.ID_player
FROM salarios s
INNER JOIN nba_stats ns ON s.Player = ns.PLAYER_NAME;

UPDATE s
SET s.ID_player = dcs.ID_player
FROM salarios s
INNER JOIN draft_combine_stats dcs ON s.Player = dcs.player_name;

UPDATE s
SET s.ID_player = mhec.ID_player
FROM salarios s
INNER JOIN miami_heat_equipo_completo mhec ON s.Player = mhec.Jugador;

/* Revisamos el contenido de la tabla jugadores_filtrados */
SELECT *
FROM [dbo].[jugadores_filtrados]

/* Modificación del nombre de columna */
EXEC sp_rename 'jugadores_filtrados.person_id', 'ID_player', 'COLUMN';

/* Relacionar las tablas basadas en el nombre del jugador */
UPDATE jf
SET jf.ID_player = cpi.ID_player
FROM jugadores_filtrados jf
INNER JOIN common_player_info cpi ON jf.display_first_last = cpi.display_first_last;

/* Creamos una nueva columna en la tabla jugadores_filtrados denominada ID_jf IDENTITY(1,1) */
ALTER TABLE [dbo].[jugadores_filtrados]
ADD ID_jf int IDENTITY(1,1);

SELECT *
FROM jugadores_filtrados

/* Creamos una nueva columna en la tabla nba_equipos_completos denominada ID_nec IDENTITY(1,1) */
ALTER TABLE [dbo].[nba_equipos_completos]
ADD ID_nec int IDENTITY(1,1);

SELECT *
FROM nba_equipos_completos

/* Creamos una nueva columna en la tabla draft_combine_stats denominada ID_dcs IDENTITY(1,1) */
ALTER TABLE [dbo].[draft_combine_stats]
ADD ID_dcs int IDENTITY(1,1);

SELECT *
FROM draft_combine_stats

/* Creamos una nueva columna en la tabla miami_heat_equipo_completo denominada ID_mhec IDENTITY(1,1) */
ALTER TABLE [dbo].[miami_heat_equipo_completo]
ADD ID_mhec int IDENTITY(1,1);

SELECT *
FROM miami_heat_equipo_completo

/* Creamos una nueva columna en la tabla nba_stats denominada ID_ns IDENTITY(1,1) */
ALTER TABLE [dbo].[nba_stats]
ADD ID_ns int IDENTITY(1,1);

SELECT *
FROM nba_stats

/* Creamos una nueva columna en la tabla salarios denominada ID_s IDENTITY(1,1) */
ALTER TABLE [dbo].[salarios]
ADD ID_s int IDENTITY(1,1);

SELECT *
FROM salarios

/* Creamos una nueva columna en la tabla salarios denominada ID_ls IDENTITY(1,1) */
ALTER TABLE [dbo].[line_score]
ADD ID_ls int IDENTITY(1,1);

SELECT *
FROM line_score

/* Creamos una nueva columna en la tabla sueldos_jugadores ID_sj IDENTITY(1,1) */
ALTER TABLE [dbo].[sueldos_jugadores]
ADD ID_sj int IDENTITY(1,1);

SELECT *
FROM sueldos_jugadores
