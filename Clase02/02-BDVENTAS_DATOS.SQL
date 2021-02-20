
-- La Base de Datos

USE BDVENTAS;
GO


-- Categorias

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


-- PRODUCTOS - LINEA BLANCA 


-- PRODUCTOS - MUEBLES










