use nbaplayers

select * from sueldos_jugadores

alter table sueldos_jugadores
drop column _2029_30


alter table sueldos_jugadores
drop column _2028_29

alter table sueldos_jugadores
drop column _2027_28

alter table sueldos_jugadores
drop column _2025_26

alter table sueldos_jugadores
drop column _2026_27

SELECT *
INTO salarios
FROM sueldos_jugadores;

select * from salarios


