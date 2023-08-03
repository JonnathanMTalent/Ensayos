// * AL ABRIR DEBE INICIARCE:

// Primero abrir mongod, y luego mongosh. En mongosh  es donde se ejecutarán los comandos.cuando haga coneccion debo dar un enter en el shell o terminal cmd de mongod.exe para que pueda conectarse

//hay que refrescar para que muestre los cambios agregados en las bases de datos.
se cierra con ctrl + c
// ! MONGO FUNCIONA CON JAVASCRIPT, POR LO QUE PUEDO USAR TODAS LAS CARACTERISTICAS DE ESTE.


// // comandos comunes:
/*
help    muestra los comandos de ayuda comunes
db.help    muestra los camandos de las bases de datos
use local     selecciona la base de datos llamada local
documento = { "nombres": "Juan Carlos", "apellidos": "Martinez", "pedidos": [] }  Guardando en una variable un objeot json
 db.productos.insert({"name":"laptop"})
show collections    muestra las colecciones
show dbs     muestra las bases de datos que tienen datos. si no tiene datos no la mostrara.
db.productos.insert({"name":"laptop"})  lo que hay en las llaves es un json, genera la base de datos productos y le inserta el objeto json.
cls para limpiar la consola
db.coleccion_personas.find()  busca o muestra lo que hay en coleccion personas

db.products.drop()
webstore> db.dropDatabase()     borra la base de datos webstore
webstore> db.createCollection("users")   para generar la collecction users en la basedeDatos webstore
webstore> db.products.drop()      borra la coleccion products de la base de datos webstore
db.products.find().pretty()      muestra los objetos que hay en la coleccion products, solo que organizadamente gracias al Pretty(
db.products.insert([{objetoJson1},{objetoJson2},{objetoJson3}])     asi puedo guardar multiples objetos de una sola vez
db.products.find({"name":"mouse"})       Muestra de los objetosJson  el o los que tengan el valor "mouse" en la clave name.
db.products.find({"name":"mouse","type"="computers"})       Muestra de los objetosJson  el o los que tengan los valores indicados..
db.products.findOne({"name":"mouse","type"="computers"})       Muestra de los objetosJson  el primer resultado que tenga los valores indicados..
db.products.findOne({"tags":"computers"},{"name":1,"description":1,"_id":0})   en el segundo objeto estamos poniendo si queremos ver esa informacion en 1, y si no la queremos ver en 0
db.products.findOne({"tags":"computers"}).sort({name:1})   una vez que encuentre la busqueda que la ordene a partir de el valor de name alfabeticamente. Si no lo ordeno me da el orden segun fueron insertados.

db.products.findOne({"tags":"computers"}).limit(3) limita la cantidad de resultados.

db.products.count()    muestra cuantos elementos tiene la coleccion products.
// en vez de console.log()   en mongo se usa print()   porque no esta usando la consola. sino la terminal.

db.products.find().forEach(product=>print("Product Name: " + product.name))   imprimira solo el nombre de cada producto de la coleccion de productos.

!Actualiza todo el objeto:
db.products.update({"name":"mouse"},{"price":99.99})   en el primer objeto se pone el criterio de busqueda, en el segundo el criterio a reemplazar, en este caso busco el primer objeto de la coleccion products con nombre mouse y lo cambio por lo que este escrito en el segundo objeto(en este caso todo lo que habia quedo reemplazado por solo el precio)
//esto debe mandar un WriteResult("nMatched":1,"nUpserted":0,"nModified":1)   que indica si , sí se llevo a cabo cada accion o nó.

!Actualiza solo un valor del objeto
db.products.update({"name":"laptop"},{$set:{"description":"la nueva descripcion"}})

!Inserta el objeto en caso de que no exista
db.products.update({"name":"noExisteEsto"},{$set:{"description":"la nueva descripcion"}},{upsert:true})

!incrementar un valor numerico
db.products.update({"name":"keyboard"},{$inc:{"price":0.01}})    
incremeenta el valor price del objeto con nombre keyboard de la coleccion products en 0.01


!renombrar una propiedad
db.products.update({"name":"keyboard"},{$rename:{"name":"nombreNuevo"}})    


!eliminar datos
db.products.remove({"name":"keyboard"})

!eliminar todos los documentos que tenga dentro una coleccion
db.products.remove({})    




*/