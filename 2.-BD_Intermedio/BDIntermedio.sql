-- Crear base de datos
create database reservasStage;

-- Usar base de datos
use reservasStage;

--  Crear tablas
create table DIM_Hotel(
	SKhotelID int identity not null,
	hotel nvarchar(50),
	constraint hotelPK primary key(SKhotelID)
);

create table DIM_Estado(
	SKestadoID int identity not null,
	reservation_status nvarchar(50),
	constraint estadoPK primary key(SKestadoID)
);

create table DIM_Tiempo(
	SKtiempoID int identity not null,
	reservation_status_date date,
	arrival_date_year smallint,
	arrival_date_month nvarchar(50),
	arrival_date_week_number tinyint,
	arrival_date_day_of_month tinyint,
	trimestre tinyint,
	diaSemana varchar(20),
	constraint tiempoPK primary key(SKtiempoID)
);

create table DIM_Tiempo_Filtrado(
	SKtiempoID int identity not null,
	reservation_status_date date,
	arrival_date_year smallint,
	arrival_date_month nvarchar(50),
	arrival_date_week_number tinyint,
	arrival_date_day_of_month tinyint,
	trimestre tinyint,
	diaSemana varchar(20),
	constraint tiempoFPK primary key(SKtiempoID)
);

create table DIM_Comida(
	SKcomidaID int identity not null,
	meal nvarchar(50),
	descripcion varchar(100),
	constraint comidaPK primary key(SKcomidaID)
);

create table DIM_Pais(
	SKpaisID int identity not null,
	country nvarchar(50),
	nombre varchar(50),
	constraint paisPK primary key(SKpaisID)
);

create table DIM_Mercado(
	SKmercadoID int identity not null,
	market_segment nvarchar(50),
	constraint mercadoPK primary key(SKmercadoID)
);

create table DIM_Canal(
	SKcanalID int identity not null,
	distribution_channel nvarchar(50),
	constraint canalPK primary key(SKcanalID)
);

create table DIM_Repetido(
	SKrepetidoID int identity not null,
	is_repeated_guest tinyint,
	descripcion varchar(30),
	constraint repetidoPK primary key(SKrepetidoID)
);

create table DIM_TipoHabitacion(
	SKtipohabitacionID int identity not null,
	room_type nvarchar(50),
	constraint tipohabitacionPK primary key(SKtipohabitacionID)
);

create table DIM_Deposito(
	SKdepositoID int identity not null,
	deposit_type nvarchar(50),
	constraint depositoPK primary key(SKdepositoID)
);

create table DIM_TipoCliente(
	SKtipoclienteID int identity not null,
	customer_type nvarchar(50),
	descripcion nvarchar(50)
	constraint tipoClientePK primary key(SKtipoclienteID)
);

create table FACT_Reserva(
	SKreservaID bigint identity not null,
	lead_time smallint,
	stays_in_weekend_nights tinyint,
	stays_in_week_nights tinyint,
	nochesTotales tinyint,
	adults tinyint,
	children tinyint,
	babies tinyint,
	personasTotales tinyint,
	booking_changes tinyint,
	days_in_waiting_list smallint,
	adr float,
	ingresoTotal float,
	car_parking_spaces tinyint,
	total_of_special_requests tinyint,
	SKhotelID int,
	hotel nvarchar(50),
	SKestadoID int,
	reservation_status nvarchar(50),
	SKfechallegadaID int,
	arrival_date_year smallint,
	arrival_date_month nvarchar(50),
	arrival_date_week_number tinyint,
	arrival_date_day_of_month tinyint,
	SKfechaestatusID int,
	reservation_status_date date,
	SKcomidaID int,
	meal nvarchar(50),
	SKpaisID int,
	country nvarchar(50),
	SKmercadoID int,
	market_segment nvarchar(50),
	SKcanalID int,
	distribution_channel nvarchar(50),
	SKrepetidoID int,
	is_repeated_guest tinyint,
	SKtiporeservadoID int,
	reserved_room_type nvarchar(50),
	SKtipoasignadoID int,
	assigned_room_type nvarchar(50),
	SKdepositoID int,
	deposit_type nvarchar(50),
	SKtipoclienteID int,
	customer_type nvarchar(50),
	constraint reservaPK primary key(SKreservaID)
);