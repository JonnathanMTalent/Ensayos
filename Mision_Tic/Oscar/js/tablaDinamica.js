let tablaDinamica =function (lista) {
    let encabezado='<table border="1"><tr><th>Titulo del empleo</th><th>Locacion</th><th>Url</th><tr></table>';
    for (let item of lista) {
        let fila="<tr><th>";
        fila+=item.titulo;
        fila+="</tr>"

        fila+="<tr>"
        fila+=item.locacion;
        fila+="</tr>"

        fila+="<tr>"
        fila+=item.url;
        fila+="</tr>"
    }
}