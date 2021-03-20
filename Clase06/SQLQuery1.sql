-- CREACION DE TABLAS A PARTIR DE UNA CONSULTA

USE RH;
GO

DROP TABLE EMP_AUX;
GO

SELECT * 
INTO EMP_AUX
FROM RH..empleado;
GO

SELECT * 
FROM ..EMP_AUX;
GO


SELECT * 
INTO EMP_AUX2
FROM RH..empleado
WHERE 1<0;
GO


SELECT * FROM ..EMP_AUX2;
GO

-- Ejercicio 1
--De JACKELINE FABIOLA MANRIQUE MONTAÑEZ para todos:  03:06 PM-- 

SELECT	D.iddepartamento [CODIGO DEPARTAMENTO],		D.nombre [NOMBRE DEPARTAMENTO],		SUM(E.sueldo+ISNULL(E.comision,0)) [IMPORTE DE PLANILLA],		CAST (SUM((E.sueldo+ISNULL(E.comision,0))*1.15) AS numeric(10,2)) [IMPORTE PLANILLA PROYECTADA]INTO PLANILLA_PROYECTADAFROM RH..departamento DINNER JOIN RH..empleado E ON D.iddepartamento=E.iddepartamentoGROUP BY D.iddepartamento, D.nombre;GO

SELECT * FROM PLANILLA_PROYECTADA;
GO



