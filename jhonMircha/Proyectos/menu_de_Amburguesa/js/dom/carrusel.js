const d = document;

export default function slider() {
    let i = 0;
    const $nextBtn = d.querySelector(".slider-btns .next"), // es muy importante dejar estos espacios en las clases
        $prevBtn = d.querySelector(".slider-btns .prev"),
        $slides = d.querySelectorAll(".slider-slide");

    d.addEventListener("click", (e) => {
        if (e.target === $prevBtn) {
            e.preventDefault(); // con esto prevenimos el comportamiento por defecto, hacemos que no se vaya hacia arriba el documento.
            $slides[i].classList.remove("active"); // al elemento con la posicion i le quita el active
            i--;
            if (i < 0) {  // cuando i sea menor que cero se la cambia el valor para que i valga la posicion del ultimo elemento y asi vuelva a recorrer todo.
                i = $slides.length - 1;
            }
            $slides[i].classList.add("active");
        }

        if (e.target === $nextBtn) {
            e.preventDefault(); // con esto prevenimos el comportamiento por defecto, hacemos que no se vaya hacia arriba el documento.
            $slides[i].classList.remove("active"); // al elemento con la posicion i le quita el active
            i++;
            if (i >= $slides.length) {  // cuando i sea igual a la cantidad de nodos es porque llegó al ultimo , por tanto lo reiniciamos a cero.
                i = 0;
            }
            $slides[i].classList.add("active");
        }
    })
}