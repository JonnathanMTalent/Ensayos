let formData; // Variable para almacenar los datos del formulario

export function saveFormData(data) {
    formData = data;
}

export function showFormData() {
    // Muestra los datos en un alert
    alert("Nombre: " + formData.name + "\nEmail: " + formData.email);
}
