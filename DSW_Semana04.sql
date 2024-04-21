	alter table Alumno
	add fechaActualizacion datetime
	go

	alter table Alumno
	add estado int
	go

	update Alumno set Estado=1
	go

ALTER procedure usp_alumno_crud
@indicador varchar(60),
@codigo int=0,
@nombres varchar(30)='',
@apellidos varchar(60)='',
@documento varchar(8)='',
@carrera int=0
as
begin
set NOCOUNT ON 

	if @indicador = 'getXID'
	Begin
		select alu.codigo, alu.nombres, alu.apellidos, alu.documento, alu.carrera, car.nombre
			from Alumno alu inner join carrera car on alu.carrera= car.codigo
			where alu.codigo=@codigo 
	end

	If @indicador = 'listarTodos'
	begin
		select codigo, nombres, apellidos, documento, carrera  from Alumno where estado=1
	end

	if @indicador = 'busquedaPorApellido'
	begin
		
		select codigo, nombres, apellidos, documento 
		from Alumno where apellidos like @apellidos

	end
	
	if @indicador ='busquedaPorFecha'
	-- En el valor de @codigo se enviara el año ejmplo: 2021, 2024, 2023
			select codigo, nombres, apellidos, documento 
			from Alumno where year(fechaRegistro)=@codigo and estado=1
	end

	if @indicador = 'registrar'
	begin
		insert into Alumno(nombres, apellidos, documento, carrera, fechaRegistro)
		values (@nombres, @apellidos, @documento, @carrera, GETDATE())
		select 1
	end

	if @indicador = 'actualizar'

	begin
		update Alumno set
		nombres= @nombres, apellidos=@apellidos,
		documento=@documento,carrera=@Carrera,
		fechaActualizacion= getDate()
		where codigo =@codigo
		Select 1

	end
		
	if @indicador = 'eliminar'
	begin
		update Alumno set
		estado=0
		where codigo =@codigo
		Select 1

	end