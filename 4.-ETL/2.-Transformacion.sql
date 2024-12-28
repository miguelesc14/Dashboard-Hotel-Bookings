-- Usar base de datos ventasStage
use reservasStage;

-- Verificar tabla de DIM_Canal
select * from DIM_Canal;

-- Verificar tabla de DIM_Comida
select * from DIM_Comida;
-- Crear procedimiento almacenado para transformar DIM_Comida(Generar columna de descripcion)
create procedure transformaComida
as begin
	UPDATE DIM_Comida
	SET descripcion = CASE meal
		WHEN 'FB' THEN 'Full Board (desayuno, comida y cena)'
		WHEN 'HB' THEN 'Half Board (desayuno y una comida)'
		WHEN 'SC' THEN 'Self Catering (sin alimentos incluidos)'
		WHEN 'BB' THEN 'Bed and Breakfast (desayuno incluido)'
		WHEN 'Undefined' THEN 'Indefinido'
		ELSE meal
	end
	where descripcion is null
end;

-- Verificar tabla de DIM_Deposito
select * from DIM_Deposito;
-- Verificar tabla de DIM_Estado
select * from DIM_Estado;
-- Verificar tabla de DIM_Hotel
select * from DIM_Hotel;
-- Verificar tabla de DIM_Mercado
select * from DIM_Mercado;

-- Verificar tabla de DIM_Pais
select * from DIM_Pais;
-- Crear procedimiento almacenado para transformar DIM_Pais(Generar columna de nombre)
create procedure transformaPais
as begin
	UPDATE DIM_Pais
	SET nombre = CASE country
	    WHEN 'ISR' THEN 'Israel'
		WHEN 'BOL' THEN 'Bolivia'
		WHEN 'CHN' THEN 'China'
		WHEN 'TGO' THEN 'Togo'
		WHEN 'SYR' THEN 'Siria'
		WHEN 'CHL' THEN 'Chile'
		WHEN 'SLE' THEN 'Sierra Leona'
		WHEN 'COL' THEN 'Colombia'
		WHEN 'AND' THEN 'Andorra'
		WHEN 'JPN' THEN 'Japón'
		WHEN 'GUY' THEN 'Guyana'
		WHEN 'IRQ' THEN 'Irak'
		WHEN 'SYC' THEN 'Seychelles'
		WHEN 'NZL' THEN 'Nueva Zelanda'
		WHEN 'PLW' THEN 'Palaos'
		WHEN 'UZB' THEN 'Uzbekistán'
		WHEN 'USA' THEN 'Estados Unidos'
		WHEN 'ARG' THEN 'Argentina'
		WHEN 'KNA' THEN 'San Cristóbal y Nieves'
		WHEN 'PRT' THEN 'Portugal'
		WHEN 'AUS' THEN 'Australia'
		WHEN 'MEX' THEN 'México'
		WHEN 'SVN' THEN 'Eslovenia'
		WHEN 'GIB' THEN 'Gibraltar'
		WHEN 'ATA' THEN 'Antártida'
		WHEN 'ARE' THEN 'Emiratos Árabes Unidos'
		WHEN 'HRV' THEN 'Croacia'
		WHEN 'DEU' THEN 'Alemania'
		WHEN 'VEN' THEN 'Venezuela'
		WHEN 'NLD' THEN 'Países Bajos'
		WHEN 'HKG' THEN 'Hong Kong'
		WHEN 'SVK' THEN 'Eslovaquia'
		WHEN 'CHE' THEN 'Suiza'
		WHEN 'PRI' THEN 'Puerto Rico'
		WHEN 'KAZ' THEN 'Kazajistán'
		WHEN 'LBN' THEN 'Líbano'
		WHEN 'MYS' THEN 'Malasia'
		WHEN 'IDN' THEN 'Indonesia'
		WHEN 'BDI' THEN 'Burundi'
		WHEN 'CZE' THEN 'República Checa'
		WHEN 'NAM' THEN 'Namibia'
		WHEN 'ARM' THEN 'Armenia'
		WHEN 'NIC' THEN 'Nicaragua'
		WHEN 'GAB' THEN 'Gabón'
		WHEN 'ITA' THEN 'Italia'
		WHEN 'URY' THEN 'Uruguay'
		WHEN 'KOR' THEN 'Corea del Sur'
		WHEN 'ZWE' THEN 'Zimbabue'
		WHEN 'DJI' THEN 'Yibuti'
		WHEN 'SAU' THEN 'Arabia Saudita'
	    WHEN 'CRI' THEN 'Costa Rica'
	    WHEN 'VNM' THEN 'Vietnam'
		WHEN 'STP' THEN 'Santo Tomé y Príncipe'
		WHEN 'PYF' THEN 'Polinesia Francesa'
		WHEN 'TUR' THEN 'Turquía'
		WHEN 'NULL' THEN 'Desconocido'
		WHEN 'MRT' THEN 'Mauritania'
		WHEN 'DMA' THEN 'Dominica'
		WHEN 'ALB' THEN 'Albania'
		WHEN 'LCA' THEN 'Santa Lucía'
		WHEN 'FRO' THEN 'Islas Feroe'
		WHEN 'BEN' THEN 'Benín'
		WHEN 'MLI' THEN 'Malí'
		WHEN 'IRL' THEN 'Irlanda'
		WHEN 'POL' THEN 'Polonia'
		WHEN 'NGA' THEN 'Nigeria'
		WHEN 'MKD' THEN 'Macedonia del Norte'
		WHEN 'AUT' THEN 'Austria'
		WHEN 'JEY' THEN 'Jersey'
		WHEN 'CUB' THEN 'Cuba'
		WHEN 'IMN' THEN 'Isla de Man'
		WHEN 'TZA' THEN 'Tanzania'
		WHEN 'KEN' THEN 'Kenia'
		WHEN 'BEL' THEN 'Bélgica'
		WHEN 'BRA' THEN 'Brasil'
		WHEN 'BFA' THEN 'Burkina Faso'
		WHEN 'MAC' THEN 'Macao'
		WHEN 'FIN' THEN 'Finlandia'
		WHEN 'MMR' THEN 'Birmania (Myanmar)'
		WHEN 'FJI' THEN 'Fiyi'
		WHEN 'GEO' THEN 'Georgia'
		WHEN 'MAR' THEN 'Marruecos'
		WHEN 'GGY' THEN 'Guernsey'
		WHEN 'CYM' THEN 'Islas Caimán'
		WHEN 'GHA' THEN 'Ghana'
		WHEN 'MYT' THEN 'Mayotte'
		WHEN 'LTU' THEN 'Lituania'
		WHEN 'EGY' THEN 'Egipto'
		WHEN 'MDV' THEN 'Maldivas'
		WHEN 'MNE' THEN 'Montenegro'
		WHEN 'PAK' THEN 'Pakistán'
		WHEN 'ATF' THEN 'Territorios Australes Franceses'
		WHEN 'DNK' THEN 'Dinamarca'
		WHEN 'ZAF' THEN 'Sudáfrica'
		WHEN 'CIV' THEN 'Costa de Marfil'
		WHEN 'DZA' THEN 'Argelia'
		WHEN 'BGR' THEN 'Bulgaria'
		WHEN 'RWA' THEN 'Ruanda'
		WHEN 'MDG' THEN 'Madagascar'
		WHEN 'BHR' THEN 'Baréin'
		WHEN 'SGP' THEN 'Singapur'
		WHEN 'RUS' THEN 'Rusia'
		WHEN 'PRY' THEN 'Paraguay'
		WHEN 'GRC' THEN 'Grecia'
		WHEN 'ROU' THEN 'Rumania'
	    WHEN 'OMN' THEN 'Omán'
	    WHEN 'HND' THEN 'Honduras'
		WHEN 'AIA' THEN 'Anguila'
		WHEN 'LUX' THEN 'Luxemburgo'
		WHEN 'THA' THEN 'Tailandia'
		WHEN 'JOR' THEN 'Jordania'
		WHEN 'CAF' THEN 'República Centroafricana'
		WHEN 'LIE' THEN 'Liechtenstein'
		WHEN 'BWA' THEN 'Botsuana'
		WHEN 'SRB' THEN 'Serbia'
		WHEN 'TUN' THEN 'Túnez'
		WHEN 'SWE' THEN 'Suecia'
		WHEN 'SEN' THEN 'Senegal'
		WHEN 'VGB' THEN 'Islas Vírgenes Británicas'
		WHEN 'TWN' THEN 'Taiwán'
		WHEN 'MLT' THEN 'Malta'
		WHEN 'SUR' THEN 'Surinam'
		WHEN 'TMP' THEN 'Timor Oriental'
		WHEN 'CMR' THEN 'Camerún'
		WHEN 'SDN' THEN 'Sudán'
		WHEN 'COM' THEN 'Comoras'
		WHEN 'MWI' THEN 'Malaui'
		WHEN 'BLR' THEN 'Bielorrusia'
		WHEN 'EST' THEN 'Estonia'
		WHEN 'UGA' THEN 'Uganda'
		WHEN 'SMR' THEN 'San Marino'
	    WHEN 'KWT' THEN 'Kuwait'
	    WHEN 'FRA' THEN 'Francia'
		WHEN 'DOM' THEN 'República Dominicana'
		WHEN 'PAN' THEN 'Panamá'
		WHEN 'NCL' THEN 'Nueva Caledonia'
		WHEN 'IRN' THEN 'Irán'
		WHEN 'GLP' THEN 'Guadalupe'
		WHEN 'IND' THEN 'India'
		WHEN 'PHL' THEN 'Filipinas'
		WHEN 'MOZ' THEN 'Mozambique'
		WHEN 'ISL' THEN 'Islandia'
		WHEN 'SLV' THEN 'El Salvador'
		WHEN 'ESP' THEN 'España'
		WHEN 'LVA' THEN 'Letonia'
		WHEN 'GBR' THEN 'Reino Unido'
		WHEN 'AZE' THEN 'Azerbaiyán'
		WHEN 'CYP' THEN 'Chipre'
		WHEN 'GNB' THEN 'Guinea-Bisáu'
		WHEN 'LKA' THEN 'Sri Lanka'
		WHEN 'UMI' THEN 'Islas Ultramarinas Menores de Estados Unidos'
		WHEN 'ABW' THEN 'Aruba'
		WHEN 'ECU' THEN 'Ecuador'
		WHEN 'LAO' THEN 'Laos'
		WHEN 'PER' THEN 'Perú'
		WHEN 'ETH' THEN 'Etiopía'
		WHEN 'QAT' THEN 'Catar'
		WHEN 'MCO' THEN 'Mónaco'
		WHEN 'KHM' THEN 'Camboya'
		WHEN 'AGO' THEN 'Angola'
		WHEN 'CPV' THEN 'Cabo Verde'
		WHEN 'HUN' THEN 'Hungría'
		WHEN 'GTM' THEN 'Guatemala'
		WHEN 'BIH' THEN 'Bosnia y Herzegovina'
		WHEN 'UKR' THEN 'Ucrania'
		WHEN 'JAM' THEN 'Jamaica'
		WHEN 'KIR' THEN 'Kiribati'
		WHEN 'NPL' THEN 'Nepal'
		WHEN 'LBY' THEN 'Libia'
		WHEN 'BRB' THEN 'Barbados'
		WHEN 'TJK' THEN 'Tayikistán'
		WHEN 'BTN' THEN 'Bután'
		WHEN 'NOR' THEN 'Noruega'
		WHEN 'MUS' THEN 'Mauricio'
		WHEN 'BHS' THEN 'Bahamas'
		WHEN 'BGD' THEN 'Bangladesh'
		WHEN 'ZMB' THEN 'Zambia'
		WHEN 'ASM' THEN 'Samoa Americana'
		WHEN 'CN' THEN 'China'
		ELSE nombre
	end
	where nombre is null
end;

-- Verificar tabla de DIM_Repetido
select * from DIM_Repetido;
-- Crear procedimiento almacenado para transformar DIM_Repetido(Generar columna de descripcion)
create procedure transformaRepetido
as begin
	UPDATE DIM_Repetido
	SET descripcion = CASE is_repeated_guest
		WHEN 0 THEN 'Cliente nuevo'
		WHEN 1 THEN 'Cliente recurrente'
		ELSE descripcion
	end
	where descripcion is null
end;

-- Verificar tabla de DIM_Tiempo
select * from DIM_Tiempo;
-- Crear procedimiento almacenado para transformar DIM_Tiempo(Generar datos faltantes en la columna correspondiente a fecha)
create procedure transformaTiempo
as begin
	UPDATE DIM_Tiempo
	SET reservation_status_date=DATEFROMPARTS(
									arrival_date_year,
									CASE
										WHEN arrival_date_month='January' THEN 1
										WHEN arrival_date_month='February' THEN 2
										WHEN arrival_date_month='March' THEN 3
										WHEN arrival_date_month='April' THEN 4
										WHEN arrival_date_month='May' THEN 5
										WHEN arrival_date_month='June' THEN 6
										WHEN arrival_date_month='July' THEN 7
										WHEN arrival_date_month='August' THEN 8
										WHEN arrival_date_month='September' THEN 9
										WHEN arrival_date_month='October' THEN 10
										WHEN arrival_date_month='November' THEN 11
										WHEN arrival_date_month='December' THEN 12
										ELSE 0
									END,
									arrival_date_day_of_month
								)
	where reservation_status_date is null
end;
-- Limpiar Tabla de DIM_Tiempo_Filtrado
create procedure limpiarTiempoFiltrado
as begin
	delete from  DIM_Tiempo_Filtrado;
	DBCC checkident('DIM_Tiempo_Filtrado',reseed,0);
end;
-- Crear vista para filtrar fechas unicas y pasarlas de DIM_Tiempo a DIM_Tiempo_Filtrado
create view rTiempoFiltrado as
	select reservation_status_date, 
			MIN(arrival_date_year) as arrival_date_year, 
			MIN(arrival_date_month) as arrival_date_month, 
			MIN(arrival_date_day_of_month) as arrival_date_day_of_month,
			MIN(arrival_date_week_number) as arrival_date_week_number
	from DIM_Tiempo	
	group BY reservation_status_date;

-- Verificar tabla de DIM_Tiempo
select * from DIM_Tiempo_Filtrado;
-- Crear procedimiento almacenado para transformar DIM_Tiempo_Filtrado(Generar datos faltantes en todas las columnas)
create procedure transformaTiempoFiltrado
as begin
	update DIM_Tiempo_Filtrado
	SET arrival_date_year=YEAR(reservation_status_date)
	where arrival_date_year is null;

	UPDATE DIM_Tiempo_Filtrado
	SET arrival_date_month = FORMAT(reservation_status_date, 'MMMM', 'en-US')
	where arrival_date_month is null ;

	update DIM_Tiempo_Filtrado
	SET arrival_date_week_number=DATENAME(WEEK,reservation_status_date)
	where arrival_date_week_number is null;

	update DIM_Tiempo_Filtrado
	SET	arrival_date_day_of_month=DAY(reservation_status_date)
	where arrival_date_day_of_month is null;

	update DIM_Tiempo_Filtrado
	SET	trimestre=(MONTH(reservation_status_date)+2)/3 
	where trimestre is null;

	update DIM_Tiempo_Filtrado
	SET	diaSemana=DATENAME(WEEKDAY,reservation_status_date)
	where diaSemana is null;
end;

-- Verificar tabla de DIM_TipoCliente
select * from DIM_TipoCliente;
-- Crear procedimiento almacenado para transformar DIM_TipoCliente(Generar columna de descripcion)
create procedure transformaTipoCliente
as begin
	UPDATE DIM_TipoCliente
	SET descripcion = CASE customer_type
		WHEN 'Group' THEN 'Reservas Grupales'
		WHEN 'Contract' THEN 'Clientes bajo contrato'
		WHEN 'Transient' THEN 'Reservas independientes individuales'
		WHEN 'Transient-Party' THEN 'Combinación de transitorios y grupos pequeños'
		ELSE descripcion
	end
	where descripcion is null
end;

-- Verificar tabla de DIM_TipoHabitacion
select * from DIM_TipoHabitacion;

-- Verificar tabla de FACT_Resrva
select * from FACT_Reserva;

-- Crear procedimiento almacenado para transformar FACT_Reserva(Generar datos faltantes en todas las columnas)
create procedure transformaReserva
as begin
	update FACT_Reserva
	SET nochesTotales = stays_in_week_nights+stays_in_weekend_nights
	where nochesTotales is null;

	update FACT_Reserva
	SET personasTotales=adults+children+babies
	where personasTotales is null;

	update FACT_Reserva
	SET ingresoTotal=nochesTotales*adr
	where ingresoTotal is null;

	update FACT_Reserva
	SET SKhotelID=(select SKhotelID from DIM_Hotel
								where hotel=FACT_Reserva.hotel)
	where SKhotelID is null;

	update FACT_Reserva
	SET SKestadoID=(select SKestadoID from DIM_Estado
								where reservation_status=FACT_Reserva.reservation_status)
	where SKestadoID is null;

	update FACT_Reserva
	SET SKfechallegadaID=(select SKtiempoID from DIM_Tiempo_Filtrado
								where arrival_date_year=FACT_Reserva.arrival_date_year
								AND arrival_date_month=FACT_Reserva.arrival_date_month
								AND arrival_date_day_of_month=FACT_Reserva.arrival_date_day_of_month)
	where SKfechallegadaID is null;

	update FACT_Reserva
	SET SKfechaestatusID=(select SKtiempoID from DIM_Tiempo_Filtrado
								where reservation_status_date=FACT_Reserva.reservation_status_date)
	where SKfechaestatusID is null;
	
	update FACT_Reserva
	SET SKcomidaID=(select SKcomidaID from DIM_Comida
								where meal=FACT_Reserva.meal)
	where SKcomidaID is null;

	update FACT_Reserva
	SET SKpaisID=(select SKpaisID from DIM_Pais
								where country=FACT_Reserva.country)
	where SKpaisID is null;

	update FACT_Reserva
	SET SKmercadoID=(select SKmercadoID from DIM_Mercado
								where market_segment=FACT_Reserva.market_segment)
	where SKmercadoID is null;
	
	update FACT_Reserva
	SET SKcanalID=(select SKcanalID from DIM_Canal
								where distribution_channel=FACT_Reserva.distribution_channel)
	where SKcanalID is null;

	update FACT_Reserva
	SET SKrepetidoID=(select SKrepetidoID from DIM_Repetido
								where is_repeated_guest=FACT_Reserva.is_repeated_guest)
	where SKrepetidoID is null;
	
	update FACT_Reserva
	SET SKtiporeservadoID=(select SKtipohabitacionID from DIM_TipoHabitacion
								where room_type=FACT_Reserva.reserved_room_type)
	where SKtiporeservadoID is null;

	update FACT_Reserva
	SET SKtipoasignadoID=(select SKtipohabitacionID from DIM_TipoHabitacion
								where room_type=FACT_Reserva.assigned_room_type)
	where SKtipoasignadoID is null;
	
	update FACT_Reserva
	SET SKdepositoID=(select SKdepositoID from DIM_Deposito
								where deposit_type=FACT_Reserva.deposit_type)
	where SKdepositoID is null;

	update FACT_Reserva
	SET SKtipoclienteID=(select SKtipoclienteID from DIM_TipoCliente
								where customer_type=FACT_Reserva.customer_type)
	where SKtipoclienteID is null;

end;