-----------------
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



