import { saveFormData } from '../otra3/lista.js';

document.getElementById("myForm").addEventListener("submit", function (event) {
    event.preventDefault(); // Evita el envío del formulario

    // Obtén los valores ingresados en el formulario
    var name = document.getElementById("name").value;
    var email = document.getElementById("email").value;

    // Crea un objeto con los datos
    var data = {
        name: name,
        email: email
    };

    // Llama a la función saveFormData del módulo lista.js
    saveFormData(data);

    // Redirige a la página lista.html
    window.location.href = "lista.html";
});
