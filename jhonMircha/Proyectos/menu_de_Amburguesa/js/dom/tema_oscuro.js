let d=document;

export default function darkTheme(btn, classDark){ // classDark esta en dom_ejercicios.css y es dark-theme, es el que cambia todo el estilo
    const $themeBtn=d.querySelector(btn),
    $selectors=d.querySelectorAll("[data-dark]"); // este atributo data-dark esta presente sólo en los elementos que queremos meter en la lista de nodos, para luego cambiarles la clase segun el modo ligh o dark.

    let moon="🌙",
    sun="☀️";

    //Este listener cambia la clase a la contraria detectando si esta puesto el texto de la luna o del sol.
    d.addEventListener("click",(e)=>{
        if(e.target.matches(btn)){
            console.log($themeBtn.textContent);
            if($themeBtn.textContent === moon){
                $selectors.forEach(el=> el.classList.add(classDark));
                $themeBtn.textContent=sun;
            }else{
                $selectors.forEach(el=> el.classList.remove(classDark));
                $themeBtn.textContent=moon;
            }
        }
    });
}