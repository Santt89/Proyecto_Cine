--Creamos la base de datos
CREATE DATABASE [Cine_Paraíso]

--Seleccionamos la base de datos
USE [Cine_Paraíso]
GO

-- Ejercicio 2  Escriba las instrucciones SQL para la creación de las tablas correspondientes al diagrama anterior.

--En primer lugar decidimos no usar acentos para los títulos de las variables y los nombres de tablas (ej: Funcion, Pelicula), pero si tienen acento los nombres de las variables (ej: Córdoba, Ciencia Ficción).

CREATE TABLE Sucursal (id int Identity PRIMARY KEY , ciudad VARCHAR(20), direccion VARCHAR(30) , telefono INT) 

CREATE TABLE Sala (id int Identity PRIMARY KEY , sucursal int, foreign key(sucursal) references Sucursal(id), numero_de_sala int) 

CREATE TABLE Pelicula (id int Identity PRIMARY KEY, nombre VARCHAR(30), genero VARCHAR(20), ATP bit)
--La variable ATP se coloca como booleano de manera que 1 significa que es ATP y 0 significa que no es ATP.

CREATE TABLE Funcion (id int Identity PRIMARY KEY , sala int , foreign key(sala) references Sala(id), pelicula int, foreign key(pelicula) references Pelicula(id), dia date, hora time, subtitulos bit)
--La variable subtitulos se coloca como booleano de manera que 1 significa que tiene subtitulos y 0 significa que no tiene subtitulos.

CREATE TABLE Butaca (id int Identity PRIMARY KEY,número int ,  funcion int, foreign key(funcion) references Funcion(id), ocupada bit)
--La variable ocupada se coloca como booleano de manera que 1 significa que el asiento esta vendido y 0 significa que aún no se vendio.
--La tabla Butaca está relacionada directamente con las funciones.


-- Ejercicio 3 Escriba instrucciones SQL para la inserción de datos, de modo de tener información sobre:

--a. Las 3 sucursales existentes actualmente.

--b. Al menos 3 salas por sucursal.

--c. Al menos 20 butacas por sala.

--d. Al menos 5 películas (una de ellas es Argentina, 1985, y otra de ellas es de género ciencia
--ficción).

--e. Al menos 5 funciones (algunas de ellas deben ocurrir entre el 24 y el 31 de octubre de
--2022).


-- A) Ingreso de Sucursales 

INSERT INTO Sucursal 
VALUES('Rosario', 'Junin 2024', 341378459), 
      ('Córdoba', 'Mendoza 2414', 341763478) , 
	  ('La Plata', 'Alem 456', 34152397)
  


-- B) Ingreso de salas
INSERT INTO Sala
VALUES(1, 1), 
	  (1,2), 
	  (1,3), 
	  (2,1), 
	  (2,2), 
	  (2,3), 
	  (3,1), 
	  (3,2), 
	  (3,3)



--Para el ejercicio 6 c) nos parecio necesario a la tabla de salas agregarle el número de butacas que tienen 
--(en nuestro caso todas las salas tienen 20 butacas pero este dato incorporado a esta tabla se podria utilizar luego automatizar
--el proceso y poder tener salas con diferente cantidad de butacas sin problemas en los registros).
--Si bien este dato es un dato que podria obtenerse de una conteo de butacas por sala, 
--la idea seria cuando conozcamos todos los recursos usar este dato para crear 
--las plantillas de las tablas de butacas por función de manera más automática. 
--Por el momento, en este trabajo las tablas de Butacas por función se generaran de manera manual.

ALTER TABLE Sala 
ADD Cant_butacas INT 

Update Sala
set Cant_butacas = 20
where id = 1
Update Sala
set Cant_butacas = 20
where id = 2
Update Sala
set Cant_butacas = 20
where id = 3
Update Sala
set Cant_butacas = 20
where id = 4
Update Sala
set Cant_butacas = 20
where id = 5
Update Sala
set Cant_butacas = 20
where id = 6
Update Sala
set Cant_butacas = 20
where id = 7
Update Sala
set Cant_butacas = 20
where id = 8
Update Sala
set Cant_butacas = 20
where id = 9


-- D) Ingreso de peliculas
INSERT INTO Pelicula
VALUES('Argentina 1985', 'Drama', 1), 
      ('Star Wars','Ciencia Ficción',1), 
	  ('The Notebook','Romance',0), 
	  ('Toy Story','Infantil',1), 
	  ('IT','Terror',0)

	 
-- E) Ingreso de funciones
INSERT INTO Funcion
VALUES(1, 1, '2022/10/25', '18:00:00', 0),
	  (5, 1, '2022/10/25', '17:00:00', 0), 
	  (2,2,'2022/10/26','14:00:00',1),
	  (5,3,'2022/10/27','15:00:00',0),
	  (8,4,'2022/10/30','19:00:00',0),
	  (9,5,'2022/10/31','18:00:00',1)


-- C) Ingreso de butacas ocupadas por función (por nuestra estructura no se podia hacer antes que el D y E).
INSERT INTO Butaca
VALUES(1, 1, 1),
	  (2,1,1),
	  (3,1,0),
	  (4,1,1),
	  (5,1,0),
	  (6,1,1),
	  (7,1,1),
	  (8,1,0),
	  (9,1,0),
	  (10,1,1),
	  (11,1,0),
	  (12,1,0),
	  (13,1,0),
	  (14,1,1),
	  (15,1,0),
	  (16,1,0),
	  (17,1,1),
	  (18,1,0),
	  (19,1,0),
	  (20,1,0),

	  (1, 2, 1),
	  (2,2,0),
	  (3,2,0),
	  (4,2,1),
	  (5,2,0),
	  (6,2,0),
	  (7,2,1),
	  (8,2,0),
	  (9,2,0),
	  (10,2,1),
	  (11,2,0),
	  (12,2,1),
	  (13,2,0),
	  (14,2,1),
	  (15,2,1),
	  (16,2,0),
	  (17,2,1),
	  (18,2,0),
	  (19,2,1),
	  (20,2,0),

	  (1, 3, 1),
	  (2,3,1),
	  (3,3,0),
	  (4,3,1),
	  (5,3,0),
	  (6,3,0),
	  (7,3,1),
	  (8,3,0),
	  (9,3,0),
	  (10,3,1),
	  (11,3,0),
	  (12,3,1),
	  (13,3,0),
	  (14,3,0),
	  (15,3,0),
	  (16,3,0),
	  (17,3,0),
	  (18,3,0),
	  (19,3,0),
	  (20,3,1),

	  (1, 4, 1),
	  (2,4,1),
	  (3,4,0),
	  (4,4,1),
	  (5,4,0),
	  (6,4,0),
	  (7,4,1),
	  (8,4,0),
	  (9,4,0),
	  (10,4,1),
	  (11,4,0),
	  (12,4,1),
	  (13,4,0),
	  (14,4,0),
	  (15,4,0),
	  (16,4,1),
	  (17,4,1),
	  (18,4,1),
	  (19,4,0),
	  (20,4,1),

	  (1, 5, 1),
	  (2,5,1),
	  (3,5,1),
	  (4,5,1),
	  (5,5,1),
	  (6,5,1),
	  (7,5,1),
	  (8,5,1),
	  (9,5,1),
	  (10,5,1),
	  (11,5,1),
	  (12,5,1),
	  (13,5,1),
	  (14,5,1),
	  (15,5,1),
	  (16,5,1),
	  (17,5,1),
	  (18,5,1),
	  (19,5,1),
	  (20,5,1),

	  (1, 6, 1),
	  (2,6,1),
	  (3,6,1),
	  (4,6,1),
	  (5,6,1),
	  (6,6,1),
	  (7,6,1),
	  (8,6,1),
	  (9,6,1),
	  (10,6,1),
	  (11,6,1),
	  (12,6,1),
	  (13,6,1),
	  (14,6,1),
	  (15,6,1),
	  (16,6,1),
	  (17,6,1),
	  (18,6,1),
	  (19,6,1),
	  (20,6,1)





-- Ejercicio 4 Escriba consultas SQL que aporten la información para responder las siguientes preguntas.

--4 a) ¿Cuántas funciones hay en la sucursal La Plata (no importa si la función ya ocurrió o no)?

select count(*) from funcion
where sala IN (select id from sala
where sucursal = (select id from sucursal where ciudad='La Plata'))

--4 b) ¿Cuáles son las películas en cartelera en una fecha determinada (fije la fecha que prefiera) en la sucursal Córdoba?
-- Fijamos la fecha 2022-10-27


--CON SUBCONSULTAS
select nombre from Pelicula
where id IN (select pelicula from funcion
where (sala IN (select id from sala  
where sucursal = (select id from sucursal where ciudad='Córdoba')) and (dia = '2022-10-27')))


--CON PRODUCTO CARTESIANO

SELECT Pelicula.nombre
FROM Pelicula , Sucursal, Funcion , Sala
WHERE Pelicula.id = Funcion.pelicula
AND Funcion.sala = Sala.id
AND Sala.sucursal = Sucursal.id
AND Sucursal.ciudad = 'Córdoba'
AND Funcion.dia = '2022-10-27'



--4 c)¿Cuáles son los horarios disponibles para ver la película Argentina, 1985 en una fecha determinada (fije la fecha) en la sucursal Rosario?
-- Fijamos la fecha 2022-10-25


--CON SUBCONSULTAS
select hora from Funcion 
where pelicula = (Select id from Pelicula 
where nombre = 'Argentina 1985') 
and sala IN (Select id from sala 
where sucursal = (select id from Sucursal 
where ciudad = 'Rosario')) 
and (dia = '2022-10-25')

-- CON PRODUCTO CARTESIANO
SELECT Funcion.hora
FROM Pelicula, Sucursal , Sala , Funcion
WHERE Pelicula.id = Funcion.pelicula
AND Funcion.sala = sala.id
AND Sucursal.id = Sala.sucursal
AND Sucursal.ciudad = 'Rosario'
AND Funcion.dia = '2022-10-25'





--4 d)¿Cuáles son los horarios disponibles para ver la película Argentina, 1985 en una fecha determinada (fije la fecha) para cada sucursal? Muestre estos resultados ordenados cronológicamente de forma creciente.
-- Fijamos la fecha 2022-10-25

select hora from funcion
where pelicula = (select id from Pelicula
where (nombre = 'Argentina 1985') and (dia = '2022-10-25'))
order by hora ASC

--4 e)¿Cuáles películas de ciencia ficción hay en cartelera la semana del 24 de octubre de 2022 en la sucursal Rosario?

--CON PRODUCTO CARTESIANO
select nombre
FROM  Pelicula  , Funcion , Sucursal , Sala
WHERE Funcion.pelicula = Pelicula.id AND
	  Sucursal.id = Sala.Sucursal AND
	  Funcion.sala = Sala.id AND
	  Pelicula.genero = 'Ciencia Ficción' AND
	  Sucursal.ciudad = 'Rosario'and
	  dia between '2022-10-24' AND '2022-10-31'


--CON INNER JOIN
SELECT Pelicula.nombre FROM Funcion
INNER JOIN Pelicula
ON Funcion.pelicula = Pelicula.id
INNER JOIN Sala
ON Sala.id = Funcion.sala
INNER JOIN Sucursal
ON Sucursal.id = Sala.id
WHERE Pelicula.genero = 'Ciencia Ficción'
AND Funcion.dia BETWEEN '2022-10-24' AND '2022-10-31'

--4 f)¿Cuáles son las butacas vendidas para ver Argentina, 1985 en Córdoba en una función determinada (fije la función)?
select número
FROM Butaca , Pelicula  , Funcion , Sucursal , Sala
WHERE Funcion.pelicula = Pelicula.id AND
	  Butaca.funcion = Funcion.id AND
	  Butaca.ocupada = 1 AND
	  Sucursal.id = Sala.Sucursal AND
	  Funcion.sala = Sala.id AND
	  Pelicula.nombre = 'Argentina 1985' AND
	  Sucursal.ciudad = 'Córdoba' AND
	  Funcion.dia = '2022-10-25'

--4 g)¿Cuáles son las butacas libres para ver Argentina, 1985 en Córdoba en una función determinada (fije la función)?

select número
FROM Butaca , Pelicula  , Funcion , Sucursal , Sala
WHERE Funcion.pelicula = Pelicula.id AND
	  Butaca.funcion = Funcion.id AND
	  Butaca.ocupada = 0 AND
	  Sucursal.id = Sala.Sucursal AND
	  Funcion.sala = Sala.id AND
	  Pelicula.nombre = 'Argentina 1985' AND
	  Sucursal.ciudad = 'Córdoba' AND
	  Funcion.dia = '2022-10-25'

--4 h)¿Cuántas peliculas por género están o estuvieron en cartelera en el Cine Paraíso?

select genero, count(*) AS cantidad from Pelicula
group by genero 

--Ejercicio 5 Determine qué alteraciones sería conveniente realizar en las tablas en los siguientes casos, justificando la respuesta:

--5- a) Agregar a la tabla Sucursal una columna con precio
--ALTER TABLE Sucursal 
--ADD precio INT 

--5- b) Agregar a la tabla Pelicula una columna con precio (realizado en 6).

--5- c) Agregar a la tabla Butaca una columna de ubicación y una columna de precio según la ubicación
--ALTER TABLE Butaca 
--ADD precio INT, ubicacíon VARCHAR(10) 

--6- Realizar el 5--b)
ALTER TABLE Pelicula 
ADD precio INT 

Update Pelicula
set precio = 780
where id = (Select id from Pelicula WHERE nombre = 'Argentina 1985')
Update Pelicula
set precio = 1100
where id = (Select id from Pelicula WHERE nombre = 'Star Wars')
Update Pelicula
set precio = 900
where id = (Select id from Pelicula WHERE nombre = 'The Notebook')
Update Pelicula
set precio = 550
where id = (Select id from Pelicula WHERE nombre = 'Toy Story')
Update Pelicula
set precio = 440
where id = (Select id from Pelicula WHERE nombre = 'IT')



--6- a) Determine el total recaudado por función

SELECT Funcion.id, Pelicula.nombre , Funcion.dia , Funcion.hora , sum(Pelicula.precio) as Recaudado
FROM  Butaca, Funcion, Pelicula
WHERE Funcion.pelicula = Pelicula.id AND
	  Butaca.funcion = Funcion.id AND
	  Butaca.ocupada = 1
GROUP BY Funcion.id , Pelicula.nombre , Funcion.dia , Funcion.hora

--6-  b) Determine el promedio recaudado por función para cada película. Es decir, si la película Argentina, 1985 tuvo dos funciones, y en una recaudó 1000 pesos, y en la otra recaudó 3000 pesos, el promedio recaudado por funci´on para esta pel´ıcula es 2000 pesos.

SELECT Pelicula.nombre, sum(Pelicula.precio) / count (DISTINCT Funcion) AS Promedio_por_funcion
FROM Butaca, Funcion, Pelicula
WHERE Funcion.pelicula = Pelicula.id AND
	  Butaca.funcion = Funcion.id AND
	  Butaca.ocupada = 1
GROUP BY Pelicula.nombre


--6- c) Determine el porcentaje de entradas vendidas por función, y muestre pelicula, sucursal, hora y dia, solo para aquellas en las que se vendio menos del 50 %

SELECT funcion.id ,Sucursal.ciudad ,Pelicula.nombre, Funcion.dia , Funcion.hora, (((count(Butaca.ocupada )) * 100) / Cant_butacas) as porcentaje_vendidas
FROM Butaca, Funcion, Pelicula , Sucursal , Sala
WHERE Funcion.pelicula = Pelicula.id AND
	  Butaca.funcion = Funcion.id AND
	  Butaca.ocupada = 1 AND
	  Sucursal.id = Sala.Sucursal AND
	  Funcion.sala = Sala.id
GROUP BY funcion.id, Sucursal.ciudad ,Pelicula.nombre , Funcion.dia , Funcion.hora, Cant_butacas
HAVING (((count(Butaca.ocupada )) * 100) / Cant_butacas) < 50

--6- d) Determine, para cada película, cuál fue la función que más recaudó. 

SELECT pelicula_maxima .nombre ,funcion.id, pelicula_maxima.maxima_recaudacion  FROM
(SELECT nombre, max(recuadacion_total) as maxima_recaudacion from (
SELECT pelicula.nombre , funcion.id , sum(pelicula.precio) AS recuadacion_total FROM
funcion , pelicula , butaca
WHERE Funcion.pelicula = Pelicula.id AND
	  Butaca.funcion = Funcion.id AND
	  Butaca.ocupada = 1
GROUP BY pelicula.nombre , funcion.id) p
GROUP BY nombre) pelicula_maxima  ,
(SELECT pelicula.nombre , funcion.id , sum(pelicula.precio) AS recuadacion_total FROM
funcion , pelicula , butaca
WHERE Funcion.pelicula = Pelicula.id AND
	  Butaca.funcion = Funcion.id AND
	  Butaca.ocupada = 1
GROUP BY pelicula.nombre , funcion.id) funcion 
WHERE pelicula_maxima.nombre = funcion.nombre
AND  pelicula_maxima.maxima_recaudacion = funcion.recuadacion_total







