-- PRIMARY KEY
-- ---------------------------------------------------------------------


SET IDENTITY_INSERT PRODUCTO ON;
GO

insert into producto(idproducto,nombre,idcategoria,precio,stock) 
values (1003,'JUEGO DE OLLAS',2,350.00,200);

-- Este insert da error

insert into producto(idproducto,nombre,idcategoria,precio,stock) 
values (1003,'CUCHILLOS',2,180.00,100);

SET IDENTITY_INSERT PRODUCTO OFF;
GO



-- UNIQUE
-- ------------------------------------------------------------------

SET IDENTITY_INSERT PRODUCTO ON;
GO

insert into producto(idproducto,nombre,idcategoria,precio,stock) 
values (1005,'JUEGO DE OLLAS',2,350.00,200);
GO

SELECT * FROM PRODUCTO;
GO

alter table producto 
add constraint U_PRODUCTO_NOMBRE
unique ( nombre );
go


delete from producto 
where idproducto = 1005;
go

alter table producto 
add constraint U_PRODUCTO_NOMBRE
unique ( nombre );
go

-- Este insert genera error

insert into producto(idproducto,nombre,idcategoria,precio,stock) 
values (1005,'JUEGO DE OLLAS',2,350.00,200);
GO


SET IDENTITY_INSERT PRODUCTO OFF;
GO


-- check
-------------------------------------------------------------

alter table PRODUCTO
add constraint CK_PRODUCTO_PRECIO 
CHECK (precio > 0.0);
GO

SET IDENTITY_INSERT PRODUCTO ON;
GO

-- Este insert genera error, por el precio.

insert into producto(idproducto,nombre,idcategoria,precio,stock) 
values (1008,'JUEGO DE SARTENES',2,-350.00,200);
GO


-- Otro ejemplo

alter table detalle
add constraint ck_detalle_importes
check( (precio*cantidad) = subtotal );
go





