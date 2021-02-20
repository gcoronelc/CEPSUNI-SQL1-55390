

USE BDPERU;
GO

DROP TABLE articulo;
go

CREATE TABLE articulo (
	art_id INT NOT NULL IDENTITY(1,1),
	art_nombre VARCHAR(100) NOT NULL,
	art_pre_costo MONEY NOT NULL,
	art_pre_venta MONEY NOT NULL,
	art_stock INT NOT NULL,
	CONSTRAINT PK_ARTICULO PRIMARY KEY( art_id )
);
GO

INSERT INTO articulo(art_nombre,art_pre_costo,art_pre_venta,art_stock)
values('TELEVISOR',3000.00,5000.00,400);
GO

INSERT INTO articulo(art_nombre,art_pre_costo,art_pre_venta,art_stock)
values('REFRIGERADORA',2780.00,4879.00,500);
GO

INSERT INTO articulo(art_nombre,art_pre_costo,art_pre_venta,art_stock)
values('COCINA', 3500.00,5300.00,300.8);
GO


INSERT INTO articulo(art_nombre,art_pre_costo,art_pre_venta,art_stock)
values('JUEGO DE SALA', 2700.00,5890.00,340);
GO

select * from articulo;
go


/*
Insertar un nuevo articulo con codigo 1000.
*/

SET IDENTITY_INSERT articulo ON
GO

INSERT INTO articulo(art_id,art_nombre,art_pre_costo,art_pre_venta,art_stock)
values(1000,'JUEGO DE SALA', 2700.00,5890.00,340);
GO

SET IDENTITY_INSERT articulo OFF
GO

INSERT INTO articulo(art_nombre,art_pre_costo,art_pre_venta,art_stock)
values('JUEGO DE COMEDOR', 2499.00,4845.00,290);
GO

select * from articulo;
go


drop table venta;
go

create table venta(
	idventa int not null identity(1001,2),
	fecha date not null,
	cliente varchar(100) not null,
	art_id int not null,
	cantidad int not null,
	precio money not null,
	importe money not null,
	CONSTRAINT PK_VENTA PRIMARY KEY(idventa),
	CONSTRAINT FK_VENTA_ARTICULO
		FOREIGN KEY (art_id) REFERENCES ARTICULO
);
go

insert into venta(fecha,cliente,art_id,cantidad,precio,importe)
values(CONVERT (datetime, '05/01/2021', 103),'Gustavo',3,3,4000.0,0);
go

insert into venta(fecha,cliente,art_id,cantidad,precio,importe)
values('20210114','Karla',2,1,10000.0,0);
go

insert into venta(fecha,cliente,art_id,cantidad,precio,importe)
values(getdate(),'Alejandra',1000,2,100000.0,0);
go

insert into venta(fecha,cliente,art_id,cantidad,precio,importe)
values(getdate(),'Ricardo',1001,5,100000.0,0);
go

select * from venta;
go


-- Actualizar el procio de venta

update venta 
set precio = 0, importe = 0;
go

update venta 
set precio = (select art_pre_venta 
			  from articulo 
			  where articulo.art_id = venta.art_id),
	importe = precio * cantidad;
go

select * from venta;
go

