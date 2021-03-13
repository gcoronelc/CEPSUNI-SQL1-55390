﻿-- SENTENCIA: SELECT
/*

SINTAXIS:

	SELECT [TOP n] <lista de columnas>
	FROM <tabla>
	WHERE <filtro de filas>
	GROUP BY <columnas de agrupamiento>
	HAVING <filtro de grupos>
	ORDER BY <columnas de ordenamiento>

*/

-- Ejemplo 1

-- <base de datos>.<esquema>.<tabla>

SELECT * FROM EDUCA.DBO.CURSO;
GO

SELECT * FROM CURSO;
GO


-- Ejemplo 2

SELECT cur_id, cur_nombre FROM curso;
go

-- Ejemplo 3

SELECT cur_id codigo, cur_nombre nombre
FROM curso;
go

-- Selección de columnas

-- Ejercicio 1. 
/*
Desarrolle una sentencia SELECT para consultar el nombre, apellido y correo de los
empleados de la base de datos RH.
*/

-- De Elena Del Castillo para todos:  03:13 PM

select nombre, apellido, email from RH.dbo.empleado;


-- Ejercicio 2
/*
Desarrolle una sentencia SELECT para consultar el nombre, vacantes y precio de cada curso
de la base de datos EDUCA.
*/

-- De Rossmery Tolentino para todos:  03:11 PM

SELECT CUR_nombre nombre,cur_vacantes,cur_precio
from EDUCA.DBO.CURSO;
go

-- CAMPOS CALCULADOS

select c.*, (cur_vacantes - cur_matriculados) "Vacantes Disponibles"
from educa.dbo.curso c;
go


--Ejercicio 3. 
/*
Desarrollar una sentencia SELECT que permita obtener el importe que se obtendría en cada
curso, si se logra vender todas las vacantes por cada curso. Base de datos EDUCA.
*/

-- De Francesca Flores para todos:  03:35 PM
SELECT X. * , (cur_vacantes*cur_precio) "importe total"

-- De Mariam Ipanaqué para todos:  03:38 PM
SELECT M.*, (cur_vacantes*cur_precio) "Importe"
--De Elena Del Castillo para todos:  03:41 PM
select c.*, (cur_vacantes * cur_precio) "Importe Total"
GO


-- Ejercicio 4.
/*
Desarrollar una consulta que permita mostrar las vacantes programas, los matriculados y las
vacantes disponibles de cada curso de la base de datos EDUTEC.
*/

SELECT * FROM EDUtec.dbo.CursoProgramado;
GO

-- De Rossmery Tolentino para todos:  03:37 PM
select 




-- Ejercicio 5. 
/*
El área de recursos humanos necesita una consulta que permita mostrar de cada empleado
su sueldo actual y cuanto sería su incremento si se proyecta un aumento del 20% a cada uno
respectivamente.
*/



-- CONCATENACION

SELECT CONCAT('GUSTAVO',' CORONEL',' CASTILLO') "NOMBRE COMPLETO";
GO


-- Ejercicio 6
-- De Elena Del Castillo para todos:  03:56 PM
select CONCAT(apellido, ' ' ,nombre) from rh.dbo.empleado;
GO



-- De Rodrigo Gutarra para todos:  04:00 PM
-- Ejercicio 8:   
GO


-- De Francesca Flores para todos:  04:00 PM
-- EJERCICIO 7
GO


-- De Mariam Ipanaqué para todos:  04:00 PM
-- Ejercicio 6

SELECT CONCAT (apellido, ' ' ,nombre) from RH.DBO.EMPLEADO;


-- De Rodrigo Gutarra para todos:  04:01 PM
-- Ejercicio 5:    
go


-- De Mariam Ipanaqué para todos:  04:24 PM
-- Ejercicio 8: 
