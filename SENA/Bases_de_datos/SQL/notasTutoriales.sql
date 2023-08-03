-- ¿CURSO MYSQL PROGRAMADOR NOVATO:

-- link de la documentacion https://dev.mysql.com/doc/refman/8.0/en/create-table.html

https://www.youtube.com/watch?v=VUoEyBGQnVE&list=PLCTD_CpMeEKQmH9cRKWWHahygZFtIdwYG&index=15

 Servidor de bases de datos : es un programa que provee servicios de base de datos a otros programas u otras computadoras.
- HostName: Ubicación en la red del servidor (Dominio o IP).
- User: En nuestro caso es root, pero lo podemos modificar posteriormente.
Password: En nuestro caso es 123456 lo colocamos cuando instalamos mysql.
- Base de datos: es un conjunto de datos pertenecientes a un mismo contexto y almacenados sistemáticamente para su posterior uso.
- Tablas: se refiere al tipo de modelado de datos donde se guardan los datos recogidos por un programa.
- Campo: Corresponde al nombre de la columna.
- Registro: Corresponde a cada fila que compone la tabla.



Crear una base de datos con create database nombreBD;
Usar una base de datos con use nombreBD;
Borrar una base de datos con drop database nombreBD;
Crear una Base de datos definiendo por default el character set y el collate asi create database nombreBD character set utf8mb4 collate utf8mb4_spanich_ci;


Las tablas en mysql están compuestas por campos y registros y los campos pueden ser de diferentes de datos los cuales se dividen en estos grupos de tipos de datos:
- Tipos numéricos.
- Tipos de Cadena.
- Tipos de Fecha.

Tipos de datos numéricos.
 TINYINT desde -128 hasta 127
 SMALLINT desde -32768 hasta 32767
 MEDIUMINT desde -8388608 hasta 8388607
 INT o INTEGER desde -2147483648 hasta 2147483647
 BIGINT desde -9.22337E+18 hasta 9223372036854775807

Tipos de datos cadena.
 CHAR(n)  n bytes
VARCHAR(n)  n +1 bytes
TINYBLOB, TINYTEXT Longitud+1 bytes
BLOB, TEXT  Longitud +2 bytes
MEDIUMBLOB, MEDIUMTEXT  Longitud +3 bytes
LONGBLOB, LONGTEXT  Longitud +4 bytes
ENUM('value1','value2',...)  1 ó dos bytes dependiendo del número de valores
SET('value1','value2',...)   1, 2, 3, 4 ó 8 bytes, dependiendo del número de valores

Tipos de datos fecha.
DATE  3 bytes
DATETIME  8 bytes
TIMESTAMP  4 bytes
TIME  3 bytes
YEAR  1 byte

Características de la columna.
NOT NULL | NULL: Establecemos si el valor de la columna debe rellenarse obligatoriamente o no.
AUTO_INCREMENT: Establece un valor inicial para un incremento posterior con la inserción de cada nuevo registro.
PRIMARY KEY: No se puede repetir el valor del campo.
DEFAULT ‘valor’: En caso de no colocar ningún dato se coloca el valor asignado.


Crear una tabla en MySQL Workbench 2da parte (Curso de MySQL desde cero [06])
Codigos:
create database escuela character set utf8mb4 collate utf8mb4_spanish_ci;
use escuela;
create table alumnos(
 id int auto_increment primary key,
 nombre varchar (100) not null,
    grado smallint not null,
    grupo varchar(2) not null,
    fecha_ingreso date default '0000-00-00'
);

Alterar una tabla en MySQL workbench (Curso de MySQL desde cero [07])🐬

Muestra las tablas de nuestra base de datos. 
show tables; 

Muestra las columnas de nuestra tabla. 
show columns from nombreTabla;

Muestra el query con el que fue creada la tabla. 
show create table nombreTabla;

Renombra la tabla. 
rename table nombreOriginal to nuevoNombre;

Modificamos la tabla agregando una nueva columna. 
alter table nombreTabla add nombreCampo int not null;

Modificamos la tabla cambiando el nombre del campo y modificamos el tipo de dato. 
alter table nombreTabla change nombreOriginalCampo nuevoNombreCampo smallint not null;

Modificamos la tabla borrando una columna. 
alter table nombreTabla drop column nombreColumna;

-- ¿ Manipular tablas de MySQL con la interfaz gráfica de WorkBench (Curso de MySQL desde cero [08])🐬
En este tutorial vamos a crear una interfaz grafica con la ayuda de la interfaz grafica que nos ofrece workbench y aremos los siguientes pasos:
- Usar una base de datos.
- Ver las tablas de nuestra base de datos.
- Ver las columnas de nuestra tabla.
- Crear una tabla con sus respectivas columnas y tipo de datos.
- Editar una tabla y sus campos.
- Borrar una columna.
- Borrar una tabla.


-- ¿ Relaciones entre tablas de MySQL Workbench (Curso de MySQL desde cero [09])🐬
La relación es una asociación establecida entre campos comunes (columnas) en dos tablas. 
Retomando el ejemplo de nuestra escuela, supongamos que tenemos nuestra tabla alumnos pero esos alumnos toman clases en un salón de clases, entonces existe una relación entre la tabla alumnos y salón.

Existen tres tipos de relaciones en las tablas esta son:
- De uno a muchos.
- De muchos a muchos.
- De uno a uno.

Relaciones de uno a muchos en tablas de MySQL
Un ejemplo de una relación de uno a muchos seria el caso de que un alumno pueda tener un salón pero un salón pueda tener varios alumnos.

Relaciones de muchos a muchos en tablas de MySQL
Un ejemplo de una relación de muchos a muchos sería el caso de que un alumno pueda tener varios salones y un salón pueda tener varios alumnos.

Relaciones de uno a uno en tablas de MySQL
Un ejemplo de una relación de uno a uno sería el caso de que un intendente se encargue de limpiar un solo salón.

-- ¿ Crear una relación de uno a muchos en MySQL Workbench (Curso de MySQL desde cero [10])🐬
En este tutorial aremos los siguiente:
- Crearemos la tabla salon con los campos id,grupo,grado.
- Eliminamos las columnas grado y grupo de la tabla alumno.
- Agregamos la columna idSalon a la tabla alumno.
- Vincular el campo idSalon de la tabla alumno con el campo id de la tabla salon, con el siguiente comando: 
alter table nombreTabla add constraint nombreLlaveForanea foreign key (campoTabla) references nombreOtraTabla (campoOtraTabla) on delete cascade on update cascade;

Codigos:
create table salon(
 id int not null primary key auto_increment,
    grado int not null,
    grupo varchar(2) not null
);

alter table alumno drop column grado;
alter table alumno drop column grupo;

alter table alumno add column idSalon int not null after id;

alter table alumno add constraint fk_idSalon foreign key (idSalon)
references salon (id) on delete cascade on update cascade;

INSERT INTO `salon` (grupo,grado) VALUES ('A',1),('B',1),('C',1);

INSERT INTO `alumno` (nombre,fecha_ingreso,idSalon) VALUES ('JUAN','2020-01-01',1),('PEPE','2020-01-01',1),('MARIA','2020-01-01',2),('TERE','2020-01-01',2);

-- ¿Crear una relación de uno a muchos en MySQL en WorkBench con interfaz gráfica [11]🐬

Vincular el campo idSalon de la tabla alumno con el campo id de la tabla salon con la opciones:
cascade
set null
restrict
no action

Codigos:
CASCADE
ALTER TABLE `escuela`.`alumno` 
DROP FOREIGN KEY `fk_idSalonNoAccion`;
ALTER TABLE `escuela`.`alumno` 
ADD CONSTRAINT `fk_idSalonCascade`
  FOREIGN KEY (`idSalon`)
  REFERENCES `escuela`.`salon` (`id`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;

-- !NO ACCION 
ALTER TABLE `escuela`.`alumno` 
DROP FOREIGN KEY `fk_idSalonNoAccion`;
ALTER TABLE `escuela`.`alumno` 
ADD CONSTRAINT `fk_idSalonNoAccion1`
  FOREIGN KEY (`idSalon`)
  REFERENCES `escuela`.`salon` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

-- !RESTRICT
ALTER TABLE `escuela`.`alumno` 
DROP FOREIGN KEY `fk_idSalonNoAccion1`;
ALTER TABLE `escuela`.`alumno` 
ADD CONSTRAINT `fk_idSalonRestrict`
  FOREIGN KEY (`idSalon`)
  REFERENCES `escuela`.`salon` (`id`)
  ON DELETE RESTRICT
  ON UPDATE RESTRICT;

-- !SET NULL
ALTER TABLE `escuela`.`alumno` 
DROP FOREIGN KEY `fk_idSalonNoAccion1`;
ALTER TABLE `escuela`.`alumno` 
ADD CONSTRAINT `fk_idSalonSetNull`
  FOREIGN KEY (`idSalon`)
  REFERENCES `escuela`.`salon` (`id`)
  ON DELETE SET NULL
  ON UPDATE SET NULL;

-- ¿  Crear una relación de uno a muchos en MySQL en WorkBench con Diagramas [12]🐬
--   En este tutorial aprenderemos a crear diagramas entidad relacion con la herramienta de diagramas que nos ofrece workbench con la que haremos:
-- - Crear la tabla salon.
-- - Crear la tabla alumno.
-- - Crear una llave foranea entra alumno (idSalon) y salon (id).

-- ¿Leer e insertar registros en MySQL Workbench (Curso de MySQL desde cero [13])🐬
Leeremos los registros insertados con:
select * from tabla;
Insertamos nuevos registros con:
insert into tabla (campo1,campo2,...) values ("Valor campo 1","Valor campo 2");
Desactivaremos las restricciones con:
set foreign_key_checks=0;
Analizaremos diferentes formas de insertar registros.
Analizaremos la forma en la que las llaves foráneas restringen la inserción de registros.

Codigos:
select * from salon;
select * from alumno;

truncate table salon;
truncate table alumno;

set foreign_key_checks=1;

show columns from salon;
insert into salon (id,grado,grupo) values (null,1,"B");
insert into salon (grado,grupo) values (1,"A");
insert into salon values (null,1,"C");

insert into salon (grado,grupo) values (2,"A"),(2,"B"),(2,"C");

show columns from alumno;
insert into alumno (idSalon,nombre,fecha_ingreso) values (1,'Maria','2020-01-01');
insert into alumno (idSalon,nombre,fecha_ingreso) values (2,'Juan','2020-01-01');