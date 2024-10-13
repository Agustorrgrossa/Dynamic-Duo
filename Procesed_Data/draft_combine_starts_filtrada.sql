USE nba_dbpf

select * 
from draft_combine_stats

------------
--se elimina bench press

ALTER TABLE draft_combine_stats
DROP COLUMN bench_press;

---tabla de referencia
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

---actualizacion tabla principal
UPDATE draft_combine_stats
SET position = pr.FullName
FROM draft_combine_stats dcs
JOIN PositionReference pr ON dcs.position = pr.Abbreviation;

SELECT * FROM draft_combine_stats;

--posiciones en español
CREATE TABLE PositionReferenceespañol (
    Abbreviation NVARCHAR(5),
    FullName NVARCHAR(50)
);

INSERT INTO PositionReference (Abbreviation, FullName) VALUES
('PG', 'Base'),
('SG', 'Escolta'),
('SF', 'Alero'),
('PF', 'Ala-Pívot'),
('C', 'Pívot');

UPDATE draft_combine_stats
SET position = pr.FullName
FROM draft_combine_stats dcs
JOIN PositionReference pr ON dcs.position = pr.Abbreviation;

SELECT * FROM draft_combine_stats;

--borrada de columnas first y last name

ALTER TABLE draft_combine_stats
DROP COLUMN first_name, last_name;

SELECT * FROM draft_combine_stats;
--dos decimales

update draft_combine_stats
set porcentaje_grasa_corporal = ROUND (porcentaje_grasa_corporal,2);

update draft_combine_stats 
set altura_con_zapatillas = round (altura_con_zapatillas,2),
	peso = ROUND (peso,2);

update draft_combine_stats
set tiempo_agilidad_pista = round (tiempo_agilidad_pista,2),
	tiempo_agilidad_pista_modificado = round (tiempo_agilidad_pista_modificado,2),
	carrera_tres_cuartos = round (carrera_tres_cuartos,2);







	






