-- Crear base de datos
create database reservasDWH;

-- Usar base de datos
use reservasDWH;

--  Crear tablas
create table DIM_Hotel(
	SKhotelID int not null,
	hotel nvarchar(50),
	constraint hotelPK primary key(SKhotelID)
);

create table DIM_Estado(
	SKestadoID int not null,
	estadoReservacion nvarchar(50),
	constraint estadoPK primary key(SKestadoID)
);

create table DIM_Tiempo(
	SKtiempoID int not null,
	fecha date,
	año smallint,
	mes nvarchar(50),
	numeroSemana tinyint,
	dia tinyint,
	trimestre tinyint,
	diaSemana varchar(20),
	constraint tiempoPK primary key(SKtiempoID)
);

create table DIM_Comida(
	SKcomidaID int not null,
	comida nvarchar(50),
	descripcion varchar(100),
	constraint comidaPK primary key(SKcomidaID)
);

create table DIM_Pais(
	SKpaisID int not null,
	pais nvarchar(50),
	nombre varchar(50),
	constraint paisPK primary key(SKpaisID)
);

create table DIM_Mercado(
	SKmercadoID int not null,
	segmentoMercado nvarchar(50),
	constraint mercadoPK primary key(SKmercadoID)
);

create table DIM_Canal(
	SKcanalID int not null,
	canalDistribucion nvarchar(50),
	constraint canalPK primary key(SKcanalID)
);

create table DIM_Repetido(
	SKrepetidoID int not null,
	repetido tinyint,
	descripcion varchar(30),
	constraint repetidoPK primary key(SKrepetidoID)
);

create table DIM_TipoHabitacion(
	SKtipohabitacionID int not null,
	tipoHabitacion nvarchar(50),
	constraint tipohabitacionPK primary key(SKtipohabitacionID)
);

create table DIM_Deposito(
	SKdepositoID int not null,
	tipoDeposito nvarchar(50),
	constraint depositoPK primary key(SKdepositoID)
);

create table DIM_TipoCliente(
	SKtipoclienteID int not null,
	tipoCliente nvarchar(50),
	descripcion nvarchar(50),
	constraint tipoClientePK primary key(SKtipoclienteID)
);

create table FACT_Reserva(
	SKreservaID bigint not null,
	tiempoLlegada smallint,
	nochesFinSemana tinyint,
	nochesSemana tinyint,
	nochesTotales tinyint,
	adultos tinyint,
	niños tinyint,
	bebes tinyint,
	personasTotales tinyint,
	cambiosReservacion tinyint,
	diasListaEspera smallint,
	tarifaPromedio float,
	ingresoTotal float,
	espaciosEstacionamiento tinyint,
	solicitudesEspeciales tinyint,
	SKhotelID int,
	SKestadoID int,
	SKfechallegadaID int,
	SKfechaestatusID int,
	SKcomidaID int,
	SKpaisID int,
	SKmercadoID int,
	SKcanalID int,
	SKrepetidoID int,
	SKtiporeservadoID int,
	SKtipoasignadoID int,
	SKdepositoID int,
	SKtipoclienteID int,
	constraint reservaPK primary key(SKreservaID),
	constraint reservaFK foreign key(SKhotelID) references DIM_Hotel(SKhotelID),
	constraint reservaFK2 foreign key(SKestadoID) references DIM_Estado(SKestadoID),
	constraint reservaFK3 foreign key(SKfechallegadaID) references DIM_Tiempo(SKtiempoID),
	constraint reservaFK4 foreign key(SKfechaestatusID) references DIM_Tiempo(SKtiempoID),
	constraint reservaFK5 foreign key(SKcomidaID) references DIM_Comida(SKcomidaID),
	constraint reservaFK6 foreign key(SKpaisID) references DIM_Pais(SKpaisID),
	constraint reservaFK7 foreign key(SKmercadoID) references DIM_Mercado(SKmercadoID),
	constraint reservaFK8 foreign key(SKcanalID) references DIM_Canal(SKcanalID),
	constraint reservaFK9 foreign key(SKrepetidoID) references DIM_Repetido(SKrepetidoID),
	constraint reservaFK10 foreign key(SKtiporeservadoID) references DIM_TipoHabitacion(SKtipohabitacionID),
	constraint reservaFK11 foreign key(SKtipoasignadoID) references DIM_TipoHabitacion(SKtipohabitacionID),
	constraint reservaFK12 foreign key(SKdepositoID) references DIM_Deposito(SKdepositoID),
	constraint reservaFK13 foreign key(SKtipoclienteID) references DIM_TipoCliente(SKtipoclienteID)
);