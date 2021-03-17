---DESARROLLO PC3

--PROBLEMA 1

--Desarrollar una consulta que permita encontrar todos los empleados que no tienen teléfono.
--Base de datos: RH

USE RH
GO

Select*from empleado;
go

SELECT *
FROM RH.DBO.empleado
WHERE telefono = ' ' OR telefono is Null;
GO



----Problema 2
----Desarrollar una consulta para encontrar los ingresos totales de cada uno de los empleados.
----Base de datos: RH
USE RH;
GO

SELECT * FROM DBO.empleado;
GO

UPDATE empleado SET [comision] = 0 
WHERE [comision] is null

SELECT apellido, nombre, sueldo, comision ,( sueldo + comision ) "Ingreso Total"
FROM RH.dbo.empleado ;
GO




---PROBLEMA 3
---Desarrollar una consulta para encontrar a todos los empleados que no tienen correo 
---institucional.
---El dominio del correo institucional puede ser perudev.com o perudev.pe.
---Base de datos: RH

SELECT * 
FROM RH.DBO.EMPLEADO
WHERE email NOT like '%perudev_%';
GO


----Problema 4
----Desarrollar una consulta que permita encontrar el tiempo de servicio en meses de cada 
----empleado.
----Base de datos: RH
USE RH;
GO

SELECT * FROM DBO.empleado;
GO

SELECT apellido, nombre, 
DATEDIFF (month, fecingreso , GETDATE())
AS 'Tiempo de servicio'
FROM dbo.empleado ;
GO



---PROBLEMA 5
---Se necesita saber la programación del profesor Raúl Chuco en el presente mes.
---Base de datos: EDUTEC

USE EduTec
GO

Select*from EduTec.DBO.Profesor;
go

---Nombre: Rául Chuco IDProfesor: P011

Select*from EduTec.DBO.CursoProgramado;
go

SELECT *
FROM EduTec.DBO.CursoProgramado
WHERE IdProfesor = 'P011' and IdCiclo like '%3';
GO



----Problema 6
----Se necesita saber que profesores viven en SMP, en Los Olivos o en Comas.
----Base de datos: EDUTEC
USE EduTec;
GO

SELECT * FROM DBO.CursoProgramado;
GO

SELECT IdProfesor, ApeProfesor , NomProfesor , DirProfesor
FROM EduTec.DBO.Profesor
WHERE DirProfesor IN ('Los Olivos','SMP','Comas');
GO

---PROBLEMA 7
---Se necesita saber los cursos programados para este mes que tienen menos de 10 matriculados.
---Base de datos: EDUTEC

Select*from EduTec.DBO.CursoProgramado;
go

SELECT *
FROM EduTec.DBO.CursoProgramado
WHERE IdCiclo like '%3' and Matriculados < 10;
GO

---Problema 8
---Se necesita saber los horarios en que han sido programados los cursos de Java en el mes 
---actual.
---Base de datos: EDUTEC
USE EduTec;
GO

SELECT *
FROM EduTec.DBO.Curso;
GO

SELECT CursoProgramado.IdCurso, 
 Curso.NomCurso, CursoProgramado.Horario
FROM EduTec.DBO.CursoProgramado
INNER JOIN Curso ON Curso.IdCurso =CursoProgramado.IdCurso
WHERE Curso.IdCurso IN ('C005','C006','C007','C008','C014');
GO


---PROBLEMA 9
---Se necesita una consulta para averiguar los pedidos que serán llevados a México, España y Brasil.
---Base de datos: Northwind

USE Northwind

SELECT * 
FROM Northwind.DBO.Orders
GO

SELECT * 
FROM Northwind.DBO.Orders
WHERE ShipCountry IN ('Mexico', 'Spain', 'Brazil')
GO



----Problema 10
---Se necesita una consulta de los clientes de las siguientes ciudades:
---Rio de Janeiro
---Sao Paulo
---Buenos Aires
--- Caracas
---Base de datos: Northwind
USE Northwind; 
GO

SELECT *
FROM Northwind.dbo.Customers;
GO

 SELECT CompanyName, Address,City, Country 
 FROM Northwind.DBO.Customers
 WHERE City IN ('Sao Paulo','Caracas','Rio de Janeiro','Buenos Aires')
 GO


---Problema 11
---Se necesita un listado de las ciudades donde se tienen clientes.
---Base de datos: Northwind

SELECT * 
FROM Northwind.DBO.Customers
GO

SELECT DISTINCT City 
FROM Customers;
GO


---Problema 12
---Se necesita un listado de los clientes, cuyo representante es el Gerente de Ventas, el 
---Gerente de Marketing o el mismo dueño.
----Base de datos: Northwind
USE Northwind; 
GO
SELECT *
FROM Northwind.dbo.Customers;

 SELECT  ContactName , ContactTitle
 FROM Northwind.DBO.Customers
  WHERE ContactTitle IN ('Sales Representative','Marketing Manager','Owner');
 GO








