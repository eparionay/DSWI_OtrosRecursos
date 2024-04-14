create database DSW_MVC
go
use  DSW_MVC
GO

create table Alumno(
	codigo int primary key identity(1,1),
	nombres varchar(30),
	apellidos varchar(60),
	documento varchar(8)
)
GO

ALTER procedure usp_alumno_crud
@indicador varchar(60),
@codigo int,
@nombres varchar(30),
@apellidos varchar(60),
@documento varchar(8)
as
begin
set NOCOUNT ON 

	If @indicador = 'listarTodos'
	begin
		select codigo, nombres, apellidos, documento  from Alumno
	end

	if @indicador = 'busquedaPorApellido'
	begin
		
		select codigo, nombres, apellidos, documento 
		from Alumno where apellidos like @apellidos

	end
	
	if @indicador ='busquedaPorFecha'
	-- En el valor de @codigo se enviara el año ejmplo: 2021, 2024, 2023
			select codigo, nombres, apellidos, documento 
			from Alumno where year(fechaRegistro)=@codigo
	end

	if @indicador = 'registrar'
	begin
		insert into Alumno(nombres, apellidos, documento) values (@nombres, @apellidos, @documento)
	end






insert into Alumno(nombres, apellidos, documento) values ('Juan','Noriega','70032421')
go
insert into Alumno(nombres, apellidos, documento) values ('Pedro','Roman','70032422')
go
insert into Alumno(nombres, apellidos, documento) values ('Pedro','Guillo','70032422')
go
insert into Alumno(nombres, apellidos, documento) values ('Roberto','Silva','70032423')
go
insert into Alumno(nombres, apellidos, documento) values ('Ronald','Gutierrez','70032424')
go
insert into Alumno(nombres, apellidos, documento) values ('Pedro','Sifuentes','70032425')
go
insert into Alumno(nombres, apellidos, documento) values ('Luisa','Horna','70032425')
go
insert into Alumno(nombres, apellidos, documento) values ('Jorge','Hernandez','70032425')
go


alter table Alumno
add fechaRegistro datetime
update Alumno set fechaRegistro= GETDATE()
go
update Alumno set fechaRegistro=DATEADD(year, -1, GETDATE()) where codigo= 1
go
update Alumno set fechaRegistro=DATEADD(year, -2, GETDATE()) where codigo= 5
go


select * from Alumno
go


	
	alter table Alumno
	add carrera varchar(30)


	create table carrera 
	(
	codigo int primary key identity(1,1),
	nombre varchar(50)
	)

	insert into carrera(nombre) values ('Ingles')
	insert into carrera(nombre) values ('Computacion E Informatica')

	select * from Alumno

	update ALumno set carrera= 1 
	update Alumno set carrera= 2 where codigo in (3, 5)


	create procedure usp_carrera_select
	as
	begin

	select codigo, nombre from carrera
	end
	go