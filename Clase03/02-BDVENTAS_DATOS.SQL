
-- La Base de Datos

USE BDVENTAS;
GO


-- Categorias

DELETE FROM CATEGORIA;
GO

SET IDENTITY_INSERT CATEGORIA ON;
GO

insert into categoria( idcategoria, nombre ) values
( 1, 'LINEA BLANCA' ),
( 2, 'MENAJE' ),
( 3, 'MUEBLES' );
GO

SET IDENTITY_INSERT CATEGORIA OFF;
GO

select * from categoria;
go

-- PRODUCTOS - MENAJE
-- Codigos del 1001 al 1100

SET IDENTITY_INSERT PRODUCTO ON;
GO

insert into producto(idproducto,nombre,idcategoria,precio,stock) values
(1001,'CUBIERTOS 48 PIEZAS',2,89.00,200),
(1002,'JUEGO DE PLATOS 24 PIEZAS',2,230.00,180);

SET IDENTITY_INSERT PRODUCTO OFF;
GO


-- PRODUCTOS - LINEA BLANCA 




-- PRODUCTOS - MUEBLES





-- EMPLEADOS


-- USUARIOS


-- CLIENTES



-- VENTAS


-- DETALLES DE VENTAS








