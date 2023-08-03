
--! Esta documentación se puede leer de la siguiente forma:
--// link para ver la documentacion
 https://dev.mysql.com/doc/refman/8.0/en/create-table.html

-- nombre_columna:
-- es el nombre que se le dará a la columna a definir.
-- tipo_dato: es el tipo de datos de la columna
-- (INT, FLOAT, VAR CHAR).
-- [NOT NULL | NULL]: todo lo que encuentre encerrado entre corchetes ([]) significa que es opcional pude incluirse o no, dentro de las opciones.
-- Lo que encuentre entre separado por el carácter pai ( | ), significa que debe escoger una opción de las que están paradas por el pai.

--// OTRA DOCUMENTACION DE FUNCIONES DE SQL EN W3  
https://www.w3schools.com/mysql/mysql_ref_functions.asp

-- ! FUNCIONA LO MISMO QUE PARA WORKBENCH TODAS LAS NOTAS ANTERIORES. tiene pequeñas diferencias

MariaDB []> use prueba;
MariaDB [prueba]> SHOW DATABASES;
MariaDB [prueba]> SHOW TABLES;
MariaDB [prueba]> create table ciudad1 (nombre varchar(20) not null, poblacion int null);

-- //valores por defecto
MariaDB [prueba]> create table ciudad2 (nombre varchar(20) not null, poblacion int null default 50000);

-- //claves primarias
-- En cada tabla únicamente puede haber una clave primaria, y la columna sobre la que se concreta una clave primaria no puede poseer valores NULL, como ya se hizo mención. Si esto no se especifica de forma explícita, MySQL lo hará de forma automática.
MariaDB [prueba]> create table ciudad3 (nombre varchar(20) not null primary key, poblacion int null default 50000);


--// columnas autoincrementadas
-- esta columna sólo puede ser de tipo entero y llave primaria.
-- Si cuando se inserta una fila se excluye el valor de la columna autoincrementada o si a un valor nulo se le intenta insertar para esa columna, su valor será calculado automáticamente, tomando el valor mayor de esa columna y sumándole uno, es decir, es secuencial. Permitiendo crear, una columna con un valor único y secuencias para cada fila de la tabla.
-- Comúnmente, estas columnas son usadas como claves primarias secuenciales. SQL solo las permite en números enteros, es decir una columna de otro timo no podrá ser autoincrementable, de tal forma que la composición de clave primaria, que sea entera y autoincrementada es perfecta para ser usada como clave primaria artificial:
MariaDB [prueba]> create table ciudad5 (clave int auto_increment primary key comment 'esto es la clave principal',  --¿ esto es un comentario se unsa '' comilla simple
MariaDB [prueba]> nombre varchar(20) not null primary key, poblacion int null default 50000);


desc ciudad5;  -- ¿ este comando es diferente ;; muestra la tabla y sus componentes pero no su contenido.

-- * Claves primarias compuestas
-- Generar una tabla sql
MariaDB [prueba]> create table persona(
    -> tipo_documento CHAR(2) NOT NULL,
    -> documento_identidad CHAR(10) NOT NULL,
    -> nombres CHAR(30),
    -> PRIMARY KEY (tipo_documento, documento_identidad));  -- si se quiere dejar una sola se coloca una, cada " , "separa la nueva llave


    -- *INDICES

--     Se tienen tres tipos de índices. El primero pertenece a las claves primarias, que como se vió, también se pueden crear en la parte de definición de columnas.

-- ¿Cuándo es oportuno crear índices?

-- A
-- Cuando se define una llave foránea.
-- B
-- Cuando se sabe que se realizarán consultas directas sobre esa columna.
-- El segundo tipo de índice que existe, permite definir sobre una columna el índice. Para concretar estos índices se usan de manera indistinta las opciones KEY o INDEX.

--//con INDEX
MariaDB [prueba]> CREATE TABLE indices1(
    -> id INT,
    -> nombre VARCHAR(20),
    -> INDEX (nombre));
Query OK, 0 rows affected (0.334 sec)  -- Esta fue la respuesta del shell


--//con KEY
MariaDB [prueba]> CREATE TABLE indices1(
    -> id INT,
    -> nombre VARCHAR(20),
    -> KEY (nombre));
Query OK, 0 rows affected (0.334 sec)  -- Esta fue la respuesta del shell


-- * Claves Únicas
-- El tercer tipo de índices es para crear claves únicas así mismo sobre una columna o sobre varias. Para definir índices con claves únicas se debe de usar la opción UNIQUE.

-- La diferencia entre un índice único y un índice normal, es que en los índices únicos no se admite la inclusión de filas con datos repetidos en la columna o columnas de la tabla. Una excepción es el valor NULL, que sí se puede llegar a repetir varias veces.
-- Los índices son útiles para optimizar las consultas y las búsquedas de datos. Por medio de su uso es mucho más eficiente encontrar filas con ciertos valores de columnas, o mostrar los resultados en cierto orden. La alternativa es realizar búsquedas secuenciales (sin índices), que en tablas extensas requieren mucho tiempo y procesamiento de datos.

mysql> CREATE TABLE indices3 (
-> id INT,
-> nombre CHAR(19),
-> UNIQUE (nombre));
Query OK, rows affected (0.09 sec)


--* CLAVES FORÁNEAS
-- En MySQL únicamente existe soporte para claves foráneas en tablas de tipo InnoDB.

-- InnoDB es el motor de almacenamiento por defecto de las últimas versiones de MySQL, no obstante, esto no imposibilita usarlas en otros tipos de tablas.
-- Es necesario que la columna que posee una definición de clave foránea esté indexada KEY(numero). 


mysql> CREATE TABLE personas (
->id_persona INT AUTO_INCREMENT PRIMARY KEY,
-> nombres VARCHAR(40) NOT NULL,
-> fecha DATE);
Query OK, rows affected (0.13 sec)

CREATE TABLE telefonos (
persona_id INT NOT NULL REFERENCES personas (id) ON DELETE CASCADE ON UPDATE
CASCADE,
numero VARCHAR(20) PRIMARY KEY,
tipo VARCHAR(10)
);

-- Se ha usado una definición a modo referencia para la columna “numero” de la tabla 'telefonos', señalando que es una clave foránea oportuna a la columna 'id_persona' de la tabla 'persona' a través de la columna persona_id. No obstante, aunque la sintaxis se evidencia.

-- La expresión DELETE CASCADE , hace que, si se borra una fila de la tabla persona que tiene relacionados registros telefónicos a través de la columna persona_id en la tabla telefonos, estos registros (localizados en la tabla telefonos)se borren si se borra el de la tabla persona,a este tipo de condiciones se le llama restricción de integridad referencial.

-- De igual forma UPDATE CASCADE, hace que, si el id_persona en una fila de la tabla persona es actualizado a otro valor y existen referencias en la columna persona_id de la tabla telefonos con el valor inicial, al cambar el valor en el registro id_persona, cambien también el valor en los registros en la columna persona_id de la tabla telefonos. A este tipo de condiciones también se le llama restricción de integridad referencial.


-- * USANDO innoDB

CREATE TABLE personas2 ( id_persona INT AUTO_INCREMENT PRIMARY KEY, 
nombres VARCHAR(45), 
fecha DATE
)ENGINE=InnoDB;


CREATE TABLE telefonos2( 
    numero VARCHAR(20), 
    persona_id INT NOT NULL,
    KEY (numero),
    FOREIGN KEY (persona_id) REFERENCES personas2 (id_persona) 
    ON DELETE CASCADE ON UPDATE CASCADE 
) ENGINE=InnoDB;


--  //   ON DELETE <opcion>,
-- Define las acciones que deben de realizar en la tabla actual, cuando se elimine una fila en la tabla referenciada.

-- // ON UPDATE <opcion>,
-- Es semejante, define las acciones que deben de realizar en la tabla actual, cuando se modifique o actualice la columna de una fila en la tabla referenciada.

--//RESTRICT
-- Esta opción imposibilita borrar o editar filas en la tabla referenciada si hay filas con el mismo valor de clave foránea (MySQL 8.0 Reference Manual, 2021).

--// CASCADE
-- Borrar o modificar una clave en una fila en la tabla referenciada con un valor fijo de clave, conlleva borrar las filas con el mismo valor de clave foránea o cambiar los valores de esas claves foráneas (MySQL 8.0 Reference Manual, 2021).

--// SET NULL
-- Borrar o editar una clave en una fila en la tabla referenciada con un valor fijo de clave, involucra determinar el valor NULL a las claves foráneas con el mismo valor. (MySQL 8.0 Reference Manual, 2021)

-- //NO ACTION
-- Las claves foráneas no se alteran, ni se eliminan filas en la tabla que las contiene.

-- //SET DEFAULT
-- Borrar o alterar una clave en una fila en la tabla referenciada con un valor explícito involucra asignar el valor por defecto a las claves foráneas con el mismo valor. (MySQL 8.0 Reference Manual, 2021)

-- BORRAR DATEBASE:
DROP DATABASE [IF EXISTS] db1_name [, db1_name]
-- El if exist evita errores.

-- BORRAR TABLA:
DROP TABLE [IF EXISTS] tbl_name [, tbl_name]
-- El if exist evita errores.


-- *INSERTAR DATOS EN LAS TABLAS  
--!INSERT

-- En este caso se estan insertando datos en la tabla gente
MariaDB [prueba]> INSERT INTO gente (nombre, fecha, edad) VALUES ('Fulano', '1974-04-12', 18); -- el orden de los parametros guarda correspondencia con los valores.
MariaDB [prueba]> INSERT INTO gente (nombre, fecha, edad) VALUES ('Mengano', DEFAULT, DEFAULT); -- Esto colocara valores por default.

MariaDB [prueba]> INSERT INTO gente (nombre, fecha, edad) VALUES
-> ('Tulano', '2000-12-02', '22'),
-> ('Pegano', '1993-02-10', '33');

MariaDB [prueba]> SELECT FROM gente; -- con este comando vemos lo que hay en la tabla gente.


-- * ACTUALIZAR DATOS EN LAS TABLAS
--! UPDATE

UPDATE [LOW PRIORITY] [IGNORE] tbl_name
SET col_name1=expr1 [, col_name2=expr2...]
[WHERE where_definition]
[ORDER BY...]
[LIMIT row_count]


-- EJEMPLO
UPDATE gente SET fecha='2023-12-12';
UPDATE gente SET edad=edad+10;
UPDATE gente SET edad=edad+10 WHERE nombre='tulano'

-- *Borrado de archivos
-- ! DELETE

DELETE [LOW PRIORITY] [QUICK] [IGNORE] FROM table_name
[WHERE where_definition]
[ORDER BY...]
[LIMIT row_count]


--* TRUNCATE Vaciar una tabla--
-- Cuando se deseen borrar todas las filas de una tabla, se puede utilizar una sentencia DELETE 
-- sin condiciones, como se vio en el punto anterior. Pero existe una sentencia alternativa, TRUNCATE, 
-- que hace la misma tarea de una forma mucho más veloz. La diferencia es que DELETE hace un borrado
--  secuencial de la tabla, fila por fila y TRUNCATE elimina la tabla y la vuelve a crear desocupada,
--   lo que es mucho más eficaz.


--* SELECT

SELECT [ALL | DISTINCT | DISTINCTROW]  -- Aqui puedo usar * en ves de All
expresion_select,...
FROM referencias_de_tablas
WHERE condiciones
[GROUP BY nombre_col | expresion posicion}
[ASC DESC], [WITH ROLLUP]]         -- ASC o DESC significa orden Ascendente o Descendente
[HAVING condiciones]
[ORDER BY (nombre_col | expresion posicion}
[ASC DESC],...]    
[LIMIT [[desplazamiento, 1 contador contador OFFSET desplazamiento)]

--*LIMIT
-- limita la cantidad de resultados que van a llegar 

LIMIT 10  -- TRAERA SOLO 10 RESULTADOS

LIMIT 25,10  -- TRAERA 10 RESULTADOS A PARTIR DEL RESULTADO 25 OSEA DEL 25 AL 34


--* GROUP BY
-- Se pueden agrupar filas en la salida con la sentencia SELECT, según los valores de una columna,
--  usando la cláusula GROUP BY. Y se usa con funciones de agrupación como lo son, AVG, SUM, MAX, COUNT,
--  entre otros.
--* JOIN
JOIN         -- muestra solo lo que este en ambas tablas.
LEFT JOIN   -- Da prioridad a la tabla izquierda
RIGHT JOIN --- Da prioridad a la tabla derecha
Existe otros tipos de consultas, las FULL JOIN, FULL OUTER JOIN, CROSS JOIN que no se verán porque son muy poco empleadas, sin embargo, con el concepto principal se puede acceder a la documentación en la Web para comprobar su funcionamiento.