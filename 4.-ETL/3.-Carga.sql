-- Usar base de datos ventasDWH
use reservasDWH;

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
		delete from DIM_TipoCliente;
		delete from DIM_TipoHabitacion;
	end;
-- Ejecutar procedimiento limpiaTablas
exec limpiaTablas;