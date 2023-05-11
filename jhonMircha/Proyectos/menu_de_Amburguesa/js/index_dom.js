import hamburgerMenu from "../js/dom/menu_hamburguesa.js";
import { digitalClock,alarm } from "./dom/reloj.js";

const d=document;
d.addEventListener("DOMContentLoaded",(e)=>{ // esto permite que cargue el dom antes de ejecutar la funcion que esta dentro.
    hamburgerMenu(".panel-btn",".panel",".menu a");
    digitalClock("#reloj","#activar-reloj","#desactivar-reloj");
    alarm("../../assets/Comodo.mp3","#activar-alarma","#desactivar-alarma");
})