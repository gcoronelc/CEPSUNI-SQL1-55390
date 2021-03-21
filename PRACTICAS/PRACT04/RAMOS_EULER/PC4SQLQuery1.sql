/* 
---------------------------------------------
SQL SERVER - IMPLEMENTACION
PRACTICA 04
CONSULTAS MULTITABLAS Y RESUMENES DE DATOS
---------------------------------------------
PARTICIPANTES:
JACKELINE FABIOLA MANRIQUE MONTAÑEZ
EULER RAMOS HOYOS
---------------------------------------------
*/

--	Problema 1
--	Se necesita una consulta para conocer el importe de la planilla por departamento.
--	Base de datos: RH
	
SELECT	D.nombre [NOMBRE DEPARTAMENTO],
		COUNT(E.idempleado) [CANTIDAD DE EMPLEADOS],
		SUM(E.sueldo) [IMPORTE] ,
		SUM(ISNULL(E.comision,0)) [COMISION],
		SUM(E.sueldo +ISNULL(E.comision,0)) [TOTAL]
FROM RH..departamento D
INNER JOIN RH..empleado E ON D.iddepartamento=E.iddepartamento
GROUP BY D.nombre;
GO

-- Problema 2
--	Se necesita una consulta para saber la cantidad de empleados por ciudad.
--	Base de datos: RH

WITH
	T1 AS (
		SELECT COUNT(idempleado) TOTAL
		FROM RH..empleado),
	T2 AS (
		SELECT u.ciudad c , COUNT(*) CANT
		FROM RH..departamento d
		JOIN RH..ubicacion u ON d.idubicacion=u.idubicacion
		JOIN RH..empleado e ON d.iddepartamento=e.iddepartamento
		GROUP BY u.ciudad)
SELECT T2.c [CIUDAD], T2.cant [CANTIDAD DE EMPLEADOS], 
		CONCAT( CAST((CAST (T2.CANT AS FLOAT)*100/CAST( T1.TOTAL AS FLOAT)) AS NUMERIC(5,2)), '%') [PORCENTAJE DEL TOTAL]
FROM T1
CROSS JOIN T2;
GO

--	Problema 3
--	Se necesita una consulta para obtener el resumen por curso de un determinado ciclo
--	Base de datos: EDUTEC

SELECT	C.NomCurso [NOMBRE DEL CURSO],
		COUNT(C.NomCurso) [AULAS PROGRAMAS],
		SUM(CP.Matriculados)+SUM(CP.Vacantes) [VACANTES PROGRAMADAS],
		SUM(CP.Matriculados) [MATRICULADOS],
		CONCAT(CAST(SUM(CP.Matriculados)/(SUM(CP.Matriculados)+SUM(CP.Vacantes))*100 AS NUMERIC(3,0)),'%' )[PORCENTAJE MATRICULADOS]
FROM EduTec..Curso C
INNER JOIN EduTec..CursoProgramado CP ON C.IdCurso=CP.IdCurso
WHERE CP.IdCiclo LIKE '2021-02%'
GROUP BY C.NomCurso;
GO

--	Problema 4
--	Desarrollar una consulta para encontrar la planilla de profesores de un determinado ciclo.
--	Base de datos: EDUTEC

SELECT	CONCAT(P.NomProfesor,' ',P.ApeProfesor) [NOMBRE DEL PROFESOR],
		COUNT(CP.IdCursoProg) [AULAS PROGRAMADAS],
		SUM(T.Horas) [HORAS DICTADAS],
		SUM(T.PrecioVenta) [IMPORTE]
FROM EduTec..CursoProgramado CP
INNER JOIN EduTec..Profesor P ON CP.IdProfesor=P.IdProfesor
INNER JOIN EduTec..CURSO C ON CP.IdCurso=C.IdCurso
INNER JOIN EduTec..Tarifa T ON C.IdTarifa=T.IdTarifa
WHERE CP.IdCiclo LIKE '2021-02%'
GROUP BY CONCAT(P.NomProfesor,' ',P.ApeProfesor);
GO

--	Problema 5
--	Desarrollar una consulta para obtener un reporte de rendimiento académico por curso de un determinado ciclo.
--	Base de datos: EDUTEC

WITH 
	T1 AS (
		SELECT	C.IdCurso ,
				C.NomCurso [NOMBRE DEL CURSO],
				COUNT(P.IdCurso) [AULAS PROGRAMADAS],
				SUM(P.Matriculados) [MATRICULADOS]
		FROM EduTec..CursoProgramado P
		INNER JOIN EduTec..CURSO C ON P.IdCurso=C.IdCurso
		WHERE P.IdCiclo ='2021-02'
		GROUP BY C.IdCurso,C.NomCurso),
	T2 AS (
		SELECT	P.IdCurso,
				COUNT( CASE WHEN M.Promedio>=10 THEN 1 END) [APROBADOS]
		FROM EduTec..CursoProgramado P
		INNER JOIN EDUTEC..Matricula M ON P.IdCursoProg=M.IdCursoProg
		WHERE P.IdCiclo='2021-02'
		GROUP BY P.IdCurso)
SELECT	T1.[NOMBRE DEL CURSO],
		T1.[AULAS PROGRAMADAS],
		T1.MATRICULADOS,
		T2.APROBADOS,
		CAST(T2.APROBADOS/T1.MATRICULADOS*100 AS NUMERIC(3,0)) [PORCENTAJE DE APROBADOS] 
FROM T1 
INNER JOIN T2 ON T1.IdCurso=T2.IdCurso
ORDER BY T1.[NOMBRE DEL CURSO];
GO

--	Problema 6
--	Se necesita saber la cantidad de pedidos que se han realizado por país, que incluya la
--	cantidad de artículos, el importe respectivo y el porcentaje que representa del total de pedidos.
--	Base de datos: Northwind
	
WITH 
	T1 AS(
		SELECT	O.ShipCountry [PAIS],
				COUNT(O.OrderID) [CANTIDAD PEDIDOS],
				SUM( D.ProductID) [CANTIDAD PRODUCTOS],
				CAST(SUM((D.UnitPrice-D.Discount)*D.Quantity) AS numeric(10,2)) [IMPORTE]
		FROM Northwind..Orders O
		INNER JOIN Northwind..[Order Details] D ON O.OrderID=D.OrderID
		GROUP BY O.ShipCountry),
	T2 AS(
		SELECT SUM((UnitPrice-Discount)*Quantity) TOTAL
		FROM Northwind..[Order Details])
SELECT	T1.*, CAST(IMPORTE/TOTAL*100 AS numeric (5,2)) [PORCENTAJE DEL TOTAL]
FROM T1
CROSS JOIN T2;
GO

--	Problema 7
--	Se necesita saber cuál es el producto más solicitado por cada cliente, se debe mostrar los empates.
--	Base de datos: Northwind
WITH 
TB1 AS (
	SELECT T1.[NOMBRE CLIENTE],T1.[NOMBRE PRODUCTO],T1.Quantity
	FROM (SELECT	C.CompanyName [NOMBRE CLIENTE],
					P.ProductName [NOMBRE PRODUCTO],
					OD.Quantity,
					ROW_NUMBER() OVER (
						PARTITION BY C.CompanyName
						ORDER BY OD.Quantity DESC) ROW_NUM
			FROM (Northwind..[Order Details] OD
			INNER JOIN Northwind..Products P ON OD.ProductID=P.ProductID
			INNER JOIN Northwind..Orders O ON OD.OrderID=O.OrderID
			INNER JOIN Northwind..Customers C ON C.CustomerID=O.CustomerID) 
	) T1
	WHERE T1.ROW_NUM=1),

TB2 AS (

	SELECT	C.CompanyName [NOMBRE CLIENTE],
			COUNT(DISTINCT OD.OrderID) [CANTIDAD PEDIDOS],
			SUM(OD.Quantity) [CANTIDAD DE PRODUCTOS]
	FROM Northwind..[Order Details] OD
	INNER JOIN Northwind..Products P ON OD.ProductID=P.ProductID
	INNER JOIN Northwind..Orders O ON OD.OrderID=O.OrderID
	INNER JOIN Northwind..Customers C ON C.CustomerID=O.CustomerID
	GROUP BY C.CompanyName)

SELECT	TB1.[NOMBRE CLIENTE],
		TB1.[NOMBRE PRODUCTO],
		TB2.[CANTIDAD PEDIDOS],
		TB2.[CANTIDAD DE PRODUCTOS]
FROM TB1 
INNER JOIN TB2 ON TB1.[NOMBRE CLIENTE]=TB2.[NOMBRE CLIENTE];
GO

--	Problema 8
--	Se necesita saber las ventas totales por producto, en cada categoría.
--	Base de datos: Northwind

SELECT	C.CategoryName [NOMBRE CATEGORIA],
		P.ProductName [NOMBRE PRODUCTO],
		COUNT(0) [CANTIDAD],
		SUM(D.Quantity*  CAST (P.UnitPrice AS FLOAT)) [IMPORTE]
FROM Northwind..Categories C
INNER JOIN Northwind..Products P ON C.CategoryID=P.CategoryID
INNER JOIN Northwind..[Order Details] D ON P.ProductID=D.ProductID
GROUP BY C.CategoryName, P.ProductName
ORDER BY C.CategoryName,P.ProductName;
GO

--	Problema 9
--	Cada empleado recibe 3% de comisión de cada venta. Se necesita una consulta que
--	permita obtener la comisión que se le debe pagar a cada empleado por todas sus ventas.
--	Base de datos: Northwind

SELECT	CONCAT (E.FirstName,' ',E.LastName) [NOMBRE EMPLEADO],
		COUNT(O.OrderID) [CANTIDAD DE VENTAS],
		CAST(SUM(D.Quantity*(D.UnitPrice - D.Discount)) AS numeric (20,2)) [IMPORTE DE VENTAS] ,
		CAST(0.03*SUM(D.Quantity*(D.UnitPrice - D.Discount)) AS numeric (20,2))[IMPORTE COMISION]
FROM Northwind..Employees E
INNER JOIN Northwind..Orders O ON E.EmployeeID=O.EmployeeID
INNER JOIN Northwind..[Order Details] D ON O.OrderID=D.OrderID
GROUP BY CONCAT (E.FirstName,' ',E.LastName);
GO

--	Problema 10
--	Se necesita saber el importe de las ventas de cada producto y que porcentaje representa del
--	total de las ventas.
--	Base de datos: Northwind

WITH 
	T1 AS (
		SELECT	P.ProductName [NOMBRE DEL PRODUCTO],
				CAST(SUM((D.UnitPrice-D.Discount)*D.Quantity) AS numeric(10,2)) [IMPORTE DE VENTAS]
		FROM Northwind..Products P
		INNER JOIN Northwind..[Order Details] D ON P.ProductID=D.ProductID
		GROUP BY P.ProductName),
	T2 AS (
		SELECT SUM((UnitPrice-Discount)*Quantity) TOTAL
		FROM Northwind..[Order Details])
SELECT T1.*, CAST (T1.[IMPORTE DE VENTAS]/T2.TOTAL*100 AS numeric(5,2)) [PORCENTAJE DEL TOTAL]
FROM T1
CROSS JOIN T2;
GO
	