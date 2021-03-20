-- SUBCONSULTAS
-- ==============================================
/*

CONSULTA
---------

   - SELECT
   - INSERT
   - UPDATE
   - DELETE


SUBCONSULTA
------------

    Sentencia SELECT, que se utiliza dentro de una consulta.
	Siempre esta entre parentesis.

*/

-- SUBCONSULTAS QUE RETORNAN UN VALOR
-- Se tratan como un valor escalar

select * 
from rh..empleado
where sueldo < (select avg(sueldo) from rh..empleado);
go


-- SUBCONSULTAS QUE RETORNAN UN CONJUNTO DE VALORES
-- Su resultado puede ser tratado como un conjunto
-- La subconsulta debe retornar una sola columna
/*

	WHERE <columna> [NOT] IN ( <subconsulta> )

*/

select * from edutec..Curso
where IdCurso in (select IdCurso from edutec..CursoProgramado 
					where IdCiclo = '2021-03')
order by 1;
go

-- SUBCONSULTAS COMO TABLAS DERIVADAS
/*

	SELECT .. 
	FROM TABLA
	JOIN ( <subconsulta> ) AS TD

*/

select C.* 
from edutec..Curso C
join (select distinct IdCurso from edutec..CursoProgramado 
	  where IdCiclo = '2021-03') as td
on C.IdCurso = td.IdCurso
order by 1;
go


-- SUBCONSULTAS CORRELACIONADAS
-- Utilizan columnas de la consulta externa
-- Pueden afectar el redimiento de la consulta general


select * from edutec..Curso C
where (	select count(1) 
		from edutec..CursoProgramado CP 
		where CP.IdCiclo = '2021-03'
		and CP.IdCurso = C.IdCurso   ) > 0
order by 1;
go


-- USO DE EXISTS Y NOT EXISTS

select * from edutec..Curso C
where EXISTS ( select 1
		from edutec..CursoProgramado CP 
		where CP.IdCiclo = '2021-03'
		and CP.IdCurso = C.IdCurso )
order by 1;
go


-- INSERCIÓN DE FILAS CON SUBCONSULTA

USE RH;
GO

INSERT INTO EMP_AUX 
SELECT * FROM EMPLEADO;
GO


SELECT * FROM EMP_AUX ;
GO


