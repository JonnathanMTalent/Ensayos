import hamburgerMenu from "../js/dom/menu_hamburguesa.js";
import { digitalClock,alarm } from "./dom/reloj.js";
import { moveBall,shortcuts } from "./dom/teclado.js";

const d=document;

d.addEventListener("DOMContentLoaded",(e)=>{ // esto permite que cargue el dom antes de ejecutar la funcion que esta dentro.
    hamburgerMenu(".panel-btn",".panel",".menu a");
    digitalClock("#reloj","#activar-reloj","#desactivar-reloj");
    alarm("../../assets/Comodo.mp3","#activar-alarma","#desactivar-alarma");
})

// Con este código vamos a detectar los shortcuts que se tecleen cuando este posado sobre el viewport (Interfaz de usuario)
// d.addEventListener("keyup",(e)=>{ //El evento keyup es cuando se suelta una tecla cuando esta posado sobre el viewport (Interfaz de usario)
// d.addEventListener("keypress",(e)=>{ //El evento keypress es cuando se mantiene presionada una tecla cuando esta posado sobre el viewport (Interfaz de usario)
d.addEventListener("keydown",(e)=>{ //El evento keydown es cuando se teclea una secuencia de caracteres
    shortcuts(e);
    moveBall(e,".ball",".stage");
});