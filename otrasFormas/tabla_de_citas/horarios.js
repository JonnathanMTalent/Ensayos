document.addEventListener("DOMContentLoaded", function () {
    // Obtener la tabla y sus celdas
    var tabla = document.getElementById("citas");
    var celdas = tabla.getElementsByTagName("td");

    // Cargar citas tomadas desde el local storage
    var citasTomadas = JSON.parse(localStorage.getItem("citasTomadas")) || [];

    // Marcar las celdas correspondientes a citas tomadas
    for (var i = 0; i < citasTomadas.length; i++) {
        var citaTomada = citasTomadas[i];
        var fila = citaTomada.fila;
        var columna = citaTomada.columna;
        var celda = tabla.rows[fila].cells[columna];
        celda.classList.remove("available");
        celda.classList.add("unavailable");
        celda.removeAttribute("onclick");
    }

    // Asignar evento onclick a las celdas disponibles
    for (var i = 0; i < celdas.length; i++) {
        var celda = celdas[i];
        if (celda.classList.contains("available")) {
            celda.onclick = function () {
                var fila = this.parentNode.rowIndex;
                var columna = this.cellIndex;
                tomarCita(fila, columna);
            };
        }
    }

    // Función para tomar una cita
    function tomarCita(fila, columna) {
        var celda = tabla.rows[fila].cells[columna];
        celda.classList.remove("available");
        celda.classList.add("unavailable");
        celda.removeAttribute("onclick");

        // Guardar la cita tomada en el local storage
        var citaTomada = {
            fila: fila,
            columna: columna
        };
        citasTomadas.push(citaTomada);
        localStorage.setItem("citasTomadas", JSON.stringify(citasTomadas));
    }
});