-- create database prueba;
-- link de la documentacion https://dev.mysql.com/doc/refman/8.0/en/create-table.html
/* use prueba;
drop database prueba;
create database prueba character set utf8mb4 collate utf8mb4_spanish_ci;
*/
create database escuela character set utf8mb4 collate utf8mb4_spanish_ci;
use escuela;
create table alumnos(
	nombre varchar(100) not null,
    id int auto_increment primary key,
    grado smallint not null,
    grupo varchar(2) not null,
    fecha_ingreso date default '0000-00-00'
    );
show tables;
show columns from alumnos;
show create table alumnos;
rename table alumnos to alumno;
show columns from alumno;
alter table alumno add edades int not null;
alter table alumno change edades edad smallint not null;
alter table alumno drop column edad;

create table salon(
id int not null primary key auto_increment,
grado int not null,
grupo varchar (2) not null
);
alter table alumno drop column grado;
alter table alumno drop column grupo;
alter table alumno drop column idSalon;
alter table alumno add column idSalon int not null after id;

alter table alumno add constraint fk_idSalon foreign key (idSalon) -- establece la relacion de llave foranea entre tablas
references salon(id)  on delete cascade on update cascade;

--  PILAS: Lo siguiente va en comillas invertidas no comillas normales.
insert into `salon` (grupo,grado) values ('A',1),('B',1),('C',1);
insert into `alumno` (nombre,fecha_ingreso,idSalon) values ('Juan','2020-01-01',1),('Daniel','2020-01-02',2),('Andrea','2020-01-01',1),('Natalia','2020-01-01',2),('Juana','2020-01-01',1);
alter table alumno drop constraint fk_idSalon;


-- ¿SEGUNDO CODIGO

use escuela;
select * from salon;
truncate table salon; -- la llave foranea impide hacer el truncate

set foreign_key_checks=0; -- Deshabilita el chekeo de las llaves foraneaas 
truncate table salon; -- despues de deshablitar las llaves si funciona
truncate table alumno; -- borramos la tabla alumno

show columns from salon;
-- CUATRO FORMAS DE INSERTAR VALORES
insert into salon (id,grado,grupo) values (null,1,"B");
insert into salon (grado,grupo) values (1,"A");
insert into salon  values (null,1,"C");  -- NO es buena práctica, pues no muestra las columnas. Tiene que ser en el orden que se colocaron los campos. 
insert into salon (grado,grupo) values (2,"A"), (2,"B"),(2,"C"); -- ESTA ES LA FORMA RECOMENDADA. 

show columns from alumno;
insert into alumno (idSalon,nombre,fecha_ingreso) values (1,"Maria","2021-01-01");
insert into alumno (idSalon, nombre, fecha_ingreso) values (10,"Pepe","2021-01-01"); -- se pudo hacer esto aunque el salon 10 no existe porque estaba desactivado el chequeo de llaves foráneas
select * from alumno;
set foreign_key_checks=1;
insert into alumno (idSalon, nombre, fecha_ingreso) values (11,"Pepe","2021-01-01"); -- no se pudo hacer esto aunque el salon 11 no existe y esta activo el chequeo de las llaves foraneas. 
insert into alumno (idSalon, nombre, fecha_ingreso) values (2,"Juan","2021-01-01"); 

-- ACTUALIZACION DE REGISTROS EN MYSQL
select * from alumno;
update alumno set nombre="Maria Antonieta"; -- pondria a todos los alumnos maria Antonieta
update alumno set nombre="Maria Antonieta" where id="1";
update alumno set nombre="Maria Antonieta", fecha_ingreso="2019-05-05" where id="1";  -- se puden poner los campos separados por coma para modificar. 

alter table alumno add column nota int not null; -- agrega la columna nota a la tabla alumno;

update alumno set nota=nota+3 where id='1';
update alumno set nota=nota+3 where id='1';
select * from alumno;

-- lo siguiente reemplaza letras o numeros en todos los valores del campo que se indique
update alumno set nota=replace(nota,0,5); -- hay que desactivar la condicion Safe Updates en edit-preferences- sql editor- deschequear abajo safe update...  luego dar a reconect DBMS
update alumno set nombre=replace(nombre,'uan','uanito'); -- es capaz de reemplazar partes parciales de texto, en este caso cambiara juan por juanito habiendo puesto uan-uanito. 


/*
INSERT INTO `escuela`.`alumno` (`nombre`, `idSalon`, `fecha_ingreso`, `nota`) VALUES ('Juan', '1', '2021-01-01', '10');
INSERT INTO `escuela`.`alumno` (`nombre`, `idSalon`, `fecha_ingreso`, `nota`) VALUES ('Maria', '1', '2021-02-02', '10');
INSERT INTO `escuela`.`alumno` (`nombre`, `idSalon`, `fecha_ingreso`, `nota`) VALUES ('Petra', '2', '2021-03-05', '10');
*/

-- ELIMINAR UN REGISTRO

select * from alumno;
delete from alumno where id='1';

delete from alumno where nota='5';
delete from salon where id='1';

delete from alumno; -- borra todo lo que hay en la tabla alumno, sin resetar los indices o contadores
truncate table alumno; -- borra todo lo que hay en la tabla alumno, reseteando tambien los contadores que hay.


-- CONSULTAS AVANZADAS. 

select * from alumno; --  NO SE RECOMIENDA PORQUE PUEDEN SER DEMSASIADOS DATOS.
select nombre from alumno;
select idSalon, nombre, nota from alumno;
select idSalon, nombre, nota from alumno where idSalon=3 and nota>5;
select idSalon as salon, nombre, fecha_ingreso as fecha from alumno where idSalon=3 and nota>5;  -- como todavia no se ha actulizado el as de idSalon no se puedde usar el alias salon en el query. 

-- USANDO GROUP BY:

select * from alumno group by idSalon; -- mostrara el primer elemento de cada grupo, pero habra generado grupos basandose en idSalon. 
select count(id) from alumno group by idSalon; -- Cuenta de los campos id de la tabla alumno cuantos hay en cada grupo. 
select idSalon, count(id) from alumno group by idSalon; -- muestra los idSalon que hay en una columna y luego el conteo de cada grupo. 
select idSalon, count(id) as Cantidad_de_alumnos from alumno group by idSalon; -- hace lo mismo que el anterior solo que le cambia el nombre a count(id) para que sea mas entendible. 

-- MINIMOS Y MAXIMOS:

select min(nota), max(nota) from alumno; -- minimo y maximo. 
select min(nota) as minima_nota, max(nota) as maxima_nota from alumno; -- minimo y maximo renombrado.
select min(nota) as minima_nota, max(nota) as maxima_nota from alumno; -- minimo y maximo renombrado.
select min(nota) as minima_nota, max(nota) as maxima_nota from alumno where idSalon=3; -- minimo y maximo renombrado y filtrado con el idSalon. 

-- LIMITES:

select * from alumno limit 5; -- muestra solo los cinco primeros elementos. 
select * from alumno limit 5,2; -- muestra los 2 siguientes  elementos que esten despues de la posicion 5. 
select * from alumno order by nota; -- por default los muestra en orden ascendente, de menor a mayor.
select * from alumno order by nota asc; -- por default los muestra en orden ascendente, de menor a mayor. asc indica en orden ascendente. 
select * from alumno order by nota desc; -- por default los muestra en orden ascendente, de menor a mayor. desc indica en orden descendente. 


-- 
use escuela;
select * from alumno;
select * from alumno where nota=5 or nota=8 or nota=9; --  uso del or.
select * from alumno where (nota=5 or nota=8 or nota=9) and idSalon=3; --  uso de parentesis, hay que agrupar correctamente. 
select * from alumno where nota!=10 and nota<>5; -- ESTAS DOS FORMAS SIGNIFICAN DIFERENTE DE...
select * from alumno where nota is null; -- entrega solo los valores nulos. 
select * from alumno where nota is not null; -- entrega solo los valores que nó son nulos. 
select * from alumno where nota>=7 and nota<=9; -- entrega notas entre 7 y 9. 
select * from alumno where nota between 7 and 9; -- entrega notas entre 7 y 9. 

