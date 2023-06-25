import { saveFormData } from './lista.js';

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

    // Guarda los datos utilizando la función importada de lista.js
    saveFormData(data);

    // Redirige a la página lista.html
    window.location.href = "lista.html";
});
