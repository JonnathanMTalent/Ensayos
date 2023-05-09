import hamburgerMenu from "../js/menu_hamburguesa.js";
import { digitalClock,alarm } from "./reloj.js";

const d=document;
d.addEventListener("DOMContentLoaded",(e)=>{ // esto permite que cargue el dom antes de ejecutar la funcion que esta dentro.
    hamburgerMenu(".panel-btn",".panel",".menu a");
})