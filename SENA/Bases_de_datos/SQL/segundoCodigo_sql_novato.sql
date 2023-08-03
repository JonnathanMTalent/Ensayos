-- link de la documentacion https://dev.mysql.com/doc/refman/8.0/en/create-table.html

use escuela;
select * from salon;
truncate table salon; -- la llave foranea impide hacer el truncate

set foreign_key_checks=0; --*  Deshabilita el chekeo de las llaves foraneaas 
truncate table salon; -- despues de deshablitar las llaves si funciona
truncate table alumno; -- borramos la tabla alumno

show columns from salon;
-- *CUATRO FORMAS DE INSERTAR VALORES
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
-- *ELIMINAR UN REGISTRO

select * from alumno;
delete from alumno where id='1';

delete from alumno where nota='5';
delete from salon where id='1';

delete from alumno; -- borra todo lo que hay en la tabla alumno, sin resetear los indices o contadores
truncate table alumno; -- borra todo lo que hay en la tabla alumno, reseteando tambien los contadores que hay.


-- *CONSULTAS AVANZADAS. 

select * from alumno; --  NO SE RECOMIENDA PORQUE PUEDEN SER DEMSASIADOS DATOS.
select nombre from alumno;
select idSalon, nombre, nota from alumno;
select idSalon, nombre, nota from alumno where idSalon=3 and nota>5;
select idSalon as salon, nombre, fecha_ingreso as fecha from alumno where idSalon=3 and nota>5;  -- como todavia no se ha actulizado el as de idSalon no se puedde usar el alias salon en el query. 

-- *USANDO GROUP BY:

select * from alumno group by idSalon; -- mostrara el primer elemento de cada grupo, pero habra generado grupos basandose en idSalon. 
select count(id) from alumno group by idSalon; -- Cuenta de los campos id de la tabla alumno cuantos hay en cada grupo. 
select idSalon, count(id) from alumno group by idSalon; -- muestra los idSalon que hay en una columna y luego el conteo de cada grupo. 
select idSalon, count(id) as Cantidad_de_alumnos from alumno group by idSalon; -- hace lo mismo que el anterior solo que le cambia el nombre a count(id) para que sea mas entendible. 

-- *MINIMOS Y MAXIMOS:

select min(nota), max(nota) from alumno; -- minimo y maximo. 
select min(nota) as minima_nota, max(nota) as maxima_nota from alumno; -- minimo y maximo renombrado.
select min(nota) as minima_nota, max(nota) as maxima_nota from alumno; -- minimo y maximo renombrado.
select min(nota) as minima_nota, max(nota) as maxima_nota from alumno where idSalon=3; -- minimo y maximo renombrado y filtrado con el idSalon. 

-- *LIMITES:

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
select * from alumno where fecha_ingreso between '2021-02-01' and '2021-03-05';  -- between se usa sobre todo para fechas. 

select * from alumno where idSalon=2 or idSalon=3 or idSalon=4;
select * from alumno where idSalon in (2,3,4);  -- entrega los valores que esten en el paretesis. 
select * from salon where grado=1;
select * from alumno where idSalon in (3,4);
select * from alumno where idSalon in (select id from salon where grado=1); -- se puede hacer el filtro dentro del parentesis pero con una sola columna. 


-- *CONSULTAS CON OPERECIONES MATEMÁTICAS:
select * from alumno where nota=5*2;  -- se podrian usar variables. 
select * from alumno where nombre like 'juan';  -- busca elementos parecidos indeferente de mayusculas y minusculas.
select * from alumno where nombre like 'j%';  -- busca elementos parecidos que inicien con j 
select * from alumno where nombre like '%a';  -- busca elementos parecidos que terminan en a 
select * from alumno where nombre like '%n%';  -- busca elementos parecidos que tengan una n en alguna parte.

select * from alumno where nombre not like '%n%' and nombre not like '%p%';  -- busca elementos parecidos que NÓ tengan una n o una p en alguna parte.
 
-- *CONSULTAS CON INNER JOIN- LEFT JOIN- RIGHT JOIN


-- primera forma INNER JOIN (solo muestra valores relacionados):
select * from alumno 
inner join salon 
on alumno.idSalon=salon.id;

-- otra forma:
select alumno.nombre, alumno.fecha_ingreso, alumno.nota, salon.grado, salon.grupo
from alumno
inner join salon
on alumno.idSalon=salon.id;

-- la misma de arriba pero usando alias as:
select a.nombre, a.fecha_ingreso, a.nota, s.grado, s.grupo
from alumno as a
inner join salon as s
on a.idSalon=s.id;

-- LEFT JOIN (Le da prioridad a la tabla izquierda, mostrando al final tambien los valores que no esten relacionados con la segunda tabla:
select a.nombre, a.fecha_ingreso, a.nota, s.grado, s.grupo
from alumno as a
left join salon as s
on a.idSalon=s.id;


-- RIGHT JOIN (Le da prioridad a la tabla derecha, mostrando al final tambien los valores que no esten relacionados con la primera tabla:
select a.nombre, a.fecha_ingreso, a.nota, s.grado, s.grupo
from alumno as a
right join salon as s
on a.idSalon=s.id;


CREATE TABLE `escuela`.`materia` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  PRIMARY KEY (`id`));
  

--* GENERAMOS UNA RELACION DE MUCHOS A MUCHOS CON LA GENERACION DE UNA NUEVA TABLA.
-- Esta tomando datos de las tablas alumno y materia para relacionarlos en la nueva tabla clase.
-- esto lo hace a travez de las llaves primarias de cada una (id de alumno, id de materia) y las convierte en llaves foraneas en la tabla clase.

CREATE TABLE `escuela`.`clase` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `idAlumno` INT NULL,
  `idMateria` INT NULL,
  `hora` TIME NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_idalumno_idx` (`idAlumno` ASC) VISIBLE,
  INDEX `fk_idmateria_idx` (`idMateria` ASC) VISIBLE,
  CONSTRAINT `fk_idAlumno`
    FOREIGN KEY (`idAlumno`)
    REFERENCES `escuela`.`alumno` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_idMateria`
    FOREIGN KEY (`idAlumno`)
    REFERENCES `escuela`.`materia` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);
    
    
    select * from escuela.materia;
    
INSERT INTO clase (idAlumno, idMateria, hora) VALUES 
('1', '1', '8:00'),
('1', '2', '9:00'),
('1', '3', '10:00'),
('1', '4', '11:00'),
('1', '5', '12:00'),
('2', '1', '8:00'),
('2', '2', '9:00'),
('2', '3', '10:00'),
('2', '4', '11:00'),
('2', '5', '12:00'),
('3', '1', '8:00'),
('3', '2', '9:00'),
('3', '3', '10:00'),
('3', '4', '11:00'),
('3', '5', '12:00');
    
select * 
from clase
inner join alumno on clase.idAlumno=alumno.id;

select * 
from clase
inner join materia on clase.idMateria=materia.id;


select * 
from clase
inner join alumno on clase.idAlumno=alumno.id
inner join materia on clase.idMateria=materia.id;

select a.nombre as alumno, m.nombre as materia, c.hora   -- ESTA ES LA MAS COMPLETA que muestra la tabla 
from clase as c
inner join alumno as a on c.idAlumno=a.id
inner join materia as m on c.idMateria=m.id;

select a.nombre as alumno, m.nombre as materia, c.hora   -- ESTA ES LA MAS COMPLETA haciendo filtro con where
from clase as c
inner join alumno as a on c.idAlumno=a.id
inner join materia as m on c.idMateria=m.id
-- where c.hora='8:00' -- quedo comentado
where c.hora  between '8:00' and '10:00'
;


-- *GENERANDO VISTAS 

create view vista_alumnos_sin_salon as
select *
from alumno
where idSalon is null;

select * from vista_alumnos_sin_salon;  -- PARA VER LO QUE HAY EN LA VISTA HAY QUE LLAMARLA IGUAL QUE UNA TABLA. 

drop view vista_alumnos_sin_salon;  -- borramos la vista para modificarla. 

alter view vista_alumnos_sin_salon as  -- cuando usamos alter no tenemos que usar el drop de la linea anterior pues esto altera la vista sin tener que eliminarla.
select id, nombre as alumno, nota as calificacion  -- la vista tiene que existir para poder alterarla.
from alumno
where idSalon is null;

select * from vista_alumnos_sin_salon
where alumno like '%n%';


-- *INNER JOIN ENTRE TRES TABLAS:

alter view vista_alumnos_en_materia as
select count(m.id) as Cantidad_alumnos, m.nombre as materia
from clase as c
inner join materia as m on c.idMateria=m.id
inner join alumno as a on c.idAlumno=a.id
group by m.id
;

select * from vista_alumnos_en_materia;



-- *VARIABLES EN SQL:
use escuela;
set @nota_reprobado=4;
set @nota_minimo=5;
set @nota_excelente=10;

set @cantidad_reprovado=0;
set @cantidad_minimo=0;
set @cantidad_excelente=0;

 --¿ la palabra into guarda el valor en la variable:

select count(*) into @cantidad_reprobado
from alumno
where nota<=@nota_reprobado;

select count(*) into @cantidad_minimo
from alumno
where nota>=@nota_minimo;

select count(*) into @cantidad_excelente
from alumno
where nota>=@nota_excelente;

select @cantidad_reprobado as reprobados, @cantidad_minimo as aprobados, @cantidad_excelente as excelentes;




-- *PROCEDIMIENTOS ALMACENADOS EN MYSQL:

-- se diferencian de las funciones en que en este caso se puede tener cuantas variables de entrada y salida se 
-- quiera, ademas las funciones se pueden llamar dentro de otras sentencias, estos procedure nó.

--¿  in indica parametro de entrada. out indica parametro de salida,; luego hay que poner de que tipo es el parámetro
--¿ begin - end indican el inicio y final respectivamente de el procedure.

delimiter //
create procedure alumnos_con_letra(in letra char)
begin
select *  -- esta linea si queremos ver el registro completo (renglon de la tabla).
-- select count(*) -- esta linea si queremos solo contar los registros. 
from alumno
where nombre like concat('%',letra,'%');
end//
delimiter ; -- entre delimiter y ; hay un espacio para que no salga error.

-- drop procedure alumnos_con_letra; -- asi se borra un procedure. 

call alumnos_con_letra('j');


delimiter //
create procedure alumnos_con_letra_con_retorno(in letra char, out numero int)
begin
-- select *  -- esta linea si queremos ver el registro completo (renglon de la tabla).
select count(*) into numero-- esta linea si queremos solo contar los registros. 
from alumno
where nombre like concat('%',letra,'%');
end//
delimiter ; -- entre delimiter y ; hay un espacio para que no salga error.


call alumnos_con_letra_con_retorno('j',@cantidad_j);
select @cantidad_j;

call alumnos_con_letra_con_retorno('l',@cantidad_l);
select @cantidad_l;


-- FORMA PARA LLAMAR TODO JUNTO:
call alumnos_con_letra_con_retorno('l',@cantidad_l);
call alumnos_con_letra_con_retorno('i',@cantidad_i);
call alumnos_con_letra_con_retorno('j',@cantidad_j);

select @cantidad_l as con_l, @cantidad_j as con_j,  @cantidad_i as con_i;

-- *FUNCIONES EN SQL:
-- se diferencian de los procedure en que en este caso se puede tener solo variables de entrada en los parametros, una sola salida  
-- , ademas las funciones se pueden llamar dentro de otras sentencias, los procedure nó.

delimiter //
create function numero_letras(letra char) returns int
begin
	declare numero int;
    select count(*) into numero from alumno where nombre like concat('%',letra,'%');
    return numero;
end//
delimiter ; -- entre delimiter y ; hay un espacio. 

select numero_letras('j');


select left(nombre,1) from alumno; -- muestra la primera letra de izquierda a derecha de cada elemento de la tabla alumno.

select left(nombre,1) as letra, numero_letras(left(nombre,1)) as alumnos_con_letra from alumno; -- FORMA CHEVERE DE FUNCION

-- *DIFERENCIAS ENTRE PROCEDIMIENTOS Y FUNCIONES DE SQL
use escuela;

drop procedure if exists opereciones_p;

delimiter // 
create procedure operaciones_p(in numero1 int, in numero2 int, out res_mul int, out res_suma int)
begin
	select numero1*numero2, numero1+numero2 into res_mul, res_suma;
end //
delimiter ;

set @res_mul=0;
set @res_suma=0;
call operaciones_p(3,3, @res_mul,@res_suma);
select @res_mul, @res_suma;


-- Funcion para comparar:
delimiter //
create function operaciones_f(numero1 int, numero2 int) returns int
begin
	set @res_mul=0;
    select numero1*numero2 into @res_mul;
    return @res_mul;
     
end//
delimiter ;

select operaciones_f(3,3);


--  en este precedimiento usamos dentro de él una funcion.
delimiter // 
create procedure operaciones_p_f(in numero1 int, in numero2 int, out res_mul int, out res_suma int)
begin
	select operaciones_f(numero1,numero2), numero1+numero2 into res_mul, res_suma;
end //
delimiter ;

call operaciones_p_f(3,3,@res_mul,@res_suma);
select @res_mul, @res_suma;

CREATE TABLE `acciones` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `accion` VARCHAR(45) NULL,
  `fecha` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`));

select *from escuela.acciones;


-- *GENERANDO GATILLOS O TRIGGER:
-- los gatillos sirven para la seguridad de la base de datos. Ya que generan registro de acciones
-- son similares a un addEveentListener de javaScript

delimiter //
create trigger log_tabla_alumno after insert on alumno
for each  row begin
	insert into acciones(accion) 
    value (concat('Se creo un registro en alumno',new.nombre,' y id:',new.id));
end //
delimiter ;

drop trigger log_tabla_alumno;  -- ASI SE BORRA UN TRIGGER. 


-- *Administrar los privilegios de usuario en mySql workbench

select * from mysql.user; -- el signo % significa que tiene todos los permisos y se puede conectar desde cualquier red y pc. 
grant usage on *.* to gestor identified by 'gato33_33gato'; -- el nombre 'gestor' puede ser cualquier nombre. 
-- el signo *.* significa todas las bases de datos y todas las tablas. 

grant usage on *.* to gestor@localhost identified by 'gato33_33_gato'; -- el @ delimita desde dónde se puede conectar.

-- grant usage on *.* to gestor@170.168.1.,120 identified by 'gato33_33gato'; -- dando la ip como host  NO DAR ENTER, LA IP ES INVENTADA

drop user gestor@localhost;
-- drop user @170.168.1.,120 ;
drop user gestor; -- de esta forma se quita el usuario que se puede conectar desde fuera, por seguridad es bueno dejar solo el de localhost. 

grant select,delete,update,insert, create, drop on *.* to gestor;  -- Da permisos (select, delete) al usuario gestor de ver todas las bases de datos y todas las tablas. 
grant all privileges on *.* to gestor;

show grants for gestor; -- muestra los permisos que tenga el usuario 'gestor'. 
revoke all privileges on *.* from gestor; -- quita todos los privilegios que se le dió al usuario. 
flush privileges; --  actualiza los privilegios. 



-- *EXPORTAR UN EXCELL
use escuela;
select * from escuela.alumno where nota >=7
into outfile 'mayorque7s.csv'
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
;
-- para exportar: click en el mune que se abre en: export recordset to external file