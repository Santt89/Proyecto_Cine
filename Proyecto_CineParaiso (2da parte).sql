--Seleccionamos la base de datos
USE [Cine_Paraíso]
GO

CREATE TABLE Planes (id int Identity PRIMARY KEY , nombre VARCHAR(20))

CREATE TABLE PeliculasPorPlan (id int Identity PRIMARY KEY , pelicula int, foreign key(Pelicula) references Pelicula(id), planes int,  foreign key(planes) references Planes(id)) 

CREATE TABLE Suscripcion (id int Identity PRIMARY KEY, mensual_anual VARCHAR(30), planes int, foreign key (planes) references Planes(id), estado BIT)
--Decidimos poner el tipo de suscripción (mensual_anual) como VARCHAR por si despues se agregan otros tipos de suscripciones.

CREATE TABLE Usuarios (id int Identity PRIMARY KEY , nombre VARCHAR(20), contraseña VARCHAR(20),suscripcion int, foreign key(suscripcion) references Suscripcion)

CREATE TABLE RegistroPagos (id int Identity PRIMARY KEY , fechaInicio date, fechaFin date, suscripcion int, foreign key(suscripcion) references Suscripcion)

INSERT INTO Planes 
VALUES('Gratuito'),
	  ('Premium'),
	  ('Familiar')

INSERT INTO PeliculasPorPlan
VALUES (1,2),
	   (1,3),
	   (2,1),
	   (2,2),
	   (2,3),
	   (3,1),
	   (3,2),
	   (3,3),
	   (4,3),
	   (5,2),
	   (5,3)


INSERT INTO Suscripcion
VALUES ('Mensual', 1 , 0),
	   ('Mensual', 2 , 1),
	   ('Mensual', 3 , 1), 
	   ('Anual', 1 , 1), 
	   ('Anual', 2 , 0), 
	   ('Anual', 3 , 1),
	   ('Mensual', 2 , 0),
	   ('Mensual', 2 , 1)


INSERT INTO Usuarios
VALUES ('Pepe','1234',1),
	   ('juane','1234',2),
	   ('sol','1234',3),
	   ('Santix','1234',4),
	   ('Maru','1234',6),
	   ('kikito','1234',5),
	   ('dragonball','1234',2),
	   ('fx254','1234',3)

INSERT INTO RegistroPagos
VALUES ('01-11-2022', '01-12-2022', 1),
	   ('01-11-2022', '01-12-2022', 1),
	   ('01-11-2022', '01-12-2022', 1),
	   ('01-11-2022', '01-11-2023',4),
	   ('01-11-2021', '01-11-2022', 5),
	   ('01-11-2022', '01-11-2023', 6),
	   ('01-10-2022', '01-11-2022', 7),
	   ('01-11-2022', '01-12-2022', 8)



--3) Suponga que se desea verificar mensualmente si los planes de cada uno de los usuarios están
--al día con los pagos y, en función de eso, actualizar el plan como activo o inactivo. Cree el
--procedimiento almacenado correspondiente, y proponga los criterios a tener en cuenta para
--pasar un plan de activo a inactivo

CREATE PROCEDURE IdentificadorDePago
    @FechaHoy date
AS

	 update Suscripcion set estado = 0

     update Suscripcion set estado = 1 
	 WHERE id IN (select suscripcion from RegistroPagos WHERE fechaFin > @FechaHoy)
	
GO

EXEC IdentificadorDePago '01-12-2022'


--4) Cree un procedimiento almacenado que reciba como parámetros un usuario y una contraseña,
--y devuelva 1 si el login es correcto (es decir, coincide usuario, contraseña, y el plan está activo)
--y 0 en cualquier otro caso.


CREATE PROCEDURE Loggin(
   @usuario VARCHAR(50),
   @contrasena VARCHAR(20),
   @var INT OUTPUT 
  )
AS
BEGIN

select  @var = count(*) from Usuarios 
	 where Suscripcion IN (
	 select id from Suscripcion
	 where estado = 1) 
	 AND nombre = @usuario 
	 AND contraseña = @contrasena

	 print @var
end

--Cuando Santi tipeo mal el usuario, no le dejo entrar:
DECLARE @var INT 
exec Loggin 'Santrx', '1234' , @var output
Select @var

--Cuando lo corrigio, si:
DECLARE @var INT 
exec Loggin 'Santix', '1234' , @var output
Select @var



