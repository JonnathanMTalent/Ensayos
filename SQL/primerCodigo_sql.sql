-- create database prueba;
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
insert into `salon` (grupo,grado) values ('A',1),('B',1),('C',1);
insert into `alumno` (nombre,fecha_ingreso,idSalon) values ('Juan','2020-01-01',1),('Daniel','2020-01-02',2),('Andrea','2020-01-01',1),('Natalia','2020-01-01',2),('Juana','2020-01-01',1);
alter table alumno drop constraint fk_idSalon;
