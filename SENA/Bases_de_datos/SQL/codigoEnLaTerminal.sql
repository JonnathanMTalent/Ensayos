-- ¿ este codigo va en la terminal de cmd
-- link del video. https://www.youtube.com/watch?v=U-0SbQgnnGU&list=PLCTD_CpMeEKQmH9cRKWWHahygZFtIdwYG&index=30
--  link de la documentacion https://dev.mysql.com/doc/refman/8.0/en/create-table.html

-- * RESPALDAR BASES DE DATOS 
-- Generando el archivo de respaldo de la base de datos completa.
mysqldump -u root -p nombreBaseDeDatos > C:\Users\Administrador\Desktop\nombre_de_la_carpeta\nombreDelNuevoArchivo.sql

-- Generando el archivo de respaldo de la algunas tablas de la base de datos.
mysqldump -u root -p escuela --tables tabla1 tabla2 > C:\Users\Administrador\Desktop\nombre_de_la_carpeta\tabla1-tabla2.sql


-- Generando el archivo de respaldo del servidor completo
-- este codigo par el servidor genera una base de datos y el uso, las otras formas solo exsportan las tablas o bases pero nolas crean
mysqldump -u root -p -A > C:\Users\Administrador\Desktop\nombre_de_la_carpeta\todoElServidor.sql

-- * IMPORTAR UN RESPALDO.

-- primero loguerse
mysql -u root -p

-- generar el nombre de la nueva base de datos
create database nombreDeLaBaseDeDatos;

--poner activa la base.
use nombreDeLaBaseDeDatos;

-- Darle la ruta donde guardamos anteriormente el respaldo.
source  C:\Users\Administrador\Desktop\nombre_de_la_carpeta\todoElServidor.sql
-- //si sale un error:
-- dale click secundario en el archivo de respaldo darle en editar y en codificacion cambiar al utf8, guardamos y repetimos el paso.

