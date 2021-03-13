-- FILTRO DE FILAS

-- Ejemplo 1

select * 
from rh.dbo.empleado
where sueldo < 2500;
go

-- Ejemplo 2

select * 
from edutec.dbo.CursoProgramado
where IdProfesor = 'P007'and IdCiclo = '2021-03';
go

select count(1) from edutec.dbo.CursoProgramado;
go

select count(1) from edutec.dbo.Matricula;
go


-- De Rossmery Tolentino para todos:  04:51 PM
-- Ejercicio 9
select *

-- De Elena Del Castillo para todos:  04:51 PM
-- Ejercicio 9
select * from rh.dbo.empleado 
where iddepartamento = 101;
go


-- De Francesca Flores para todos:  04:52 PM
-- Ejercicio 10
SELECT *

-- De Mariam Ipanaqu� para todos:  04:54 PM
-- Ejercicio 9
select Idempleado from rh.dbo.empleado 
-- Ejercicio 10: 



-- OPERADORES LOGICOS
-- AND, OR y NOT


-- Ejemplo

SELECT *
FROM RH.DBO.empleado
WHERE iddepartamento = 100  OR  iddepartamento = 105;
GO

-- De Mariam Ipanaqu� para todos:  05:07 PM
-- Ejercicio 12: 


-- De Rossmery Tolentino para todos:  05:10 PM
select * from rh.dbo.empleado


-- De Elena Del Castillo para todos:  05:11 PM
select * from rh.dbo.empleado where iddepartamento=101 and sueldo>10000;
GO

-- De Rodrigo Gutarra para todos:  05:12 PM
-- Ejercicio 13: 

-- LIKE
/*

SINTAXIS

	<campo> [NOT] LIKE 'patron'

Caracteres comodines:

	_  =>  Cualquier caracter
	%  =>  Cadena de caracteres

*/

-- Ejemplo

select * 
from rh.dbo.empleado
where nombre like 'O%';
go

-- Ejemplo

select * 
from rh.dbo.empleado
where nombre like '%a';
go

-- Ejemplo

select * 
from rh.dbo.empleado
where nombre not like '_[AO]%';
go


-- BETWEEN
/*

SINTAXIS

	<columna> [NOT] BETWEEN <valor1> AND <valor2>

*/


-- Ejemplo


select * 
from rh.dbo.empleado
WHERE sueldo between 3000 and 7000;
go

select * 
from rh.dbo.empleado
WHERE sueldo not  between 3000 and 7000;
go

-- IN
/*

SINTAXIS

	<columna> [NOT] IN ( <valor1>, <valor2>, ... )

*/

-- De Rodrigo Gutarra para todos:  04:54 PM
-- Ejercicio 10: 
-- Ejercicio 14

select nombre

-- Ejercicio 15 : 


-- De Mariam Ipanaqu� para todos:  05:38 PM
-- PREGUNTA 17

-- De Mariam Ipanaqu� para todos:  05:38 PM
-- pregunta 18


-- De Elena Del Castillo para todos:  05:39 PM
-- Ejercicio 16

SELECT * 

-- De Rodrigo Gutarra para todos:  05:40 PM
-- Ejercicio 16

SELECT * 


-- NULOS
/*
Cualquier operaci�n con un valor NULL es otro valor NULL.
*/

-- Ejemplo
select 100 + null "respuest";
go

-- ISNULL

select isnull(200, 500) Resultado;
go

select isnull(null, 500) Resultado;
go


-- FECHAS
/*

DATEPART

	Retorna una parte de la fecha.

*/


select e.*, DATENAME(dw,fecingreso) "Dia Semana"
from rh.dbo.empleado e;
go
