
CREATE TABLE Anulaciones
( 
	ID_Anulación         numeric(10) IDENTITY ( 1,1 ) ,
	Anulación_Motivo     varchar(20)  NOT NULL ,
	Anulación_fecha      datetime  NOT NULL 
)
go



ALTER TABLE Anulaciones
	ADD CONSTRAINT XPKAnulaciones PRIMARY KEY  CLUSTERED (ID_Anulación ASC)
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
	Cliente_Telefono     numeric(12)  NOT NULL 
)
go



ALTER TABLE Clientes
	ADD CONSTRAINT XPKClientes PRIMARY KEY  CLUSTERED (DNI_Cliente ASC)
go



CREATE TABLE Cobranzas
( 
	ID_Recibo            numeric(6)  NOT NULL ,
	Cuota_tipo_movimiento varchar(20)  NOT NULL ,
	Cobranza_Numero_Intentos numeric(7)  NOT NULL ,
	Cobranza_Dias_nora   numeric(7)  NOT NULL ,
	ID_Cuotas            numeric(5)  NOT NULL 
)
go



ALTER TABLE Cobranzas
	ADD CONSTRAINT XPKCobranzas PRIMARY KEY  CLUSTERED (ID_Recibo ASC)
go



CREATE TABLE Compañia
( 
	ID_Compañia          numeric(10) IDENTITY ( 1,1 ) ,
	Compañia_Nombre      varchar(20)  NOT NULL 
)
go



ALTER TABLE Compañia
	ADD CONSTRAINT XPKCompañia PRIMARY KEY  CLUSTERED (ID_Compañia ASC)
go



CREATE TABLE Cuotas
( 
	ID_Cuotas            numeric(5)  NOT NULL ,
	Cuota_Prima          numeric(5)  NOT NULL ,
	Cuota_Moneda         varchar(20)  NOT NULL ,
	Cuota_de_fecha_efectiva datetime  NOT NULL ,
	Cuota_de_fecha_cobro datetime  NOT NULL ,
	Cuota_firma_soles    numeric(10)  NOT NULL ,
	ID_Codigo_MP         numeric(10)  NOT NULL 
)
go



ALTER TABLE Cuotas
	ADD CONSTRAINT XPKCuotas PRIMARY KEY  CLUSTERED (ID_Cuotas ASC)
go



CREATE TABLE Endosos
( 
	ID_Endosos           numeric(10) IDENTITY ( 1,1 ) ,
	Endoso_Nombre        varchar(20)  NOT NULL ,
	Endoso_Fecha         datetime  NOT NULL ,
	Endoso_usuario       varchar(20)  NOT NULL ,
	Endoso_solicitud     varchar(20)  NOT NULL 
)
go



ALTER TABLE Endosos
	ADD CONSTRAINT XPKEndosos PRIMARY KEY  CLUSTERED (ID_Endosos ASC)
go



CREATE TABLE Medio_de_Pago
( 
	ID_Codigo_MP         numeric(10) IDENTITY ( 1,1 ) ,
	Nombre_MP            varchar(20)  NOT NULL 
)
go



ALTER TABLE Medio_de_Pago
	ADD CONSTRAINT XPKMedio_de_Pago PRIMARY KEY  CLUSTERED (ID_Codigo_MP ASC)
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
	ID_Empleado          varchar(20)  NOT NULL 
)
go



ALTER TABLE Poliza
	ADD CONSTRAINT XPKPoliza PRIMARY KEY  CLUSTERED (Propuesta ASC)
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
	ID_Compañia          numeric(10)  NOT NULL 
)
go



ALTER TABLE Productos
	ADD CONSTRAINT XPKProductos PRIMARY KEY  CLUSTERED (ID_Producto ASC)
go



CREATE TABLE USUARIO
( 
	ID_Empleado          varchar(20)  NOT NULL ,
	Usuario              varchar(20)  NOT NULL ,
	Clave                varchar(20)  NOT NULL 
)
go



ALTER TABLE USUARIO
	ADD CONSTRAINT XPKUSUARIO PRIMARY KEY  CLUSTERED (ID_Empleado ASC)
go




ALTER TABLE Cobranzas
	ADD CONSTRAINT FK_Cuotas_Cobranzas FOREIGN KEY (ID_Cuotas) REFERENCES Cuotas(ID_Cuotas)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE Cuotas
	ADD CONSTRAINT FK_Cuotas_Medio_de_Pago FOREIGN KEY (ID_Codigo_MP) REFERENCES Medio_de_Pago(ID_Codigo_MP)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE Poliza
	ADD CONSTRAINT FK_Clientes_Poliza FOREIGN KEY (DNI_Cliente) REFERENCES Clientes(DNI_Cliente)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE Poliza
	ADD CONSTRAINT FK_Productos_Polizas FOREIGN KEY (ID_Producto) REFERENCES Productos(ID_Producto)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE Poliza
	ADD CONSTRAINT FK_Poliza_Anulaciones FOREIGN KEY (ID_Anulación) REFERENCES Anulaciones(ID_Anulación)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE Poliza
	ADD CONSTRAINT FK_Poliza_Endosos FOREIGN KEY (ID_Endosos) REFERENCES Endosos(ID_Endosos)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE Poliza
	ADD CONSTRAINT FK_Poliza_Cuotas FOREIGN KEY (ID_Cuotas) REFERENCES Cuotas(ID_Cuotas)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE Poliza
	ADD CONSTRAINT FK_Usuario_Poliza FOREIGN KEY (ID_Empleado) REFERENCES USUARIO(ID_Empleado)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE Productos
	ADD CONSTRAINT FK_Compañia_Productos FOREIGN KEY (ID_Compañia) REFERENCES Compañia(ID_Compañia)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




CREATE TRIGGER tD_Anulaciones ON Anulaciones FOR DELETE AS
/* ERwin Builtin Trigger */
/* DELETE trigger on Anulaciones */
BEGIN
  DECLARE  @errno   int,
           @errmsg  varchar(255)
    /* ERwin Builtin Trigger */
    /* Anulaciones  Poliza on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="0000fd2e", PARENT_OWNER="", PARENT_TABLE="Anulaciones"
    CHILD_OWNER="", CHILD_TABLE="Poliza"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Poliza_Anulaciones", FK_COLUMNS="ID_Anulación" */
    IF EXISTS (
      SELECT * FROM deleted,Poliza
      WHERE
        /*  %JoinFKPK(Poliza,deleted," = "," AND") */
        Poliza.ID_Anulación = deleted.ID_Anulación
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Anulaciones because Poliza exists.'
      GOTO ERROR
    END


    /* ERwin Builtin Trigger */
    RETURN
ERROR:
    raiserror @errno @errmsg
    rollback transaction
END

go


CREATE TRIGGER tU_Anulaciones ON Anulaciones FOR UPDATE AS
/* ERwin Builtin Trigger */
/* UPDATE trigger on Anulaciones */
BEGIN
  DECLARE  @NUMROWS int,
           @nullcnt int,
           @validcnt int,
           @insID_Anulación numeric(10),
           @errno   int,
           @errmsg  varchar(255)

  SELECT @NUMROWS = @@rowcount
  /* ERwin Builtin Trigger */
  /* Anulaciones  Poliza on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="000116b4", PARENT_OWNER="", PARENT_TABLE="Anulaciones"
    CHILD_OWNER="", CHILD_TABLE="Poliza"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Poliza_Anulaciones", FK_COLUMNS="ID_Anulación" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(ID_Anulación)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Poliza
      WHERE
        /*  %JoinFKPK(Poliza,deleted," = "," AND") */
        Poliza.ID_Anulación = deleted.ID_Anulación
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Anulaciones because Poliza exists.'
      GOTO ERROR
    END
  END


  /* ERwin Builtin Trigger */
  RETURN
ERROR:
    raiserror @errno @errmsg
    rollback transaction
END

go




CREATE TRIGGER tD_Clientes ON Clientes FOR DELETE AS
/* ERwin Builtin Trigger */
/* DELETE trigger on Clientes */
BEGIN
  DECLARE  @errno   int,
           @errmsg  varchar(255)
    /* ERwin Builtin Trigger */
    /* Clientes  Poliza on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="0000feeb", PARENT_OWNER="", PARENT_TABLE="Clientes"
    CHILD_OWNER="", CHILD_TABLE="Poliza"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Clientes_Poliza", FK_COLUMNS="DNI_Cliente" */
    IF EXISTS (
      SELECT * FROM deleted,Poliza
      WHERE
        /*  %JoinFKPK(Poliza,deleted," = "," AND") */
        Poliza.DNI_Cliente = deleted.DNI_Cliente
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Clientes because Poliza exists.'
      GOTO ERROR
    END


    /* ERwin Builtin Trigger */
    RETURN
ERROR:
    raiserror @errno @errmsg
    rollback transaction
END

go


CREATE TRIGGER tU_Clientes ON Clientes FOR UPDATE AS
/* ERwin Builtin Trigger */
/* UPDATE trigger on Clientes */
BEGIN
  DECLARE  @NUMROWS int,
           @nullcnt int,
           @validcnt int,
           @insDNI_Cliente numeric(10),
           @errno   int,
           @errmsg  varchar(255)

  SELECT @NUMROWS = @@rowcount
  /* ERwin Builtin Trigger */
  /* Clientes  Poliza on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="000110ae", PARENT_OWNER="", PARENT_TABLE="Clientes"
    CHILD_OWNER="", CHILD_TABLE="Poliza"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Clientes_Poliza", FK_COLUMNS="DNI_Cliente" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(DNI_Cliente)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Poliza
      WHERE
        /*  %JoinFKPK(Poliza,deleted," = "," AND") */
        Poliza.DNI_Cliente = deleted.DNI_Cliente
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Clientes because Poliza exists.'
      GOTO ERROR
    END
  END


  /* ERwin Builtin Trigger */
  RETURN
ERROR:
    raiserror @errno @errmsg
    rollback transaction
END

go




CREATE TRIGGER tD_Cobranzas ON Cobranzas FOR DELETE AS
/* ERwin Builtin Trigger */
/* DELETE trigger on Cobranzas */
BEGIN
  DECLARE  @errno   int,
           @errmsg  varchar(255)
    /* ERwin Builtin Trigger */
    /* Cuotas  Cobranzas on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00012a4b", PARENT_OWNER="", PARENT_TABLE="Cuotas"
    CHILD_OWNER="", CHILD_TABLE="Cobranzas"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Cuotas_Cobranzas", FK_COLUMNS="ID_Cuotas" */
    IF EXISTS (SELECT * FROM deleted,Cuotas
      WHERE
        /* %JoinFKPK(deleted,Cuotas," = "," AND") */
        deleted.ID_Cuotas = Cuotas.ID_Cuotas AND
        NOT EXISTS (
          SELECT * FROM Cobranzas
          WHERE
            /* %JoinFKPK(Cobranzas,Cuotas," = "," AND") */
            Cobranzas.ID_Cuotas = Cuotas.ID_Cuotas
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Cobranzas because Cuotas exists.'
      GOTO ERROR
    END


    /* ERwin Builtin Trigger */
    RETURN
ERROR:
    raiserror @errno @errmsg
    rollback transaction
END

go


CREATE TRIGGER tU_Cobranzas ON Cobranzas FOR UPDATE AS
/* ERwin Builtin Trigger */
/* UPDATE trigger on Cobranzas */
BEGIN
  DECLARE  @NUMROWS int,
           @nullcnt int,
           @validcnt int,
           @insID_Recibo numeric(6),
           @errno   int,
           @errmsg  varchar(255)

  SELECT @NUMROWS = @@rowcount
  /* ERwin Builtin Trigger */
  /* Cuotas  Cobranzas on child update no action */
  /* ERWIN_RELATION:CHECKSUM="000145f7", PARENT_OWNER="", PARENT_TABLE="Cuotas"
    CHILD_OWNER="", CHILD_TABLE="Cobranzas"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Cuotas_Cobranzas", FK_COLUMNS="ID_Cuotas" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(ID_Cuotas)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Cuotas
        WHERE
          /* %JoinFKPK(inserted,Cuotas) */
          inserted.ID_Cuotas = Cuotas.ID_Cuotas
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @NUMROWS
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Cobranzas because Cuotas does not exist.'
      GOTO ERROR
    END
  END


  /* ERwin Builtin Trigger */
  RETURN
ERROR:
    raiserror @errno @errmsg
    rollback transaction
END

go




CREATE TRIGGER tD_Compañia ON Compañia FOR DELETE AS
/* ERwin Builtin Trigger */
/* DELETE trigger on Compañia */
BEGIN
  DECLARE  @errno   int,
           @errmsg  varchar(255)
    /* ERwin Builtin Trigger */
    /* Compañia  Productos on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="0000f6f4", PARENT_OWNER="", PARENT_TABLE="Compañia"
    CHILD_OWNER="", CHILD_TABLE="Productos"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Compañia_Productos", FK_COLUMNS="ID_Compañia" */
    IF EXISTS (
      SELECT * FROM deleted,Productos
      WHERE
        /*  %JoinFKPK(Productos,deleted," = "," AND") */
        Productos.ID_Compañia = deleted.ID_Compañia
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Compañia because Productos exists.'
      GOTO ERROR
    END


    /* ERwin Builtin Trigger */
    RETURN
ERROR:
    raiserror @errno @errmsg
    rollback transaction
END

go


CREATE TRIGGER tU_Compañia ON Compañia FOR UPDATE AS
/* ERwin Builtin Trigger */
/* UPDATE trigger on Compañia */
BEGIN
  DECLARE  @NUMROWS int,
           @nullcnt int,
           @validcnt int,
           @insID_Compañia numeric(10),
           @errno   int,
           @errmsg  varchar(255)

  SELECT @NUMROWS = @@rowcount
  /* ERwin Builtin Trigger */
  /* Compañia  Productos on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00010e72", PARENT_OWNER="", PARENT_TABLE="Compañia"
    CHILD_OWNER="", CHILD_TABLE="Productos"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Compañia_Productos", FK_COLUMNS="ID_Compañia" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(ID_Compañia)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Productos
      WHERE
        /*  %JoinFKPK(Productos,deleted," = "," AND") */
        Productos.ID_Compañia = deleted.ID_Compañia
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Compañia because Productos exists.'
      GOTO ERROR
    END
  END


  /* ERwin Builtin Trigger */
  RETURN
ERROR:
    raiserror @errno @errmsg
    rollback transaction
END

go




CREATE TRIGGER tD_Cuotas ON Cuotas FOR DELETE AS
/* ERwin Builtin Trigger */
/* DELETE trigger on Cuotas */
BEGIN
  DECLARE  @errno   int,
           @errmsg  varchar(255)
    /* ERwin Builtin Trigger */
    /* Cuotas  Poliza on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="0003285d", PARENT_OWNER="", PARENT_TABLE="Cuotas"
    CHILD_OWNER="", CHILD_TABLE="Poliza"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Poliza_Cuotas", FK_COLUMNS="ID_Cuotas" */
    IF EXISTS (
      SELECT * FROM deleted,Poliza
      WHERE
        /*  %JoinFKPK(Poliza,deleted," = "," AND") */
        Poliza.ID_Cuotas = deleted.ID_Cuotas
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Cuotas because Poliza exists.'
      GOTO ERROR
    END

    /* ERwin Builtin Trigger */
    /* Cuotas  Cobranzas on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Cuotas"
    CHILD_OWNER="", CHILD_TABLE="Cobranzas"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Cuotas_Cobranzas", FK_COLUMNS="ID_Cuotas" */
    IF EXISTS (
      SELECT * FROM deleted,Cobranzas
      WHERE
        /*  %JoinFKPK(Cobranzas,deleted," = "," AND") */
        Cobranzas.ID_Cuotas = deleted.ID_Cuotas
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Cuotas because Cobranzas exists.'
      GOTO ERROR
    END

    /* ERwin Builtin Trigger */
    /* Medio_de_Pago  Cuotas on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Medio_de_Pago"
    CHILD_OWNER="", CHILD_TABLE="Cuotas"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Cuotas_Medio_de_Pago", FK_COLUMNS="ID_Codigo_MP" */
    IF EXISTS (SELECT * FROM deleted,Medio_de_Pago
      WHERE
        /* %JoinFKPK(deleted,Medio_de_Pago," = "," AND") */
        deleted.ID_Codigo_MP = Medio_de_Pago.ID_Codigo_MP AND
        NOT EXISTS (
          SELECT * FROM Cuotas
          WHERE
            /* %JoinFKPK(Cuotas,Medio_de_Pago," = "," AND") */
            Cuotas.ID_Codigo_MP = Medio_de_Pago.ID_Codigo_MP
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Cuotas because Medio_de_Pago exists.'
      GOTO ERROR
    END


    /* ERwin Builtin Trigger */
    RETURN
ERROR:
    raiserror @errno @errmsg
    rollback transaction
END

go


CREATE TRIGGER tU_Cuotas ON Cuotas FOR UPDATE AS
/* ERwin Builtin Trigger */
/* UPDATE trigger on Cuotas */
BEGIN
  DECLARE  @NUMROWS int,
           @nullcnt int,
           @validcnt int,
           @insID_Cuotas numeric(5),
           @errno   int,
           @errmsg  varchar(255)

  SELECT @NUMROWS = @@rowcount
  /* ERwin Builtin Trigger */
  /* Cuotas  Poliza on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="0003706f", PARENT_OWNER="", PARENT_TABLE="Cuotas"
    CHILD_OWNER="", CHILD_TABLE="Poliza"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Poliza_Cuotas", FK_COLUMNS="ID_Cuotas" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(ID_Cuotas)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Poliza
      WHERE
        /*  %JoinFKPK(Poliza,deleted," = "," AND") */
        Poliza.ID_Cuotas = deleted.ID_Cuotas
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Cuotas because Poliza exists.'
      GOTO ERROR
    END
  END

  /* ERwin Builtin Trigger */
  /* Cuotas  Cobranzas on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Cuotas"
    CHILD_OWNER="", CHILD_TABLE="Cobranzas"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Cuotas_Cobranzas", FK_COLUMNS="ID_Cuotas" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(ID_Cuotas)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Cobranzas
      WHERE
        /*  %JoinFKPK(Cobranzas,deleted," = "," AND") */
        Cobranzas.ID_Cuotas = deleted.ID_Cuotas
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Cuotas because Cobranzas exists.'
      GOTO ERROR
    END
  END

  /* ERwin Builtin Trigger */
  /* Medio_de_Pago  Cuotas on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Medio_de_Pago"
    CHILD_OWNER="", CHILD_TABLE="Cuotas"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Cuotas_Medio_de_Pago", FK_COLUMNS="ID_Codigo_MP" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(ID_Codigo_MP)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Medio_de_Pago
        WHERE
          /* %JoinFKPK(inserted,Medio_de_Pago) */
          inserted.ID_Codigo_MP = Medio_de_Pago.ID_Codigo_MP
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @NUMROWS
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Cuotas because Medio_de_Pago does not exist.'
      GOTO ERROR
    END
  END


  /* ERwin Builtin Trigger */
  RETURN
ERROR:
    raiserror @errno @errmsg
    rollback transaction
END

go




CREATE TRIGGER tD_Endosos ON Endosos FOR DELETE AS
/* ERwin Builtin Trigger */
/* DELETE trigger on Endosos */
BEGIN
  DECLARE  @errno   int,
           @errmsg  varchar(255)
    /* ERwin Builtin Trigger */
    /* Endosos  Poliza on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="0000f2b2", PARENT_OWNER="", PARENT_TABLE="Endosos"
    CHILD_OWNER="", CHILD_TABLE="Poliza"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Poliza_Endosos", FK_COLUMNS="ID_Endosos" */
    IF EXISTS (
      SELECT * FROM deleted,Poliza
      WHERE
        /*  %JoinFKPK(Poliza,deleted," = "," AND") */
        Poliza.ID_Endosos = deleted.ID_Endosos
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Endosos because Poliza exists.'
      GOTO ERROR
    END


    /* ERwin Builtin Trigger */
    RETURN
ERROR:
    raiserror @errno @errmsg
    rollback transaction
END

go


CREATE TRIGGER tU_Endosos ON Endosos FOR UPDATE AS
/* ERwin Builtin Trigger */
/* UPDATE trigger on Endosos */
BEGIN
  DECLARE  @NUMROWS int,
           @nullcnt int,
           @validcnt int,
           @insID_Endosos numeric(10),
           @errno   int,
           @errmsg  varchar(255)

  SELECT @NUMROWS = @@rowcount
  /* ERwin Builtin Trigger */
  /* Endosos  Poliza on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00010c21", PARENT_OWNER="", PARENT_TABLE="Endosos"
    CHILD_OWNER="", CHILD_TABLE="Poliza"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Poliza_Endosos", FK_COLUMNS="ID_Endosos" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(ID_Endosos)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Poliza
      WHERE
        /*  %JoinFKPK(Poliza,deleted," = "," AND") */
        Poliza.ID_Endosos = deleted.ID_Endosos
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Endosos because Poliza exists.'
      GOTO ERROR
    END
  END


  /* ERwin Builtin Trigger */
  RETURN
ERROR:
    raiserror @errno @errmsg
    rollback transaction
END

go




CREATE TRIGGER tD_Medio_de_Pago ON Medio_de_Pago FOR DELETE AS
/* ERwin Builtin Trigger */
/* DELETE trigger on Medio_de_Pago */
BEGIN
  DECLARE  @errno   int,
           @errmsg  varchar(255)
    /* ERwin Builtin Trigger */
    /* Medio_de_Pago  Cuotas on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="0000ffd8", PARENT_OWNER="", PARENT_TABLE="Medio_de_Pago"
    CHILD_OWNER="", CHILD_TABLE="Cuotas"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Cuotas_Medio_de_Pago", FK_COLUMNS="ID_Codigo_MP" */
    IF EXISTS (
      SELECT * FROM deleted,Cuotas
      WHERE
        /*  %JoinFKPK(Cuotas,deleted," = "," AND") */
        Cuotas.ID_Codigo_MP = deleted.ID_Codigo_MP
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Medio_de_Pago because Cuotas exists.'
      GOTO ERROR
    END


    /* ERwin Builtin Trigger */
    RETURN
ERROR:
    raiserror @errno @errmsg
    rollback transaction
END

go


CREATE TRIGGER tU_Medio_de_Pago ON Medio_de_Pago FOR UPDATE AS
/* ERwin Builtin Trigger */
/* UPDATE trigger on Medio_de_Pago */
BEGIN
  DECLARE  @NUMROWS int,
           @nullcnt int,
           @validcnt int,
           @insID_Codigo_MP numeric(10),
           @errno   int,
           @errmsg  varchar(255)

  SELECT @NUMROWS = @@rowcount
  /* ERwin Builtin Trigger */
  /* Medio_de_Pago  Cuotas on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="000113a9", PARENT_OWNER="", PARENT_TABLE="Medio_de_Pago"
    CHILD_OWNER="", CHILD_TABLE="Cuotas"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Cuotas_Medio_de_Pago", FK_COLUMNS="ID_Codigo_MP" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(ID_Codigo_MP)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Cuotas
      WHERE
        /*  %JoinFKPK(Cuotas,deleted," = "," AND") */
        Cuotas.ID_Codigo_MP = deleted.ID_Codigo_MP
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Medio_de_Pago because Cuotas exists.'
      GOTO ERROR
    END
  END


  /* ERwin Builtin Trigger */
  RETURN
ERROR:
    raiserror @errno @errmsg
    rollback transaction
END

go




CREATE TRIGGER tD_Poliza ON Poliza FOR DELETE AS
/* ERwin Builtin Trigger */
/* DELETE trigger on Poliza */
BEGIN
  DECLARE  @errno   int,
           @errmsg  varchar(255)
    /* ERwin Builtin Trigger */
    /* Clientes  Poliza on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="0007054f", PARENT_OWNER="", PARENT_TABLE="Clientes"
    CHILD_OWNER="", CHILD_TABLE="Poliza"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Clientes_Poliza", FK_COLUMNS="DNI_Cliente" */
    IF EXISTS (SELECT * FROM deleted,Clientes
      WHERE
        /* %JoinFKPK(deleted,Clientes," = "," AND") */
        deleted.DNI_Cliente = Clientes.DNI_Cliente AND
        NOT EXISTS (
          SELECT * FROM Poliza
          WHERE
            /* %JoinFKPK(Poliza,Clientes," = "," AND") */
            Poliza.DNI_Cliente = Clientes.DNI_Cliente
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Poliza because Clientes exists.'
      GOTO ERROR
    END

    /* ERwin Builtin Trigger */
    /* Productos  Poliza on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Productos"
    CHILD_OWNER="", CHILD_TABLE="Poliza"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Productos_Polizas", FK_COLUMNS="ID_Producto" */
    IF EXISTS (SELECT * FROM deleted,Productos
      WHERE
        /* %JoinFKPK(deleted,Productos," = "," AND") */
        deleted.ID_Producto = Productos.ID_Producto AND
        NOT EXISTS (
          SELECT * FROM Poliza
          WHERE
            /* %JoinFKPK(Poliza,Productos," = "," AND") */
            Poliza.ID_Producto = Productos.ID_Producto
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Poliza because Productos exists.'
      GOTO ERROR
    END

    /* ERwin Builtin Trigger */
    /* Anulaciones  Poliza on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Anulaciones"
    CHILD_OWNER="", CHILD_TABLE="Poliza"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Poliza_Anulaciones", FK_COLUMNS="ID_Anulación" */
    IF EXISTS (SELECT * FROM deleted,Anulaciones
      WHERE
        /* %JoinFKPK(deleted,Anulaciones," = "," AND") */
        deleted.ID_Anulación = Anulaciones.ID_Anulación AND
        NOT EXISTS (
          SELECT * FROM Poliza
          WHERE
            /* %JoinFKPK(Poliza,Anulaciones," = "," AND") */
            Poliza.ID_Anulación = Anulaciones.ID_Anulación
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Poliza because Anulaciones exists.'
      GOTO ERROR
    END

    /* ERwin Builtin Trigger */
    /* Endosos  Poliza on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Endosos"
    CHILD_OWNER="", CHILD_TABLE="Poliza"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Poliza_Endosos", FK_COLUMNS="ID_Endosos" */
    IF EXISTS (SELECT * FROM deleted,Endosos
      WHERE
        /* %JoinFKPK(deleted,Endosos," = "," AND") */
        deleted.ID_Endosos = Endosos.ID_Endosos AND
        NOT EXISTS (
          SELECT * FROM Poliza
          WHERE
            /* %JoinFKPK(Poliza,Endosos," = "," AND") */
            Poliza.ID_Endosos = Endosos.ID_Endosos
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Poliza because Endosos exists.'
      GOTO ERROR
    END

    /* ERwin Builtin Trigger */
    /* Cuotas  Poliza on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Cuotas"
    CHILD_OWNER="", CHILD_TABLE="Poliza"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Poliza_Cuotas", FK_COLUMNS="ID_Cuotas" */
    IF EXISTS (SELECT * FROM deleted,Cuotas
      WHERE
        /* %JoinFKPK(deleted,Cuotas," = "," AND") */
        deleted.ID_Cuotas = Cuotas.ID_Cuotas AND
        NOT EXISTS (
          SELECT * FROM Poliza
          WHERE
            /* %JoinFKPK(Poliza,Cuotas," = "," AND") */
            Poliza.ID_Cuotas = Cuotas.ID_Cuotas
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Poliza because Cuotas exists.'
      GOTO ERROR
    END

    /* ERwin Builtin Trigger */
    /* USUARIO  Poliza on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="USUARIO"
    CHILD_OWNER="", CHILD_TABLE="Poliza"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Usuario_Poliza", FK_COLUMNS="ID_Empleado" */
    IF EXISTS (SELECT * FROM deleted,USUARIO
      WHERE
        /* %JoinFKPK(deleted,USUARIO," = "," AND") */
        deleted.ID_Empleado = USUARIO.ID_Empleado AND
        NOT EXISTS (
          SELECT * FROM Poliza
          WHERE
            /* %JoinFKPK(Poliza,USUARIO," = "," AND") */
            Poliza.ID_Empleado = USUARIO.ID_Empleado
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Poliza because USUARIO exists.'
      GOTO ERROR
    END


    /* ERwin Builtin Trigger */
    RETURN
ERROR:
    raiserror @errno @errmsg
    rollback transaction
END

go


CREATE TRIGGER tU_Poliza ON Poliza FOR UPDATE AS
/* ERwin Builtin Trigger */
/* UPDATE trigger on Poliza */
BEGIN
  DECLARE  @NUMROWS int,
           @nullcnt int,
           @validcnt int,
           @insPropuesta numeric(10),
           @errno   int,
           @errmsg  varchar(255)

  SELECT @NUMROWS = @@rowcount
  /* ERwin Builtin Trigger */
  /* Clientes  Poliza on child update no action */
  /* ERWIN_RELATION:CHECKSUM="0007cb65", PARENT_OWNER="", PARENT_TABLE="Clientes"
    CHILD_OWNER="", CHILD_TABLE="Poliza"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Clientes_Poliza", FK_COLUMNS="DNI_Cliente" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(DNI_Cliente)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Clientes
        WHERE
          /* %JoinFKPK(inserted,Clientes) */
          inserted.DNI_Cliente = Clientes.DNI_Cliente
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @NUMROWS
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Poliza because Clientes does not exist.'
      GOTO ERROR
    END
  END

  /* ERwin Builtin Trigger */
  /* Productos  Poliza on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Productos"
    CHILD_OWNER="", CHILD_TABLE="Poliza"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Productos_Polizas", FK_COLUMNS="ID_Producto" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(ID_Producto)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Productos
        WHERE
          /* %JoinFKPK(inserted,Productos) */
          inserted.ID_Producto = Productos.ID_Producto
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @NUMROWS
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Poliza because Productos does not exist.'
      GOTO ERROR
    END
  END

  /* ERwin Builtin Trigger */
  /* Anulaciones  Poliza on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Anulaciones"
    CHILD_OWNER="", CHILD_TABLE="Poliza"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Poliza_Anulaciones", FK_COLUMNS="ID_Anulación" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(ID_Anulación)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Anulaciones
        WHERE
          /* %JoinFKPK(inserted,Anulaciones) */
          inserted.ID_Anulación = Anulaciones.ID_Anulación
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @NUMROWS
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Poliza because Anulaciones does not exist.'
      GOTO ERROR
    END
  END

  /* ERwin Builtin Trigger */
  /* Endosos  Poliza on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Endosos"
    CHILD_OWNER="", CHILD_TABLE="Poliza"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Poliza_Endosos", FK_COLUMNS="ID_Endosos" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(ID_Endosos)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Endosos
        WHERE
          /* %JoinFKPK(inserted,Endosos) */
          inserted.ID_Endosos = Endosos.ID_Endosos
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @NUMROWS
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Poliza because Endosos does not exist.'
      GOTO ERROR
    END
  END

  /* ERwin Builtin Trigger */
  /* Cuotas  Poliza on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Cuotas"
    CHILD_OWNER="", CHILD_TABLE="Poliza"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Poliza_Cuotas", FK_COLUMNS="ID_Cuotas" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(ID_Cuotas)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Cuotas
        WHERE
          /* %JoinFKPK(inserted,Cuotas) */
          inserted.ID_Cuotas = Cuotas.ID_Cuotas
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @NUMROWS
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Poliza because Cuotas does not exist.'
      GOTO ERROR
    END
  END

  /* ERwin Builtin Trigger */
  /* USUARIO  Poliza on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="USUARIO"
    CHILD_OWNER="", CHILD_TABLE="Poliza"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Usuario_Poliza", FK_COLUMNS="ID_Empleado" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(ID_Empleado)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,USUARIO
        WHERE
          /* %JoinFKPK(inserted,USUARIO) */
          inserted.ID_Empleado = USUARIO.ID_Empleado
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @NUMROWS
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Poliza because USUARIO does not exist.'
      GOTO ERROR
    END
  END


  /* ERwin Builtin Trigger */
  RETURN
ERROR:
    raiserror @errno @errmsg
    rollback transaction
END

go




CREATE TRIGGER tD_Productos ON Productos FOR DELETE AS
/* ERwin Builtin Trigger */
/* DELETE trigger on Productos */
BEGIN
  DECLARE  @errno   int,
           @errmsg  varchar(255)
    /* ERwin Builtin Trigger */
    /* Productos  Poliza on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="000224b3", PARENT_OWNER="", PARENT_TABLE="Productos"
    CHILD_OWNER="", CHILD_TABLE="Poliza"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Productos_Polizas", FK_COLUMNS="ID_Producto" */
    IF EXISTS (
      SELECT * FROM deleted,Poliza
      WHERE
        /*  %JoinFKPK(Poliza,deleted," = "," AND") */
        Poliza.ID_Producto = deleted.ID_Producto
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Productos because Poliza exists.'
      GOTO ERROR
    END

    /* ERwin Builtin Trigger */
    /* Compañia  Productos on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Compañia"
    CHILD_OWNER="", CHILD_TABLE="Productos"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Compañia_Productos", FK_COLUMNS="ID_Compañia" */
    IF EXISTS (SELECT * FROM deleted,Compañia
      WHERE
        /* %JoinFKPK(deleted,Compañia," = "," AND") */
        deleted.ID_Compañia = Compañia.ID_Compañia AND
        NOT EXISTS (
          SELECT * FROM Productos
          WHERE
            /* %JoinFKPK(Productos,Compañia," = "," AND") */
            Productos.ID_Compañia = Compañia.ID_Compañia
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Productos because Compañia exists.'
      GOTO ERROR
    END


    /* ERwin Builtin Trigger */
    RETURN
ERROR:
    raiserror @errno @errmsg
    rollback transaction
END

go


CREATE TRIGGER tU_Productos ON Productos FOR UPDATE AS
/* ERwin Builtin Trigger */
/* UPDATE trigger on Productos */
BEGIN
  DECLARE  @NUMROWS int,
           @nullcnt int,
           @validcnt int,
           @insID_Producto numeric(10),
           @errno   int,
           @errmsg  varchar(255)

  SELECT @NUMROWS = @@rowcount
  /* ERwin Builtin Trigger */
  /* Productos  Poliza on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00026b89", PARENT_OWNER="", PARENT_TABLE="Productos"
    CHILD_OWNER="", CHILD_TABLE="Poliza"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Productos_Polizas", FK_COLUMNS="ID_Producto" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(ID_Producto)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Poliza
      WHERE
        /*  %JoinFKPK(Poliza,deleted," = "," AND") */
        Poliza.ID_Producto = deleted.ID_Producto
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Productos because Poliza exists.'
      GOTO ERROR
    END
  END

  /* ERwin Builtin Trigger */
  /* Compañia  Productos on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Compañia"
    CHILD_OWNER="", CHILD_TABLE="Productos"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Compañia_Productos", FK_COLUMNS="ID_Compañia" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(ID_Compañia)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Compañia
        WHERE
          /* %JoinFKPK(inserted,Compañia) */
          inserted.ID_Compañia = Compañia.ID_Compañia
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @NUMROWS
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Productos because Compañia does not exist.'
      GOTO ERROR
    END
  END


  /* ERwin Builtin Trigger */
  RETURN
ERROR:
    raiserror @errno @errmsg
    rollback transaction
END

go




CREATE TRIGGER tD_USUARIO ON USUARIO FOR DELETE AS
/* ERwin Builtin Trigger */
/* DELETE trigger on USUARIO */
BEGIN
  DECLARE  @errno   int,
           @errmsg  varchar(255)
    /* ERwin Builtin Trigger */
    /* USUARIO  Poliza on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="0000ea5d", PARENT_OWNER="", PARENT_TABLE="USUARIO"
    CHILD_OWNER="", CHILD_TABLE="Poliza"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Usuario_Poliza", FK_COLUMNS="ID_Empleado" */
    IF EXISTS (
      SELECT * FROM deleted,Poliza
      WHERE
        /*  %JoinFKPK(Poliza,deleted," = "," AND") */
        Poliza.ID_Empleado = deleted.ID_Empleado
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete USUARIO because Poliza exists.'
      GOTO ERROR
    END


    /* ERwin Builtin Trigger */
    RETURN
ERROR:
    raiserror @errno @errmsg
    rollback transaction
END

go


CREATE TRIGGER tU_USUARIO ON USUARIO FOR UPDATE AS
/* ERwin Builtin Trigger */
/* UPDATE trigger on USUARIO */
BEGIN
  DECLARE  @NUMROWS int,
           @nullcnt int,
           @validcnt int,
           @insID_Empleado varchar(20),
           @errno   int,
           @errmsg  varchar(255)

  SELECT @NUMROWS = @@rowcount
  /* ERwin Builtin Trigger */
  /* USUARIO  Poliza on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00010bcb", PARENT_OWNER="", PARENT_TABLE="USUARIO"
    CHILD_OWNER="", CHILD_TABLE="Poliza"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Usuario_Poliza", FK_COLUMNS="ID_Empleado" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(ID_Empleado)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Poliza
      WHERE
        /*  %JoinFKPK(Poliza,deleted," = "," AND") */
        Poliza.ID_Empleado = deleted.ID_Empleado
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update USUARIO because Poliza exists.'
      GOTO ERROR
    END
  END


  /* ERwin Builtin Trigger */
  RETURN
ERROR:
    raiserror @errno @errmsg
    rollback transaction
END

go


