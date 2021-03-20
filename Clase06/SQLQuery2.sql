-- OPERADOR UNION
/*
Se utiliza para unir resultados.

SELECT ...
UNION
SELECT ...
UNION
SELECT ...

CONFICION
- Todas las consultas deben tener la misma cantidad de columnas.
- Debe existir compatibilidad entre las columnas aunir.
- El ORDER BY solo se puede aplicar al final
*/

USE EDUCA;
GO


SELECT 'CURSO' tipo, cur_nombre FROM ..CURSO
UNION
SELECT 'ALUMNO' tipo, alu_nombre FROM ..ALUMNO
order by 1
go

-- Ejercicio 2
-- De Rodrigo Gutarra Ricse para todos:  03:25 PM

-- De Rossmery Tolentino Huaroto para todos:  03:27 PM
SELECT 'ALUMNO'[CATEGORIA],NomAlumno from edutec.dbo.AlumnounionSELECT 'profesor'[CATEGORIA],NomProfesor from edutec.dbo.ProfesorORDER BY 1;
go




