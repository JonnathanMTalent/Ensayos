import hamburgerMenu from "../js/dom/menu_hamburguesa.js";
import { digitalClock, alarm } from "./dom/reloj.js";
import { moveBall, shortcuts } from "./dom/teclado.js";
import countdown from "./dom/cuenta_regresiva.js";
import scrollTopButton from "./dom/boton_scroll.js";
import darkTheme from "./dom/tema_oscuro.js";
import responsiveMedia from "./dom/objeto_responsive.js";
import responsiveTester from "./dom/prueba_responsive.js";

const d = document;

d.addEventListener("DOMContentLoaded", (e) => { // esto permite que cargue el dom antes de ejecutar la funcion que esta dentro.
    hamburgerMenu(".panel-btn", ".panel", ".menu a");
    digitalClock("#reloj", "#activar-reloj", "#desactivar-reloj");
    alarm("../../assets/Comodo.mp3", "#activar-alarma", "#desactivar-alarma");
    countdown("countdown", "May 23, 2023 03:23:19", "Feliz cumpleaños! 🤓"); //no fue necesario poner el # que indica el id en el selector porque se llamo con un getid y no con un querySelector.
    scrollTopButton(".scroll-top-btn");
    // darkTheme(".dark-theme-btn","dark-mode"); // se quito de aqui y se puso mas abajo afuera del DOMContentLoaded, porque se llamo otro evento DOMContentLoaded para usar el localStorage
    responsiveMedia(
        "youtuve",
        "(min-width: 1024px)",
        '<a href="https://www.youtube.com/watch?v=6IwUl-4pAzc&list=PLvq-jIkSeTUZ6QgYYO3MwG9EMqC-KoLXA&index=92">ver video en youtube</a>',
        '<iframe width="560" height="315" src="https://www.youtube.com/embed/6IwUl-4pAzc" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>'
    );
    responsiveMedia(
        "gmaps",
        "(min-width: 1024px)",
        '<a href="https://goo.gl/maps/G9nWc6eDAhNZ1J1J7">ver Mapa</a>',
        '<iframe src="https://www.google.com/maps/embed?pb=!1m16!1m12!1m3!1d63451.50444539488!2d-75.61214203670626!3d6.300602209631392!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!2m1!1smapa%20universidad%20de%20antioquia!5e0!3m2!1ses!2sco!4v1686072202848!5m2!1ses!2sco" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>'
    );
    responsiveTester("responsive-tester");
})
//https://emojipedia.org/es/  AQUI PUEDO SACAR EMOTICONES POR BÚSQUEDA.
// Con este código vamos a detectar los shortcuts que se tecleen cuando este posado sobre el viewport (Interfaz de usuario)
// d.addEventListener("keyup",(e)=>{ //El evento keyup es cuando se suelta una tecla cuando esta posado sobre el viewport (Interfaz de usario)
// d.addEventListener("keypress",(e)=>{ //El evento keypress es cuando se mantiene presionada una tecla cuando esta posado sobre el viewport (Interfaz de usario)
d.addEventListener("keydown", (e) => { //El evento keydown es cuando se teclea una secuencia de caracteres
    shortcuts(e);
    moveBall(e, ".ball", ".stage");
});

darkTheme(".dark-theme-btn", "dark-mode"); // se quito de arriba y se puso aqui afuera del DOMContentLoaded, porque se llamo otro evento DOMContentLoaded para usar el localStorage