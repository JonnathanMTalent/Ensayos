// ruta del archivo json:// https://jsonplaceholder.typicode.com/users
// Texto de jhon Mircha: https://jonmircha.com/ajax

//* xhr es el objeto ajax- tenemos 4 pasos principales enumerados. la respuesta la de en formato texto.
(() => {
    const xhr = new XMLHttpRequest(), // 1)estamos generando una instancia de el protocolo XMLHttpRequest
        $xhr = document.getElementById("xhr"),
        $fragment = document.createDocumentFragment(); // El fragment permite que se haga una sola insersion al dom, asi mejoramos el 
    //rendimiento.Si no lo usáramos tocaria insertar cada elemente a medida que va llegando de la peticion.Encambia asi se va acumulando todo aqui.

    //!dentro de esta calback(el arrowfunction dentro del listener) va la logica de programacion.
    xhr.addEventListener("readystatechange", (e) => { // 2)EVENTOS.  En este listener tenemos la callback con un arrow function
        if (xhr.readyState !== 4) return; // esta linea permite que no imprima el console cada vez que cambia de estado, sino solamente cuando llegue al estado 4 o completado.

        // console.log(xhr);

        if (xhr.status >= 200 && xhr.status < 300) { // estos estatus contemplan las respuestas satisfactorias.
            // console.log("éxito");
            // console.log(xhr.responseText);  // esto imprime lo que viene en el objeto ajax o xhr como texto.
            //$xhr.innerHTML = xhr.responseText;
            let json = JSON.parse(xhr.responseText); // convierte la respuesta json del objeto ajax o xhr a un objeto javaScript
            // console.log(json);

            json.forEach((el) => {
                const $li = document.createElement("li");
                $li.innerHTML = `${el.name} -- ${el.email} -- ${el.phone}`;
                $fragment.appendChild($li);
            });

            $xhr.appendChild($fragment);
        } else {
            // console.log("error");
            let message = xhr.statusText || "Ocurrió un error"; // en el status text a veces viene un mensaje de error. si no entonces muestra el string
            $xhr.innerHTML = `Error ${xhr.status}: ${message}`; // en el objeto ajax (xhr en este caso) siempre viene en el status el codigo y el mensaje tendra la variable de arriba.
        }

        // console.log("Este mensaje cargará de cualquier forma"); // Aqui ponemos cosas que queremos que carguen independientemente de la respuesta del ajax.
    });

    xhr.open("GET", "https://jsonplaceholder.typicode.com/users");  //3) Aqui mensionamos el método de traida de datos GET y la ruta donde estan los datos.
    //xhr.open("GET", "assets/users.json");
    // xhr.open("GET", "../../assets/user.json"); // !De esta manera llamariamos de forma local el json.

    xhr.send();  //4) Aqui enviamos la peticion del XMLHttpRequest()
})();

//*FETCH: Funciona con promesas por lo que podemos usar then cath finally, las respuestas las de en un objeto tipo response.
(() => {
    const $fetch = document.getElementById("fetch"),
        //!este fragment no entrara en conflicto con el de arriba porque se estan ejecutando funciones anomimas autoejecutables.
        $fragment = document.createDocumentFragment(); // El fragment permite que se haga una sola insersion al dom, asi mejoramos el
    //rendimiento.Si no lo usáramos tocaria insertar cada elemente a medida que va llegando de la peticion.Encambia asi se va acumulando todo aqui.

    //fetch("assets/users.json")

    //! El fetch por defecto usa el método get y vienen en un objeto las opciones asi: (Sin embargo no es necesario ponerlo)
    // fetch("https://jsonplaceholder.typicode.com/users", {
    //     method:"GET"
    // })


    //como fetch trabaja con promesas se puede usar then y cath
    fetch("https://jsonplaceholder.typicode.com/users")
        // fetch("https://jsonplaceholder.typicode.com/users")
        /* .then((res) => {
            console.log(res); //! ReadableStream... Aqui puedo ver la respuesta y todo lo del fetch
            // res : es la variable del arrow function que usamos arriba para recibir la respuesta del fetch pero llega como un ReadableStream
            // res.json() convertir la respuesta que es un objeto en json porque esperamos un json, es equivalente al JSON.parse()
            // res.text() si estamos recibiendo html o xml
            // res.blob()  imagen en base o formato data uri, y para todo lo que no sea texto
            return res.ok ? res.json() : Promise.reject(res);
          }) */
        .then((res) => (res.ok ? res.json() : Promise.reject(res))) // este convierte a res de ReadableStream a json//! este Promise.reject(res) permite que se ejecute el cath del error de la promesa. si no lo ponemos no ejecurá el catch.
        .then((json) => { // este then recibe el return implicito del arrow function de arriba como un json.
            console.log(json);
            //$fetch.innerHTML = json;
            json.forEach((el) => {
                const $li = document.createElement("li");
                $li.innerHTML = `${el.name} -- ${el.email} -- ${el.phone}`;
                $fragment.appendChild($li); //!este fragment no entrara en conflicto con el de arriba porque se estan ejecutando funciones anomimas autoejecutables.
            });

            $fetch.appendChild($fragment);
        })
        .catch((err) => { // -El catch solo espera recibir un error
            console.log(err);
            let message = err.statusText || "Ocurrió un error";
            $fetch.innerHTML = `Error ${err.status}: ${message}`;
        })
        .finally(() => {
            console.log(
                "Esto se ejecutará independientemente del resultado de la Promesa Fetch"
            );
        });

})();