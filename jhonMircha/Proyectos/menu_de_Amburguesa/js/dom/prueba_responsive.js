const d=document;
export default function responsiveTester(form){
    const $form=d.getElementById(form);
    let tester; // En esta variable vamos a almacenar el elemnto para abrir y cerra el window que se usará.(window.open  de la ventana donde vamos a abrir la ventana del responsive tester)
    d.addEventListener("submit",(e)=>{
        
        if(e.target===$form){ //Esta es otra forma de evaluar desde dónde se origino el evento. Parecido a e.target.matches
            
        e.preventDefault(); //Previene que se auto procese la pagina ya que el form no tiene nada en el action, en este caso la url no tendra los parametros ingresados en el form.
            // alert("Formulario enviado");
            tester=window.open($form.direccion.value,"tester",`innerWidth=${$form.ancho.value},innerHeight=${$form.alto.value}`);
        }
    });
     d.addEventListener("click",(e)=>{
        if(e.target===$form.cerrar)tester.close(); // cierra la ventana que se abrió.
     })
}