-- TOP (expression) [PERCENT] [ WITH TIES]
/*

	TOP 1: Solo muestra el primero de la consulta

	TOP 5: Muestra los 5 primeros de la consulta

	TOP 1 PERCENT: Muestra los primeros 1% de la consulta

	TOP 5 PERCENT: Muestra los primeros 5% de la consulta

	WITH TIES: Se utiliza cuando se quiere mostrar los empates.

*/


select top 2 * 
from edutec..CursoProgramado 
where IdCiclo = '2021-03'
order by matriculados desc;
go

select top 2 WITH TIES * 
from edutec..CursoProgramado 
where IdCiclo = '2021-03'
order by matriculados desc;
go


-- Ejercicio 3



-- Ejercicio 4

-- De Rodrigo Gutarra Ricse para todos:  03:41 PM

SELECT TOP 1 WITH TIES A.alu_id [Código], A.alu_nombre [Nombre], M.mat_nota [Nota]FROM EDUCA..MATRICULA MJOIN EDUCA..ALUMNO A ON A.alu_id = M.alu_idORDER BY 3;GO


-- DISTINCT
-- Para no mostrar los datos duplicados


select distinct ciudad
from rh..ubicacion;
go


select count( distinct mat_precio) cuenta
from educa..MATRICULA;
go

select count(distinct ciudad) cant_ciudades
from rh..ubicacion;
go



-- CASE
/*

COD_CURSO   NOM_CURSO   ENE   FEB   MAR   ABR .... DIC TOTAL
--------------------------------------------------------------
C01         Aaaa        40    30    20    50       20  289

----------------------------------------------------------------
*/

select 
	c.IdCurso  COD_CURSO,
	c.NomCurso NOMB_CURSO,
	sum(iif( RIGHT(idCiclo,2) = '01', cp.Matriculados, 0)) ENE,
	sum(iif( RIGHT(idCiclo,2) = '02', cp.Matriculados, 0)) FEB,
	sum(iif( RIGHT(idCiclo,2) = '03', cp.Matriculados, 0)) MAR,
	sum(iif( RIGHT(idCiclo,2) = '04', cp.Matriculados, 0)) ABR,
	sum(iif( RIGHT(idCiclo,2) = '05', cp.Matriculados, 0)) MAY,
	sum(iif( RIGHT(idCiclo,2) = '06', cp.Matriculados, 0)) JUN,
	sum(iif( RIGHT(idCiclo,2) = '07', cp.Matriculados, 0)) JUL,
	sum(iif( RIGHT(idCiclo,2) = '08', cp.Matriculados, 0)) AGO,
	sum(iif( RIGHT(idCiclo,2) = '09', cp.Matriculados, 0)) SEP,
	sum(iif( RIGHT(idCiclo,2) = '10', cp.Matriculados, 0)) OCT,
	sum(iif( RIGHT(idCiclo,2) = '11', cp.Matriculados, 0)) NOV,
	sum(iif( RIGHT(idCiclo,2) = '12', cp.Matriculados, 0)) DIC,
	SUM(cp.Matriculados) TOTAL_MAT
from EduTec..CursoProgramado cp
join EduTec..Curso c on cp.IdCurso = c.IdCurso
where cp.idCiclo like '2020%'
group by c.IdCurso,	c.NomCurso;
go





