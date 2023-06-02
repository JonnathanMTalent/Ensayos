import hamburgerMenu from "../js/dom/menu_hamburguesa.js";
import { digitalClock,alarm } from "./dom/reloj.js";
import { moveBall,shortcuts } from "./dom/teclado.js";
import countdown from "./dom/cuenta_regresiva.js";
import scrollTopButton from "./dom/boton_scroll.js";
import darkTheme from "./dom/tema_oscuro.js";

const d=document;

d.addEventListener("DOMContentLoaded",(e)=>{ // esto permite que cargue el dom antes de ejecutar la funcion que esta dentro.
    hamburgerMenu(".panel-btn",".panel",".menu a");
    digitalClock("#reloj","#activar-reloj","#desactivar-reloj");
    alarm("../../assets/Comodo.mp3","#activar-alarma","#desactivar-alarma");
    countdown("countdown","May 23, 2023 03:23:19","Feliz cumpleaños! 🤓"); //no fue necesario poner el # que indica el id en el selector porque se llamo con un getid y no con un querySelector.
    scrollTopButton(".scroll-top-btn");
    darkTheme(".dark-theme-btn","dark-mode");
})
//https://emojipedia.org/es/  AQUI PUEDO SACAR EMOTICONES POR BÚSQUEDA.
// Con este código vamos a detectar los shortcuts que se tecleen cuando este posado sobre el viewport (Interfaz de usuario)
// d.addEventListener("keyup",(e)=>{ //El evento keyup es cuando se suelta una tecla cuando esta posado sobre el viewport (Interfaz de usario)
// d.addEventListener("keypress",(e)=>{ //El evento keypress es cuando se mantiene presionada una tecla cuando esta posado sobre el viewport (Interfaz de usario)
d.addEventListener("keydown",(e)=>{ //El evento keydown es cuando se teclea una secuencia de caracteres
    shortcuts(e);
    moveBall(e,".ball",".stage");
});