
CREATE DATABASE DSW_LAB
GO

use DSW_LAB
GO

CREATE TABLE Alumno
(
	Codigo int primary key identity(1,1),
	Nombre varchar(20),
	ApellidoPaterno varchar(30),
	ApellidoMaterno varchar(30),
	Genero varchar(1),
	Documento varchar(8)
)
GO

Alter table Alumno
add Estado int
go



ALTER procedure usp_alumno_crud
@indicador varchar(30),
@Codigo int,
@Nombre varchar(20),
@ApellidoPaterno varchar(30),
@ApellidoMaterno varchar(30),
@Genero  varchar(1),
@Documento varchar(8)
as
begin
	SET NOCOUNT ON
	if @indicador = 'registrar'
	begin
		insert into Alumno(Nombre, ApellidoPaterno, ApellidoMaterno, Genero, Documento, Estado) 
		values (@Nombre, @ApellidoPaterno, @ApellidoMaterno, @Genero, @Documento, 1)
		Select 1
	end

	if @indicador = 'listar'
	begin
		select Codigo, Nombre, ApellidoPaterno, ApellidoMaterno, Genero, Documento, Estado from Alumno
	end

	if @indicador = 'actualizar'
	begin
		update Alumno set
		Nombre= @Nombre, ApellidoPaterno= @ApellidoPaterno, ApellidoMaterno= @ApellidoMaterno, Genero=@Genero, Documento=@Documento
		where Codigo =@Codigo
		Select 1
	end

	if @indicador = 'listarxId'
	begin
		select Codigo, Nombre, ApellidoPaterno, ApellidoMaterno, Genero, Documento, Estado 
		from Alumno where Codigo= @Codigo
	end

	if @indicador = 'eliminarxId'
	begin
		update Alumno set Estado=0 where Codigo= @Codigo
		Select 1
	end
	
end
go