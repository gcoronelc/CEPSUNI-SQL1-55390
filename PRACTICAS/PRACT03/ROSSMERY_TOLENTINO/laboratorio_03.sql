
--Problema 1
------------Desarrollar una consulta que permita encontrar todos los empleados que no tienen teléfono.
------------Base de datos: RH

select * from rh.dbo.empleado
where telefono IS NULL OR telefono='';
GO

--Problema 2
------------Desarrollar una consulta para encontrar los ingresos totales de cada uno de los empleados.
------------Base de datos: RH
select  C.* ,(SUELDO + ISNULL (COMISION,0)) "INGRESOS TOTALES"
from rh.dbo.empleado C;
GO

--Problema 3
------------Desarrollar una consulta para encontrar a todos los empleados que no tienen correo
------------institucional.
------------El dominio del correo institucional puede ser perudev.com o perudev.pe.
------------Base de datos: RH
select * from rh.dbo.empleado
where EMAIL not like '%perudev.com' and EMAIL not like '%perudev.pe';
GO

--Problema 4
------------Desarrollar una consulta que permita encontrar el tiempo de servicio en meses de cada
------------empleado.
------------Base de datos: RH
select  C.* ,DATEDIFF(month,  fecingreso,SYSDATETIME()) "tiempo de servicio(meses)"
from rh.dbo.empleado C;
GO

--Problema 5
------------Se necesita saber la programación del profesor Raúl Chuco en el presente mes.
------------Base de datos: EDUTEC

select Horario,idciclo,NomProfesor ,ApeProfesor
from EDUTEC.DBO.CursoProgramado
join EDUTEC.DBO.Profesor on EDUTEC.DBO.CursoProgramado.IdProfesor=EDUTEC.DBO.Profesor.IdProfesor
where NomProfesor ='Raul'and ApeProfesor like 'Chuco%' ;
GO

--si incluimos el mes actual( no hay datos)
select Horario,idciclo,NomProfesor ,ApeProfesor
from EDUTEC.DBO.CursoProgramado
join EDUTEC.DBO.Profesor on EDUTEC.DBO.CursoProgramado.IdProfesor=EDUTEC.DBO.Profesor.IdProfesor
where NomProfesor ='Raul'and ApeProfesor like 'Chuco%'  and  IdCiclo='2021-03' ;
GO


--Problema 6
------------Se necesita saber que profesores viven en SMP, en Los Olivos o en Comas.
------------Base de datos: EDUTEC

select NomProfesor,DirProfesor from EDUTEC.DBO.Profesor
where DirProfesor='SMP' OR DirProfesor='Los Olivos' OR DirProfesor='Comas';
GO

--Problema 7
------------Se necesita saber los cursos programados para este mes que tienen menos de 10
------------matriculados.
------------Base de datos: EDUTEC

select *
from EDUTEC.DBO.CursoProgramado
where IdCiclo='2021-03' and matriculados<10;
GO

--Problema 8
------------Se necesita saber los horarios en que han sido programados los cursos de Java en el mes
------------actual.
------------Base de datos: EDUTEC

select horario,IdCiclo ,NomCurso
from EDUTEC.DBO.CursoProgramado
JOIN  EDUTEC.DBO.Curso ON EDUTEC.DBO.CursoProgramado.IdCurso =EDUTEC.DBO.Curso.IdCurso
where IdCiclo='2021-03'AND  CURSO.NomCurso LIKE 'JAVA%';
GO


--Problema 9
------------Se necesita una consulta para averiguar los pedidos que serán llevados a México, España y
------------Brasil.
------------Base de datos: Northwind

select *
from Northwind.DBO.Orders
WHERE ShipCountry='Mexico' OR ShipCountry='Spain' OR ShipCountry='BraZil';
GO


--Problema 10
------------Se necesita una consulta de los clientes de las siguientes ciudades:
------------▪ Rio de Janeiro
------------▪ Sao Paulo
------------▪ Buenos Aires
------------▪ Caracas
------------Base de datos: Northwind

select ContactName,City
from Northwind.DBO.Customers
WHERE City='Rio de Janeiro' OR City='Sao Paulo' OR City='Buenos Aires'or City='Caracas';
GO
--Problema 11
------------Se necesita un listado de las ciudades donde se tienen clientes.
------------Base de datos: Northwind

select distinct city
from Northwind.DBO.Customers;
GO



--Problema 12
------------Se necesita un listado de los clientes, cuyo representante es el Gerente de Ventas, el
------------Gerente de Marketing o el mismo dueño.
------------Base de datos: Northwind
select ContactName , ContactTitle
from Northwind.DBO.Customers
where ContactTitle='sale manager' or  ContactTitle='marketing manager' or ContactTitle='owner';
GO