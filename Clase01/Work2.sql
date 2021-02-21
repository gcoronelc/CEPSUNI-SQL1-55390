

CREATE DATABASE BD_DOMINGO;
GO


USE BD_DOMINGO;
GO


CREATE TABLE DEMO(
ID INT NOT NULL IDENTITY,
DATO VARCHAR(100)
);
GO


INSERT INTO DEMO(DATO) VALUES
( 'Dato 1' ),
( 'Dato 2' ),
( 'Dato 3' ),
( 'Dato 4' ),
( 'Dato 5' );

select * from demo;
go


SP_HELPDB EUREKABANK;
GO

-- PRIMARY KEY

CREATE TABLE articulo(
	art_id INT NOT NULL IDENTITY(1,1),
	art_nombre VARCHAR(100) NOT NULL,
	art_precio MONEY NOT NULL,
	CONSTRAINT pk_articulo PRIMARY KEY( art_id )
);
GO


INSERT INTO ARTICULO(art_nombre, art_precio) VALUES
( 'COCINA', 2800.0 ),
( 'REFRIGERADORA', 3500.0 ),
( 'PLANCHA', 360.0 );
GO

SELECT * FROM articulo;
GO


-- Insertar codigo especificos.
-- Códgos: 1001 - 1005

SET IDENTITY_INSERT ARTICULO ON;
GO

INSERT INTO ARTICULO(art_id,art_nombre, art_precio) VALUES
( 1001,'COCINA', 2800.0 ),
( 1002,'REFRIGERADORA', 3500.0 ),
( 1004,'PLANCHA', 360.0 );
GO

SET IDENTITY_INSERT ARTICULO OFF;
GO


INSERT INTO ARTICULO(art_nombre, art_precio) VALUES
( 'MESA', 2800.0 ),
( 'SILLA', 3500.0 ),
( 'MUEBLE', 360.0 );
GO


SELECT * FROM articulo;
GO


CREATE TABLE VENTA(
	idventa  INT NOT NULL IDENTITY(1,1),
	cliente  VARCHAR(100) NOT NULL,
	art_id   INT NOT NULL,
	precio   MONEY NOT NULL,
	cantidad int not null,
	importe  MONEY NOT NULL,
	CONSTRAINT pk_VENTA PRIMARY KEY( idVENTA ),
	CONSTRAINT FK_VENTA_ARTICULO
		FOREIGN KEY (art_id) REFERENCES articulo
);
GO

delete from venta;
go

insert into venta(cliente,art_id,precio,cantidad,importe) values
('Gustavo',1001,0,2,0),
('Laura',1002,0,4,0),
('Gustavo',3,0,7,0),
('Ricardo',1004,0,2,0),
('Delia',1001,0,1,0),
('Alejandra',1005,0,3,0),
('Rafael',1006,0,5,0);
go


SELECT * FROM VENTA;
GO


update venta 
set 
	precio = (select articulo.art_precio from articulo
			  where articulo.art_id = venta.art_id),
	importe = precio * cantidad;
	


