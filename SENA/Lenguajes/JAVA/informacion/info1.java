// *Escritura de clases:

// 1 La primera letra debe ser mayúscula.
// 2 Utilizar nomenclatura camelCase (por ejemplo: un nombre compuesto por varias palabras: clase "CuentaAhorros").
// 3Los nombres deben ser sustantivos.

// *Una clase en java se compone por las siguientes declaraciones:

// Paquete
// Comentarios
// Definición de clases
// Atributos
// Constructores
// Métodos


//*instanciar un Objeto
// Para instanciar un objeto de una clase en Java se utiliza la palabra reservada new y se crea el objeto del tipo de la clase así:
Producto p = new Producto ();
// Cuando instanciamos el objeto p este puede acceder a los métodos y atributos de la clase Producto que en este caso serían obtenerPrecio y calcularTotal así:

p.obtenerPrecio ();
p.calcularTotal ();

//*Atributos de la clase
//¿sintaxis: [modifVisibilidad] tipo nombreVariable [= valorInicial];

////visibilidad
// public:
// Indica que los atributos son accesibles desde cualquier lugar del programa. No hay restricciones en el alcance de los miembros de datos públicos.

// private:
// Indica que los atributos sólo son accesibles dentro de la clase en la que se declaran.

// protected:
// Indica que los atributos son accesibles dentro del mismo paquete o sub-clases en paquetes diferentes. Al heredar sí se puede usar desde la clase derivada.

////tipos:
//  ver imagen tipos de dato.jpg

////variables
// LOWERCAMELCASE
// Por convención, en Java, los nombres de las variables empiezan con una letra minúscula y si es una palabra compuesta la primera letra en Mayúscula con nomenclatura camelCase.

// Los atributos de una clase son definidos según esta sintaxis: [modifVisibilidad] tipo nombreVariable [= valorInicial];

// modifVisibilidad: el modificador de visibilidad indica desde que parte del código se puede acceder a las variables o a los métodos y puede ser:


// public:
// Indica que los atributos son accesibles desde cualquier lugar del programa. No hay restricciones en el alcance de los miembros de datos públicos.


// private:
// Indica que los atributos sólo son accesibles dentro de la clase en la que se declaran.


// protected:
// Indica que los atributos son accesibles dentro del mismo paquete o sub-clases en paquetes diferentes. Al heredar sí se puede usar desde la clase derivada.


// *métodos 
// se definen la siguiente manera:

//![modifVisibilidad] tipo nombreMetodo (listaParámetros) {}
// En los atributos y métodos para las clases también existen:


////Modificador de visibilidad:
// Se aplican las mismas normas que para los atributos, se debe indicar el modificador de acceso, este puede ser público, privado o protegido.


////Tipo:
// Es el tipo de valor devuelto por el método, pudiendo ser int, char, String, etc.


////Nombre del método:
// Es el nombre que tendrá el método y debe cumplir con las siguientes convenciones:

//*El constructor 
// de una clase es un método estándar para inicializar los objetos de esa clase, a su vez es un destructor de un método que se invoca automáticamente cuando el objeto se destruye.

// Se habla de un constructor cuando se instancia un objeto y es necesario inicializar sus variables con valores correctos. Un constructor es un método perteneciente a la clase, que posee unas características especiales:

// El nombre del constructor es igual que el nombre de la clase.
// No tiene ningún retorno.
// Se pueden crear varios, siempre y cuando tengan diferentes atributos.
// Dentro del código de un constructor generalmente suelen existir inicializaciones de variables y objetos, para conseguir que el objeto sea creado con dichos valores iniciales.

//![modifVisibilidad] nombreConstructor (listaParámetros)]
//!{
//!}

// ¿ para que se genera un constructor vacio?
// se usa cuando no necesitamos los atributos. y vamos a usar solo los métodos. 

////Recolector de basura

// Un destructor es un método opuesto a un constructor, este método en lugar de crear un objeto lo destruye, liberando la memoria de la computadora para que pueda ser utilizada por alguna otra variable u objeto.
// En Java no existen los destructores, esto es gracias al recolector de basura de la máquina virtual de Java. Como su nombre lo dice, el recolector de basura recolecta todas las variables u objetos que no se estén utilizando y que no haya ninguna referencia a ellos por una clase en ejecución, liberando así automáticamente la memoria de nuestra computadora.
// Aunque Java maneja de manera automática el recolector de basura, el usuario también puede decir en qué momento Java pase el recolector de basura con la instrucción.
//// System.gc ();


//*Modificadores

// //default
// Los miembros de datos, clase o métodos que no se declaran utilizando ningún modificador de acceso; es decir, que tengan un modificador de acceso predeterminado, solo son accesibles dentro del mismo paquete.


////private
// El modificador de acceso privado se especifica con la palabra clave private. Los métodos o los miembros de datos declarados como privados sólo son accesibles dentro de la clase en la que se declaran. Además:
// Ninguna de las otras clases del mismo paquete podrá acceder a los miembros.
// Las clases e interfaces no se pueden declarar como privadas (private).

////protected
// El modificador de acceso protegido se especifica con la palabra clave protected. Además:
// Los métodos o miembros de datos declarados como protected son accesibles dentro del mismo paquete o sub-clases en paquetes diferentes.

////public
// El modificador de acceso público se especifica con la palabra clave public. Además:
// El modificador de acceso público tiene el alcance más amplio entre todos los demás modificadores de acceso.
// Las clases, métodos o miembros de datos que se declaran públicos son accesibles desde cualquier lugar del programa.
// No hay restricciones en el alcance de los miembros de datos públicos.

//*Métodos accesores
// Son los métodos que permiten obtener o modificar los atributos de un objeto y son de dos tipos get y set.
// Los métodos get y set, son simples métodos que usamos en las clases para mostrar (get) o modificar (set) el valor de un atributo. El nombre del método siempre será get o set y a continuación el nombre del atributo, su modificador siempre es public, ya que se quiere mostrar o modificar desde fuera de la clase. Por ejemplo, getNombre o setNombre

//*Sobrecarga de métodos (overload)
//VER imagen sobrecarga_overload.png
// Permite definir más de un constructor o método con el mismo nombre, con la condición de que no puede haber dos de ellos con el mismo número y tipo de parámetros. En resumen, la sobrecarga permite declarar métodos que se llamen igual pero que reciban parámetros diferentes (no puede haber 2 métodos con el mismo nombre y los mismos parámetros), por esta razón lo que define a qué método se ingresa, son los argumentos que se envían como parámetros.


//*Comunicación entre clases
// La comunicación entre clases es posible sólo a través de la parte pública de las clases correspondientes.

////tipos
            // Asociación
            // Agregación / Composición
            // Generalización / Especialización. HERENCIA


// ASOCIACION:
// La implementación de asociación en Java se realiza mediante el uso de un campo de instancia. La relación puede ser bidireccional y cada clase tiene una referencia a la otra. La agregación y la composición son tipos de relaciones de asociación. A continuación, se explicitan los tipos de relaciones:

//// Bidireccional: 
//imagen asociacionBidireccionalEntreClases.jpg

// //Implementación de composición
//imagen implementacionDeComposicion.jpg
// La agregación es un tipo de relación que comprende a las clases y sus diferentes componentes, constituyendo un todo, a su vez, la composición en cambio es un tipo de agregación, donde cada componente sólo puede pertenecer a un todo.
// La composición en Java consiste en crear una clase nueva agrupando objetos de clases que ya existen, los objetos contenidos se declaran con visibilidad private y se inicializan en el constructor de la clase.

// //Implementación de herencia
//imagen implementacion de herencia .jpg
// imagenenes herencia y heredero.
// La herencia es el mecanismo por el que se crean nuevos objetos definidos en términos de objetos ya existentes. Por ejemplo, si se tiene la clase Persona, se puede crear la subclase Empleado, que es una extensión de Persona.

class Empleado extends Persona {
int ventas;
}

// La herencia permite compartir automáticamente métodos y datos entre clases, subclases y objetos.
// En Java esto es posible mediante el uso de la palabra clave extends. Por lo tanto, la subclase se añade (se extiende) a la superclase.

//*conexion a base de datos sql
//!video en : C:\Users\Administrador\Desktop\Escritorio Mayo 2022\Sena 2023\fase 3 - Ejecucion\JAVA\videos    Conexion JDBC
// Los pasos que deben realizarse para garantizar una conexión a base de datos desde una aplicación Java, utilizando JDBC, son:

// 1
// Descarga del Driver JDBC (Si no se tiene).

// 2
// Importar el Driver descargado en las librerías del proyecto Java.

// 3
// Importar el paquete java.sql.*;

// 4
// Inicializar el Driver usando la sentencia Class.forName

// 5
// Crear un Objeto de tipo Connection por medio del DriverManager

// 6
// Crear un objeto Statement que permite configurar las sentencias SQL desde el Objeto de Connection creado en el punto anterior

// 7
// Ejecutar la sentencia SQL usando cualquiera de los métodos del objeto Statement.

// 8
// Procesar los resultados de la sentencia ejecutada por medio de un ResultSet y sus métodos de apoyo.


//*JDBC

// Cuando se habla de JDBC (Java Data Base Connectivity) se hace referencia a un Driver que encapsula un conjunto de clases e interfaces escritas de Java, creadas para establecer conexiones, enviar sentencias SQL y procesar los datos resultantes sobre bases de datos relacionaleS. ////!CADA SISTEMA GESTOR DE BASE DE DATOS SGBD PROVEE SU PROPIO JDBC PARA LA MANIPULACION DE SUS SISTEMAS CON LAS APLICACIONES JAVA. DEPENDIENDO DE LA BASE DE DATOS A LAS QUE SE DESEE CONECTAR, SE DEBE HACER LA DESCARGA DEL DRIVER JDBC CORRESPONDIENTE.

// Además de tener a disposición el Driver JDBC correspondiente, para la base de datos que se desea conectar, se requiere de un conjunto adicional de clases e interfaces Java para hacer uso del driver, para lo cual es necesario importar los paquetes java.sql o javax.sql.

////DriverManager
////ResultSet
////Connection
////Statement
////next()


//*SERVLETS
//pdf instalacion de tomcat.
//imagen ejemplo servlet.jpg
// Los Servlets y los JSP (Java Server Pages), son tecnologías que se utilizan para realizar ejecuciones en servidores Java, permitiendo extender los servicios de un servidor web.
// Los servlets adecuan el proceso de las peticiones que entran al servidor, procesan los datos de formularios, generan contenidos de varios tipos y redirecciona las peticiones.

////JSP (Java Server Pages)
// Es un código Java que se ejecuta en un servidor remoto, que lee las acciones del usuario desde formularios html, donde el servidor realiza consultas, usualmente a bases de datos, para obtener la información solicitada por el usuario y devolviendo una página html dinámica y en tiempo real.

////archivos JSP
// Están formados por código Java dentro de etiquetas <html> con extensión .jsp Estos archivos deben ser guardados en la carpeta del contenido web del servidor. El código JSP inicia con <% %>.



//* */ HTTP Session
// Las sesiones son creadas para hacer un seguimiento y para memorizar las acciones de un usuario en un sitio web. Las

// java session permiten guardar información entre las diversas peticiones HTTP, siendo una clase que se utiliza para realizar seguimiento a las sesiones; son objetos almacenados también del lado del servidor.


// getId (), retorna el identificador que es asignado a la sesión, se utiliza para la identificación de la sesión.

// isNew (), retorna valor booleano true en caso de que el cliente no tenga una sesión.

// setAttribute (), establece un objeto a la sesión, empleando un nombre explícito.

// getAttribute (), retorna el objeto que fue asignado a la sesión, el cual se identifica con el nombre que le fue asignado.

// setInactiveInterval (), detalla el mayor tiempo que exista entre las peticiones continuas del cliente.

// invalidate (), elimina la sesión actual.

// El método utilizado para obtener la sesión de un usuario es getSession () este método regresa una interfaz de tipo HttpSession, Esta interfaz está dentro del paquete javax. servlet.http y es usada por el contenedor de páginas JSP que permite la creación de una sesión entre el cliente y el servidor.

// <%HttpSession variable =request.getSession(); %>

//*ELEMENTOS DEL JSP
// En JSP se encuentran tres tipos de elementos que pueden ser insertados en una página web: el código, las directivas y las acciones. Cada uno de ellos favorece las distintas ejecuciones que se requieren en la construcción de aplicaciones con JAVA.

////Códigos
// Se puede introducir código Java de varias clases como (variables, métodos, sentencias etc.) y ser ejecutado en el contenedor JSP.
////Directivas
// Brindan información general de la página y muestran lo que debe hacer el motor JSP con la página JSP. Para indicar una directiva se utiliza el símbolo arroba @. Existen tres tipos: Page, Include y Taglib.
////Acciones
// Facilitan, al motor, datos referentes a las acciones que debe realizar cuando se procesa la página (redirecciones). Hay 7 tipos: Param, Forward, Include, UseBean, getProperty, setProperty, Plugin.
////¿Inserción de código Java
// Existen tres formas para insertar código java en Jsp:
        // Expresione <%= expresión java%>
        // Scriptlets <% varias líneas de código java %>
        // Declaraciones <%! Declara variables o métodos %>

////Expresiones
// Encerrado en la etiqueta <%= expresión %>, evalúa la expresión para convertir su resultado en un String, siendo este insertado en la salida. Sólo tiene una línea de código.
// Ejemplos:
// <%= new Date() %>
// <%= 10+1 %>
// <%= 10<4 %>


////Scriptlets
// Inician con un paréntesis triangular y símbolo porcentaje y terminan con porcentaje y paréntesis triangular <%   %>, no tienen signo igual y pueden agregar varias líneas de java por ejemplo bucles, condicionales.
// <%
// for(int i=0; i<10; i++)
// System.out.println(“La cantidad es” + i );
// %>



////Declaraciones
// Inician con un paréntesis triangular símbolo porcentaje y una exclamación, terminan con porcentaje y paréntesis triangular <%!   %>, se pueden escribir varias líneas de código y realizar declaraciones.
// <%!
// private int total;
// public int suma (int a, int b){
// total = a + b;
// return total
// }
// %>

//*MVC     MODELO-VISTA-CONTROLADOR

// El MVC (Modelo-Vista-Controlador) es un patrón de diseño estándar que se usa a la hora de crear aplicaciones dinámicas con Java. Consiste en separar la parte lógica de los proyectos de la parte visual y lo hace integrando Servlets y JSP donde los Servlets se encargan de la parte lógica y los JSP de la parte visual.


// Patrón modelo-vista-controlador
// 1
// El modelo
// Realiza el almacenamiento y la manipulación de los datos.

// 2
// La vista
// Se encarga de la presentación con la que el usuario realizará la interacción, habitualmente en HTML.

// 3
// EL controlador
// Recoge los datos de entrada que envía el usuario, realiza la solicitud de acciones al modelo y modera la vista.