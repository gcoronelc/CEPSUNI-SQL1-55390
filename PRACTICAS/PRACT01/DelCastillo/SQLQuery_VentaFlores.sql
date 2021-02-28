
CREATE TABLE CLIENTE
( 
	IdCliente            integer  NOT NULL ,
	NomCli               varchar(20)  NULL ,
	CONSTRAINT XPKCLIENTE PRIMARY KEY (IdCliente ASC)
)
go



CREATE TABLE VENDEDOR
( 
	IdVendedor           integer  NOT NULL ,
	ApeVend              varchar(20)  NULL ,
	NomVend              varchar(20)  NULL ,
	DirVend              varchar(20)  NULL ,
	DniVend              varchar(20)  NULL ,
	TelfVend             varchar(20)  NULL ,
	CONSTRAINT XPKVENDEDOR PRIMARY KEY (IdVendedor ASC)
)
go



CREATE TABLE TRANSPORTISTA
( 
	IdTransp             integer  NOT NULL ,
	NomTransp            varchar(20)  NULL ,
	TelfTransp           varchar(20)  NULL ,
	DirTransp            varchar(20)  NULL ,
	CONSTRAINT XPKTRANSPORTISTA PRIMARY KEY (IdTransp ASC)
)
go



CREATE TABLE PEDIDO
( 
	NroPedido            integer  NOT NULL ,
	Fecha                datetime  NULL ,
	IdCliente            integer  NOT NULL ,
	IdVendedor           integer  NOT NULL ,
	IdTransp             integer  NOT NULL ,
	Monto                integer  NULL ,
	CONSTRAINT XPKPEDIDO PRIMARY KEY (NroPedido ASC),
	CONSTRAINT R_1 FOREIGN KEY (IdCliente) REFERENCES CLIENTE(IdCliente)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,
CONSTRAINT R_2 FOREIGN KEY (IdVendedor) REFERENCES VENDEDOR(IdVendedor)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,
CONSTRAINT R_3 FOREIGN KEY (IdTransp) REFERENCES TRANSPORTISTA(IdTransp)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
)
go



CREATE TABLE ESPECIE
( 
	IdEspecie            integer  NOT NULL ,
	NomEspecie           varchar(20)  NULL ,
	EpocaFlorac          varchar(20)  NULL ,
	EstaciioPlant        varchar(20)  NULL ,
	CONSTRAINT XPKESPECIE PRIMARY KEY (IdEspecie ASC)
)
go



CREATE TABLE FLOR
( 
	IdFlor               integer  NOT NULL ,
	NomFlor              varchar(20)  NULL ,
	PreVen               integer  NULL ,
	IdEspecie            integer  NOT NULL ,
	CONSTRAINT XPKFLOR PRIMARY KEY (IdFlor ASC),
	CONSTRAINT R_4 FOREIGN KEY (IdEspecie) REFERENCES ESPECIE(IdEspecie)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
)
go



CREATE TABLE DETALLE_PEDIDO
( 
	NroPedido            integer  NOT NULL ,
	IdFlor               integer  NOT NULL ,
	Cantidad             integer  NULL ,
	CONSTRAINT XPKDETALLE_PEDIDO PRIMARY KEY (NroPedido ASC,IdFlor ASC),
	CONSTRAINT R_5 FOREIGN KEY (NroPedido) REFERENCES PEDIDO(NroPedido)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,
CONSTRAINT R_6 FOREIGN KEY (IdFlor) REFERENCES FLOR(IdFlor)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
)
go

