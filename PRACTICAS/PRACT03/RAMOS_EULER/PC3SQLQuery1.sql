/* 
--------------------------------------
SQL SERVER - IMPLEMENTACION
PRACTICA 03
CONSULTAS A UNA TABLA
--------------------------------------
PARTICIPANTES:
JACKELINE FABIOLA MANRIQUE MONTAÑEZ
EULER RAMOS HOYOS
--------------------------------------
*/

--	Problema 1
--	Desarrollar una consulta que permita encontrar todos los empleados que no tienen teléfono.
--	Base de datos: RH

	SELECT	idempleado [ID EMPLEADO],
			telefono [TELEFONO]
	FROM RH..empleado
	WHERE telefono='' OR telefono IS NULL;
	GO

--	Problema 2
--	Desarrollar una consulta para encontrar los ingresos totales de cada uno de los empleados.
--	Base de datos: RH

	SELECT	CONCAT(nombre,' ',apellido) Empleados,
			sueldo+ISNULL(comision,0) Ingresos
	FROM RH..empleado;
	GO

--	Problema 3
--	Desarrollar una consulta para encontrar a todos los empleados que no tienen correo institucional.
--	El dominio del correo institucional puede ser perudev.com o perudev.pe.
--	Base de datos: RH

	SELECT	CONCAT(nombre,' ',apellido) Empleados,
			email [Correo electronico]
	FROM RH..empleado
	WHERE email NOT LIKE '%perudev%';
	GO

--	Problema 4
--	Desarrollar una consulta que permita encontrar el tiempo de servicio en meses de cada empleado.
--	Base de datos: RH

	SELECT	CONCAT(nombre,' ',apellido) Empleados,
			DATEDIFF(MONTH,fecingreso, GETDATE())[Tiempo servicio]
	FROM RH..empleado;
	GO

--	Problema 5
--	Se necesita saber la programación del profesor Raúl Chuco en el presente mes.
--	Base de datos: EDUTEC

	SELECT	CONCAT(P.NomProfesor,' ',P.ApeProfesor) Profesor,
			C.*, CP.IdCursoProg,CP.IdCurso,CP.Matriculados,CP.Horario
	FROM EduTec..CursoProgramado CP
	INNER JOIN EduTec..Profesor P ON CP.IdProfesor=P.IdProfesor
	INNER JOIN EduTec..Ciclo C ON CP.IdCiclo=C.IdCiclo
	WHERE P.NomProfesor='Raul' AND P.ApeProfesor LIKE 'Chuco%' AND YEAR(C.FecInicio)=2021 AND YEAR(C.FecTermino)=2021 AND (MONTH(C.FecInicio)=3 OR MONTH(C.FecTermino)=3)
	GO

--	Problema 6
--	Se necesita saber que profesores viven en SMP, en Los Olivos o en Comas.
--	Base de datos: EDUTEC

	SELECT	CONCAT(NomProfesor,' ',ApeProfesor) Profesor,
			DirProfesor [Direccion]
	FROM EduTec..Profesor
	WHERE DirProfesor IN ('SMP','Los Olivos','Comas');
	GO

--	Problema 7
--	Se necesita saber los cursos programados para este mes que tienen menos de 10 matriculados.
--	Base de datos: EDUTEC

	SELECT IdCursoProg, IdCurso, Matriculados
	FROM EduTec..CursoProgramado
	WHERE Matriculados>=10
	GO

--	Problema 8
--	Se necesita saber los horarios en que han sido programados los cursos de Java en el mes actual.
--	Base de datos: EDUTEC

	SELECT  CU.NomCurso, CP.Horario, CP.IdCiclo
	FROM EduTec..CursoProgramado CP
	INNER JOIN EduTec..Ciclo C ON CP.IdCiclo=C.IdCiclo
	INNER JOIN EduTec..Curso CU ON CP.IdCurso=CU.IdCurso
	WHERE  YEAR(C.FecInicio)=2021 AND YEAR(C.FecTermino)=2021 AND (MONTH(C.FecInicio)=3 OR MONTH(C.FecTermino)=3) AND CU.NomCurso LIKE 'Java%';
	GO
	-- Otra manera 
	SELECT  CU.NomCurso, CP.Horario, CP.IdCiclo
	FROM EduTec..CursoProgramado CP
	INNER JOIN EduTec..Curso CU ON CP.IdCurso=CU.IdCurso
	WHERE  CU.NomCurso LIKE 'Java%' AND CP.IdCiclo='2021-03';
	GO


--	Problema 9
--	Se necesita una consulta para averiguar los pedidos que serán llevados a México, España y Brasil.
--	Base de datos: Northwind

	SELECT OrderID, ShipCountry
	FROM Northwind..Orders
	WHERE ShipCountry IN ('Mexico','Spain','Brazil')
	GO

--	Problema 10
--	Se necesita una consulta de los clientes de las siguientes ciudades:
--		Rio de Janeiro
--		Sao Paulo
--		Buenos Aires
--		Caracas
--	Base de datos: Northwind

	SELECT CustomerID,CompanyName,ContactName,City
	FROM Northwind..Customers
	WHERE City IN ('Rio de Janeiro','Sao Paulo','Buenos Aires','Caracas') ;
	GO

--	Problema 11
--	Se necesita un listado de las ciudades donde se tienen clientes.
--	Base de datos: Northwind
	
	SELECT DISTINCT City
	FROM Northwind..Customers;
	GO

--	Problema 12
--	Se necesita un listado de los clientes, cuyo representante es el Gerente de Ventas, el Gerente de Marketing o el mismo dueño.
--	Base de datos: Northwind

	SELECT CustomerID,CompanyName,ContactName,ContactTitle
	FROM Northwind..Customers
	WHERE ContactTitle IN ('Sales Manager','Marketing Manager') OR ContactTitle LIKE 'Owner%';
	GO