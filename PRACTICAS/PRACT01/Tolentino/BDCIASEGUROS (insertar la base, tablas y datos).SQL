

-- =============================================
-- Creación de la Base de Datos de Compañia de Seguros
-- =============================================

USE master;
go

IF( EXISTS ( SELECT name FROM master.sys.databases WHERE name = 'BDCIASEGUROS' ) )
BEGIN
	DROP DATABASE BDCIASEGUROS;
END;
go

CREATE DATABASE BDCIASEGUROS;
go


-- =============================================
-- Seleccionar la Base de Datos
-- =============================================

USE BDCIASEGUROS;
GO




CREATE TABLE Medio_de_Pago
( 
	ID_Codigo_MP         numeric(10) IDENTITY ( 1,1 ) ,
	Nombre_MP            varchar(20)  NOT NULL ,
	CONSTRAINT XPKMedio_de_Pago PRIMARY KEY (ID_Codigo_MP ASC)
)
go



CREATE TABLE Cuotas
( 
	ID_Cuotas            numeric(5)  NOT NULL ,
	Cuota_Prima          numeric(5)  NOT NULL ,
	Cuota_Moneda         varchar(20)  NOT NULL ,
	Cuota_de_fecha_efectiva datetime  NOT NULL ,
	Cuota_de_fecha_cobro datetime  NOT NULL ,
	Cuota_firma_soles    numeric(10)  NOT NULL ,
	ID_Codigo_MP         numeric(10)  NOT NULL ,
	CONSTRAINT XPKCuotas PRIMARY KEY (ID_Cuotas ASC),
	CONSTRAINT FK_Cuotas_Medio_de_Pago FOREIGN KEY (ID_Codigo_MP) REFERENCES Medio_de_Pago(ID_Codigo_MP)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
)
go



CREATE TABLE Cobranzas
( 
	ID_Recibo            numeric(6)  NOT NULL ,
	Cuota_tipo_movimiento varchar(20)  NOT NULL ,
	Cobranza_Numero_Intentos numeric(7)  NOT NULL ,
	Cobranza_Dias_nora   numeric(7)  NOT NULL ,
	ID_Cuotas            numeric(5)  NOT NULL ,
	CONSTRAINT XPKCobranzas PRIMARY KEY (ID_Recibo ASC),
	CONSTRAINT FK_Cuotas_Cobranzas FOREIGN KEY (ID_Cuotas) REFERENCES Cuotas(ID_Cuotas)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
)
go



CREATE TABLE Clientes
( 
	DNI_Cliente          numeric(10)  NOT NULL ,
	Cliente_Dirección    varchar(50)  NOT NULL ,
	Cliente_Distrito     varchar(20)  NOT NULL ,
	Cliente_Provincia    varchar(20)  NOT NULL ,
	Cliente_Departamento varchar(20)  NOT NULL ,
	Cliente_Nombre       varchar(20)  NOT NULL ,
	Cliente_Email        varchar(20)  NOT NULL ,
	Cliente_Edad         numeric(2)  NOT NULL ,
	Cliente_Telefono     numeric(12)  NOT NULL ,
	CONSTRAINT XPKClientes PRIMARY KEY (DNI_Cliente ASC)
)
go



CREATE TABLE Compañia
( 
	ID_Compañia          numeric(10) IDENTITY ( 1,1 ) ,
	Compañia_Nombre      varchar(20)  NOT NULL ,
	CONSTRAINT XPKCompañia PRIMARY KEY (ID_Compañia ASC)
)
go



CREATE TABLE Productos
( 
	ID_Producto          numeric(10) IDENTITY ( 1,1 ) ,
	Sub_Producto         varchar(20)  NOT NULL ,
	Producto_Nombre      varchar(30)  NOT NULL ,
	Producto_Ramo        varchar(20)  NOT NULL ,
	Producto_Numero_de_cuotas numeric(2)  NOT NULL ,
	Producto_Cantidad_de_Periodos numeric(3)  NOT NULL ,
	Producto_Numero_de_certificado numeric(15)  NOT NULL ,
	ID_Compañia          numeric(10)  NOT NULL ,
	CONSTRAINT XPKProductos PRIMARY KEY (ID_Producto ASC),
	CONSTRAINT FK_Compañia_Productos FOREIGN KEY (ID_Compañia) REFERENCES Compañia(ID_Compañia)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
)
go



CREATE TABLE Anulaciones
( 
	ID_Anulación         numeric(10) IDENTITY ( 1,1 ) ,
	Anulación_Motivo     varchar(20)  NOT NULL ,
	Anulación_fecha      datetime  NOT NULL ,
	CONSTRAINT XPKAnulaciones PRIMARY KEY (ID_Anulación ASC)
)
go



CREATE TABLE Endosos
( 
	ID_Endosos           numeric(10) IDENTITY ( 1,1 ) ,
	Endoso_Nombre        varchar(20)  NOT NULL ,
	Endoso_Fecha         datetime  NOT NULL ,
	Endoso_usuario       varchar(20)  NOT NULL ,
	Endoso_solicitud     varchar(20)  NOT NULL ,
	CONSTRAINT XPKEndosos PRIMARY KEY (ID_Endosos ASC)
)
go



CREATE TABLE USUARIO
( 
	ID_Empleado          varchar(20)  NOT NULL ,
	Usuario              varchar(20)  NOT NULL ,
	Clave                varchar(20)  NOT NULL ,
	CONSTRAINT XPKUSUARIO PRIMARY KEY (ID_Empleado ASC)
)
go



CREATE TABLE Poliza
( 
	Propuesta            numeric(10)  NOT NULL ,
	Propuesta_Ini_Vigencia datetime  NOT NULL ,
	Propuesta_Fin_Vigencia datetime  NOT NULL ,
	Propuesta_Dia_cobro_mensual numeric(5)  NOT NULL ,
	Poliza_Estado        varchar(20)  NOT NULL ,
	Poliza_Numero_de_tarjeta numeric(20)  NOT NULL ,
	Poliza_mes           numeric(2)  NOT NULL ,
	Poliza_año           numeric(4)  NOT NULL ,
	Poliza_fecha_emisión datetime  NOT NULL ,
	Poliza_Banco         varchar(20)  NOT NULL ,
	DNI_Cliente          numeric(10)  NOT NULL ,
	ID_Producto          numeric(10)  NOT NULL ,
	ID_Anulación         numeric(10)  NOT NULL ,
	ID_Endosos           numeric(10)  NOT NULL ,
	ID_Cuotas            numeric(5)  NOT NULL ,
	ID_Empleado          varchar(20)  NOT NULL ,
	CONSTRAINT XPKPoliza PRIMARY KEY (Propuesta ASC),
	CONSTRAINT FK_Clientes_Poliza FOREIGN KEY (DNI_Cliente) REFERENCES Clientes(DNI_Cliente)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,
CONSTRAINT FK_Productos_Polizas FOREIGN KEY (ID_Producto) REFERENCES Productos(ID_Producto)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,
CONSTRAINT FK_Poliza_Anulaciones FOREIGN KEY (ID_Anulación) REFERENCES Anulaciones(ID_Anulación)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,
CONSTRAINT FK_Poliza_Endosos FOREIGN KEY (ID_Endosos) REFERENCES Endosos(ID_Endosos)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,
CONSTRAINT FK_Poliza_Cuotas FOREIGN KEY (ID_Cuotas) REFERENCES Cuotas(ID_Cuotas)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,
CONSTRAINT FK_Usuario_Poliza FOREIGN KEY (ID_Empleado) REFERENCES USUARIO(ID_Empleado)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
)
go
---------------------------
--insertar datos
------------------------

Select * from Clientes;
go

Insert Into Clientes (DNI_Cliente,Cliente_Dirección,Cliente_Distrito,Cliente_Provincia,Cliente_Departamento,Cliente_Nombre,Cliente_Email,Cliente_Edad,Cliente_Telefono)
Values
(72685678,'AV Mariategui 278','Santiago de Surco','Lima','Lima','Eduardo Vargas Pozo','Eduardo29@gmail.com',24,978567453),
(45673421,'AV Las esmeraldas 23','Miraflores','Lima','Lima','Rocio Amelia Ruiz','Rocio2345@gmail.com',29,982456345),
(76540976,'AV Oscar Benavides 890','Breña','Lima','Lima','Rosa Condori Yauyos','Rosa22@gmail.com',34,965456654),
(43678902,'AV Morro Solar','San Isidro','Lima','Lima','Vilmer Castro Ruiz','Vilm.ruiz@gmail.com',27,990327564);
Go

Select * from USUARIO;
go

Insert Into USUARIO (ID_Empleado,Usuario,Clave)
Values
('PE0102342','0102342','XX0102342.');
GO

Select *  from Compañia;
go

Insert Into Compañia (Compañia_Nombre)
values
('Pacifico Seguros'),
('Rimac'),
('Mapfre'),
('La Positiva'),
('Interseguro');
go

Select * from Medio_de_Pago;
go

Insert into Medio_de_Pago (Nombre_MP)
values
('Tarjeta de debito'),
('Tarjeta de credito'),
('Efectivo');
go

select *from Productos;
go

Insert into Productos (Sub_Producto,Producto_Nombre,Producto_Ramo,Producto_Numero_de_cuotas,Producto_Cantidad_de_Periodos,Producto_Numero_de_certificado,ID_Compañia)
Values
('APC21','Autobianual','Auto',24,2,587,1),
('ALV4','Autoanual','Auto',12,1,545,2),
('SPUV54','Bienestartotal','Salud',12,1,756,3),
('VP567','Vidacondevolucion','Vida',12,5,876,4);
go



Select * from cuotas;
go

Insert into cuotas (ID_Cuotas,Cuota_Prima,Cuota_Moneda,Cuota_de_fecha_efectiva,Cuota_de_fecha_cobro,Cuota_firma_soles,ID_Codigo_MP)
values
(12,50,'Dolar',CONVERT(char(19),'2021/02/12',113),CONVERT(char(19),'2021/02/12',113),180,1),
(23,60,'SoLes',CONVERT(char(19),'2021/02/17',113),CONVERT(char(19),'2021/02/22',113),60,1),
(223,100,'Dolar',CONVERT(char(19),'2021/02/22',113),CONVERT(char(19),'2021/02/22',113),360,2),
(290,10,'Soles',CONVERT(char(19),'2021/02/12',113),CONVERT(char(19),'2021/02/12',113),10,1);
go

Select * from endosos;
go

INSERT INTO Endosos(Endoso_nombre,ENDOSO_FECHA,ENDOSO_USUARIO,ENDOSO_SOLICITUD)VALUES
('CAMBIO CONTRATANTE',	CONVERT(char(19),'2021/02/12',113),'SESPINOZA',10),('CAMBIO PLASTICO',	CONVERT(char(19),'2021/02/12',113),'SESPINOZA',20);
GO

Select * from anulaciones;
go

INSERT INTO anulaciones(Anulación_Motivo,Anulación_fecha)VALUES
('No anulado',	SYSDATETIME()),('Por morosidad',	CONVERT(char(19),'2021/02/12',113)),('Mala venta',	CONVERT(char(19),'2021/02/22',113));
GO

Select * from Poliza;
go

Insert into Poliza (Propuesta,Propuesta_Ini_Vigencia,Propuesta_Fin_Vigencia,Propuesta_Dia_cobro_mensual,Poliza_Estado,Poliza_Numero_de_tarjeta,Poliza_mes,Poliza_año,Poliza_fecha_emisión,Poliza_Banco,DNI_Cliente,ID_Producto,ID_Anulación,ID_Endosos,ID_Cuotas,ID_Empleado)
values
(67400,CONVERT(char(19),'2021-02-10',113),CONVERT(char(19),'2022-02-10',113),12,'Vigente',455734001200,01,2024,CONVERT(char(19),'2021-02-10',113),'BCP',72685678,1,1,2,12,'PE0102342'),
(56000,CONVERT(char(19),'2021-01-25',113),CONVERT(char(19),'2023-01-25',113),27,'Vigente',455500982222,03,2025,CONVERT(char(19),'2021-01-25',113),'Interbank',45673421,2,1,2,23,'PE0102342'),
(00656,CONVERT(char(19),'2020-12-10',113),CONVERT(char(19),'2021-12-10',113),12,'Anulado',455490007722,09,2022,CONVERT(char(19),'2020-12-10',113),'Pichincha',76540976,3,2,1,223,'PE0102342'),
(22345,CONVERT(char(19),'2020-08-22',113),CONVERT(char(19),'2021-08-22',113),22,'Vigente',455296522341,02,2023,CONVERT(char(19),'2020-08-22',113),'BBVA',43678902,4,1,2,290,'PE0102342');
GO

Select * from Cobranzas;
go

INSERT INTO Cobranzas(ID_Recibo,Cuota_tipo_movimiento,Cobranza_Numero_Intentos,Cobranza_Dias_nora,ID_Cuotas)VALUES
(1,'cuota_normal',0,0,12),(2,'cuota_normal',1,5,23),(3,'cuota_normal',2,10,290);
GO



