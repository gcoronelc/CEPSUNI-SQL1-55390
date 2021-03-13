-- IINER JOIN
/*

	FROM <tabla1> [ [AS] <alias1> ]
	[INNER] JOIN <tabla2> [ [AS] <alias2> ] ON <condicion>
	[INNER] JOIN <tabla3> [ [AS] <alias3> ] ON <condicion>
	[INNER] JOIN <tabla4> [ [AS] <alias4> ] ON <condicion>
	. . .

*/


select * from educa..ALUMNO;
go

select * from educa..MATRICULA;
go

select A.alu_nombre, M.cur_id, M.mat_fecha, M.mat_precio, M.mat_cuotas, M.mat_notafrom educa..ALUMNO Ajoin educa..MATRICULA M on A.alu_id = M.alu_idorder by 2;go


select A.alu_nombre, C.cur_nombre, M.mat_fecha, M.mat_precio, M.mat_cuotas, M.mat_nota
from educa..ALUMNO A
join educa..MATRICULA M on A.alu_id = M.alu_id
join educa..CURSO C on M.cur_id = C.cur_id
order by 2;
go

-- Ejercicio 1

-- De Diego yoel Castillo Chumacero para todos:  04:57 PM

select C.cur_nombre, A.alu_nombrefrom educa..ALUMNO Ajoin educa..MATRICULA M on A.alu_id = M.alu_idjoin educa..CURSO C on M.cur_id = C.cur_idorder by 1;go



-- Ejercicio 2
/*
Desarrolle una sentencia SELECT que muestre el nombre del alumno 
y la suma de todos sus pagos. 
Base de datos EDUCA.
*/

-- De JACKELINE FABIOLA MANRIQUE MONTAÑEZ para todos:  04:54 PM

SELECT A.alu_nombre, SUM(P.pag_importe) [Suma de pagos]FROM EDUCA..ALUMNO AJOIN EDUCA..PAGO P ON A.alu_id=P.alu_idGROUP BY A.alu_nombreorder by 2;GO


-- Ejercicio 3
/*
Desarrolle una sentencia SELECT que muestre el nombre del curso 
y la suma del importe de todos sus pagos. 
Base de datos EDUCA.
*/

-- De Diego yoel Castillo Chumacero para todos:  05:07 PM

select C.cur_nombre, Sum(P.pag_importe) [Suma Importe]from educa..Curso Cjoin educa..PAGO P on C.cur_id = P.cur_idGroup by C.cur_nombre;go


-- Ejercicio 4
/*
Desarrolle una sentencia SELECT que muestre el nombre del departamento 
y el importe de su planilla. 
Base de datos RH.
*/

-- De JACKELINE FABIOLA MANRIQUE MONTAÑEZ para todos:  05:11 PM

SELECT D.nombre Departamento, SUM(E.sueldo + ISNULL(E.comision,0)) ImporteFROM RH..empleado EJOIN RH..departamento D ON E.iddepartamento=D.iddepartamentoGROUP BY D.nombre;GO

-- De Mariam Ipanaqué Salinas para todos:  05:12 PM

select D.nombre Departamento, SUM(E.sueldo + ISNULL(E.comision,0)) Importefrom RH..empleado Ejoin RH..departamento D ON E.iddepartamento=D.iddepartamentogroup by D.nombre;
go


-- LEFT

select A.alu_nombre, M.cur_id, M.mat_fecha, M.mat_precio, M.mat_cuotas, M.mat_notafrom educa..ALUMNO Ajoin educa..MATRICULA M on A.alu_id = M.alu_idorder by 2;goselect A.alu_nombre, M.cur_id, M.mat_fecha, M.mat_precio, M.mat_cuotas, M.mat_notafrom educa..ALUMNO Aleft join educa..MATRICULA M on A.alu_id = M.alu_idorder by 2 desc;go-- Ejercicio 6/*Desarrolle una sentencia SELECT para obtener un listado de todos los departamentos y la cantidad de trabajadores en cada uno de ellos. Base de datos RH.*/-- De Diego yoel Castillo Chumacero para todos:  05:28 PM
Select D.nombre, COUNT(E.nombre) [Cantidad de trabajadores]From RH..departamento DJoin RH..empleado E on D.iddepartamento = E.iddepartamentoGroup by D.nombre;go

-- De JACKELINE FABIOLA MANRIQUE MONTAÑEZ para todos:  05:29 PM
SELECT D.nombre Departamento, COUNT(E.idempleado) [Cantidad de trabajadores]FROM RH..empleado ERIGHT JOIN RH..departamento D ON E.iddepartamento=D.iddepartamentoGROUP BY D.nombre;GO


-- De Rossmery Tolentino Huaroto para todos:  05:29 PM
SELECT D.nombre Departamento, COUNT(E.IDEMPLEADO)  EMPLEADOSFROM RH..departamento DLEFT JOIN RH..empleado E ON D.iddepartamento=E.iddepartamentoGROUP BY D.nombre;

-- De Mariam Ipanaqué Salinas para todos:  05:32 PM
select D.nombre Departamento, COUNT(E.idempleado) [Cantidad de trabajadores]from RH..empleado Eright join RH..departamento D ON E.iddepartamento=D.iddepartamentogroup by D.nombre;go

-- CROSS JOIN/*FROM <tabla1> CROSS JOIN <tabla2>*/select * from educa..CURSOcross join educa..ALUMNO;go-- Auto JOINselect e.*, concat(j.nombre,' ',e.apellido) jefe from rh..empleado ejoin rh..empleado j on e.jefe = j.idempleado;go