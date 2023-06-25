// Obtiene los datos almacenados en localStorage
var jsonData = localStorage.getItem("formData");

// Convierte la cadena JSON a un objeto
var data = JSON.parse(jsonData);

// Muestra los datos en un alert
alert("Nombre: " + data.name + "\nEmail: " + data.email);
