-- FUNCIONES AGREGADAS
/*
	- COUNT: Contar filas u ocurrencias
	- SUM: Sumarizar columnas numericas
	- AVG: Encontrar el promedio
	- MAX: Encontrar el valor máximo
	- MIN: Encontrar el valor mínimo

	No consideran los nulos.
*/

-- Ejemplo 1

select 
	max(sueldo) [Mayor Sueldo],
	min(sueldo) [Menor Sueldo]
from rh.dbo.empleado;
go

-- Ejemplo 2

select 
	count(*) [Cantidad de filas],
	count(0) [Cantidad de filas], -- Cuenta cantidad de ceros
	count(1) [Cantidad de filas], -- Cuenta cantidad de unos
	sum(1) [Cantidad de filas],   -- Suma unos
	count(case when comision = 0 then null else comision end) [Cantidad de empleados con comision], -- Cuenta los valores no nulos
	count(iif( comision = 0, null, comision)) [Cantidad de empleados con comision] -- Cuenta los valores no nulos
from rh.dbo.empleado;
go

select * 
from rh.dbo.empleado
where comision is not null;
go

select iif(comison =0, null, comision)
from rh.dbo.empleado;
go




