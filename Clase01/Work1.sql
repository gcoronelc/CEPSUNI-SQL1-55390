
USE BDCOLOMBIA;
GO

CREATE DATABASE BDCOLOMBIA;
GO


SELECT * FROM CLIENTE;
GO


SELECT * FROM EDUTEC.DBO.Alumno;
GO

SELECT * FROM EDUTEC..Alumno;
GO


sp_helpdb BDCOLOMBIA;
GO

SP_HELP CLIENTE;
GO


PRINT 'Hola desde Perú';
GO 100



CREATE TABLE dbo.articulo (
	art_id INT NOT NULL IDENTITY(1,1),
	art_nombre VARCHAR(100) NOT NULL,
	art_precio MONEY NOT NULL,
	CONSTRAINT pk_articulo PRIMARY KEY(art_id)
)
GO


insert into dbo.articulo(art_nombre,art_precio) values('Biscocho', 2.50);
go

select * from dbo.articulo;
go













