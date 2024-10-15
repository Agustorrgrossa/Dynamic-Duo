use nbaplayers

USE nbaplayers;

-- Selecci�n inicial
SELECT * FROM draft_combine_stats;

-- Eliminaci�n de bench press
ALTER TABLE draft_combine_stats
DROP COLUMN bench_press;

-- Tabla de referencia para posiciones en ingl�s
CREATE TABLE PositionReference (
    Abbreviation NVARCHAR(5),
    FullName NVARCHAR(50)
);

INSERT INTO PositionReference (Abbreviation, FullName) VALUES
('PG', 'Point Guard'),
('SG', 'Shooting Guard'),
('SF', 'Small Forward'),
('PF', 'Power Forward'),
('C', 'Center');

SELECT dcs.position, pr.Abbreviation
FROM draft_combine_stats dcs
LEFT JOIN PositionReference pr ON dcs.position = pr.Abbreviation
WHERE pr.Abbreviation IS NULL;

SELECT dcs.position
FROM draft_combine_stats dcs
LEFT JOIN PositionReference pr ON dcs.position = pr.Abbreviation
WHERE pr.Abbreviation IS NULL
GROUP BY dcs.position;

UPDATE draft_combine_stats
SET position = TRIM(UPPER(position));

-- Actualizaci�n de la tabla principal con posiciones en ingl�s
UPDATE draft_combine_stats
SET position = pr.FullName
FROM draft_combine_stats dcs
JOIN PositionReference pr ON dcs.position = pr.Abbreviation;


SELECT * FROM draft_combine_stats;

-- Tabla de referencia para posiciones en espa�ol
CREATE TABLE PositionReferenceespa�ol (
    Abbreviation NVARCHAR(5),
    FullName NVARCHAR(50)
);

INSERT INTO PositionReferenceespa�ol (Abbreviation, FullName) VALUES
('PG', 'Base'),
('SG', 'Escolta'),
('SF', 'Alero'),
('PF', 'Ala-P�vot'),
('C', 'P�vot');

-- Actualizaci�n de la tabla principal con posiciones en espa�ol
UPDATE draft_combine_stats
SET position = pr.FullName
FROM draft_combine_stats dcs
JOIN PositionReferenceespa�ol pr ON dcs.position = pr.Abbreviation;

SELECT * FROM draft_combine_stats;

-- Borrado de columnas first_name y last_name
ALTER TABLE draft_combine_stats
DROP COLUMN first_name, last_name;

SELECT * FROM draft_combine_stats;


update draft_combine_stats
set body_fat_pct = ROUND (body_fat_pct,2);

update draft_combine_stats 
set height_w_shoes = round (height_w_shoes,2),
	weight = ROUND (weight,2);

update draft_combine_stats
set lane_agility_time = round (lane_agility_time,2),
	modified_lane_agility_time = round (modified_lane_agility_time,2),
	three_quarter_sprint = round (three_quarter_sprint,2);


SELECT *
FROM draft_combine_stats
WHERE season >= 2020;

DELETE FROM draft_combine_stats
WHERE season < 2020;

SELECT *
FROM draft_combine_stats

