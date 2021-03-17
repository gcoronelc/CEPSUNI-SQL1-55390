

SELECT  * FROM RH.DBO.empleado;
GO 

/* Problema n1

Desarrollar una consulta que permita encontrar todos los empleados que no tienen teléfono.--
Base de datos: RH */

SELECT *
FROM RH.DBO.EMPLEADO
WHERE telefono = ' ' OR telefono is Null;
GO

/* Problema n2

Desarrollar una consulta para encontrar los ingresos totales de cada uno de los empleados. */
select *
from RH.DBO.EMPLEADO

SELECT c.*, (sueldo + isnull(comision,0)) "ingresos totales"
from rh.dbo.empleado c 
go

/* Problema n3

Desarrollar una consulta para encontrar a todos los empleados que no tienen correo institucional. */

select email
from rh.dbo.empleado
WHERE email  like '%@perudev.%';
go

/* Problema n4

Desarrollar una consulta que permita encontrar el tiempo de servicio en meses de cada empleado. */
select e.*, DATEDIFF(month,fecingreso,SYSDATETIME()) "tiempo meses"
from rh.dbo.empleado e;
go

/* Problema n5 
	Se necesita saber la programación del profesor Raúl Chuco en el presente mes. (Marzo)
Base de datos: EDUTEC */

select p.NomProfesor , p.ApeProfesor, c.Horario, c.IdCiclo
from edutec..Profesor p
join edutec..CursoProgramado C on p.IdProfesor = c.IdProfesor
where p.IdProfesor = 'P011' and c.IdCiclo like '2021-03'
group by p.NomProfesor, p.ApeProfesor, c.Horario, c.IdCiclo;

/* Problema n6 
	Se necesita saber que profesores viven en SMP, en Los Olivos o en Comas.
Base de datos: EDUTEC */

select * from edutec.dbo.profesor where DirProfesor = 'SMP' OR DirProfesor = 'Los Olivos' OR DirProfesor = 'Comas'


/* Problema n7 
	Se necesita saber los cursos programados para este mes que tienen menos de 10
matriculados.
Base de datos: EDUTEC */

select * from edutec.dbo.CursoProgramado where IdCiclo like '2021-03' and Matriculados<10

/* Problema n8 
	Se necesita saber los horarios en que han sido programados los cursos de Java en el mes
actual.
Base de datos: EDUTEC */

select C.IdCurso, c.NomCurso, cp.IdCiclo
from edutec..Curso C
join edutec..CursoProgramado CP on c.IdCurso = cp.IdCurso
where c.NomCurso like 'Java%' and cp.IdCiclo like '2021-03'

/* Problema n9 
	Se necesita una consulta para averiguar los pedidos que serán llevados a México, España y
Brasil.
Base de datos: Northwind */

select * from Northwind.dbo.orders where ShipCountry in ('Mexico', 'España' , 'Brasil')

/* Problema n10 
Se necesita una consulta de los clientes de las siguientes ciudades:
▪ Rio de Janeiro
▪ Sao Paulo
▪ Buenos Aires
▪ Caracas
Base de datos: Northwind */

select CompanyName, ContactName, City from Northwind.dbo.Customers where City IN ('Rio de Janeiro','Sao Paulo','Buenos Aires','Caracas');
go

/* Problema n11
	Se necesita un listado de las ciudades donde se tienen clientes.
Base de datos: Northwind */

select CompanyName, ContactName, City from Northwind.dbo.Customers
go

/* Problema n12
	Se necesita un listado de los clientes, cuyo representante es el Gerente de Ventas, el
Gerente de Marketing o el mismo dueño.
Base de datos: Northwind */

select CompanyName, ContactName,Address,City, ContactTitle from Northwind.dbo.Customers where ContactTitle IN ('Owner','Markrting Manager','Sales Manager');
go
