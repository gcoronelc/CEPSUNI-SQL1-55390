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
SELECT	D.iddepartamento [CODIGO DEPARTAMENTO],