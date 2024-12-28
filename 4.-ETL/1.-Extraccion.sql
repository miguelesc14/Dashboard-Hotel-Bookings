-- Usar base de datos reservasStage 
use reservasStage;

-- Crear procedimiento limpiaTablas
create procedure limpiaTablas
as
begin
		delete from FACT_Reserva;
		delete from DIM_Canal;
		delete from DIM_Comida;
		delete from DIM_Deposito;
		delete from DIM_Estado;
		delete from DIM_Hotel;
		delete from DIM_Mercado;
		delete from DIM_Pais;
		delete from DIM_Repetido;
		delete from DIM_Tiempo;
		delete from DIM_Tiempo_Filtrado;
		delete from DIM_TipoCliente;
		delete from DIM_TipoHabitacion;
		DBCC checkident('FACT_Reserva',reseed,0);
		DBCC checkident('DIM_Canal',reseed,0);
		DBCC checkident('DIM_Comida',reseed,0);
		DBCC checkident('DIM_Deposito',reseed,0);
		DBCC checkident('DIM_Estado',reseed,0);
		DBCC checkident('DIM_Hotel',reseed,0);
		DBCC checkident('DIM_Mercado',reseed,0);
		DBCC checkident('DIM_Pais',reseed,0);
		DBCC checkident('DIM_Repetido',reseed,0);
		DBCC checkident('DIM_Tiempo',reseed,0);
		DBCC checkident('DIM_Tiempo_Filtrado',reseed,0);
		DBCC checkident('DIM_TipoCliente',reseed,0);
		DBCC checkident('DIM_TipoHabitacion',reseed,0);
	end;
	
-- Ejecutar procedimiento limpiaTablas
exec limpiaTablas;

-- Crear vista para recuperar datos unicos de canal
create view rCanal as
	select distinct distribution_channel 
	from hotel_bookings.dbo.hotel_bookings;
-- Probar la vista de Canal
select * from rCanal;

-- Crear vista para recuperar datos unicos de comida
create view rComida as
	select distinct meal 
	from hotel_bookings.dbo.hotel_bookings;
-- Probar la vista de Comida
select * from rComida;

-- Crear vista para recuperar datos unicos de deposito
create view rDeposito as
	select distinct deposit_type
	from hotel_bookings.dbo.hotel_bookings;
-- Probar la vista de Deposito
select * from rDeposito;

-- Crear vista para recuperar datos unicos de estado
create view rEstado as
	select distinct reservation_status
	from hotel_bookings.dbo.hotel_bookings;
-- Probar la vista de  Estado
select * from rEstado;

-- Crear vista para recuperar datos unicos de hotel
create view rHotel as
	select distinct hotel
	from hotel_bookings.dbo.hotel_bookings;
-- Probar la vista de Hotel
select * from rHotel;

-- Crear vista para recuperar datos unicos de mercado
create view rMercado as
	select distinct market_segment
	from hotel_bookings.dbo.hotel_bookings;
-- Probar la vista de Mercado
select * from rMercado;

-- Crear vista para recuperar datos unicos de pais
create view rPais as
	select distinct country
	from hotel_bookings.dbo.hotel_bookings;
-- Probar la vista dePais
select * from rPais;

-- Crear vista para recuperar datos unicos de repetido
create view rRepetido as
	select distinct is_repeated_guest
	from hotel_bookings.dbo.hotel_bookings;
-- Probar la vista de Tiempo
select * from rRepetido;

-- Crear vistas para recuperar datos unicos de tiempo
create view rTiempo as
	select distinct arrival_date_year,arrival_date_month,arrival_date_week_number,arrival_date_day_of_month
	from hotel_bookings.dbo.hotel_bookings;

create view rTiempo2 as
	select distinct reservation_status_date
	from hotel_bookings.dbo.hotel_bookings;
-- Probar la vistas de Tiempo
select * from rTiempo;
select * from rTiempo2;

-- Crear vista para recuperar datos unicos de tipo de cliente
create view rTipoCliente as
	select distinct customer_type
	from hotel_bookings.dbo.hotel_bookings;
-- Probar la vista de tipo de cliente
select * from rTipoCliente;

-- Crear vista para recuperar datos unicos de tipo de habitacion
create view rTipoHabitacion as
	select distinct assigned_room_type
	from hotel_bookings.dbo.hotel_bookings;
-- Probar la vista de tipo de habitacion
select * from rTipoHabitacion;