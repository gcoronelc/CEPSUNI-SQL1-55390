-- VISTAS
/*

	Es un objeto que esta basada en un setencia SELECT.
	Es como una tabla virtul, por que fisicamente no existe.
	Oculta la complejidad de la sentencia SELECT.

*/

USE RH;
GO


CREATE VIEW V_SUELDO_PROYECTADO
AS
SELECT	D.iddepartamento [CODIGO DEPARTAMENTO],		D.nombre [NOMBRE DEPARTAMENTO],		SUM(E.sueldo+ISNULL(E.comision,0)) [IMPORTE DE PLANILLA],		CAST (SUM((E.sueldo+ISNULL(E.comision,0))*1.15) AS numeric(10,2)) [IMPORTE PLANILLA PROYECTADA]FROM RH..departamento DINNER JOIN RH..empleado E ON D.iddepartamento=E.iddepartamentoGROUP BY D.iddepartamento, D.nombre;GOSELECT * FROM V_SUELDO_PROYECTADO;GO