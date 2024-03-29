// 	nuevo repositorio de github
// https://github.com/JonnathanMTalent/repositorio30dic2022.git
// 	Comandos de Git:
// Ctrl + c para copiar en el terminal
// 	Cd en el terminal para entrar en una carpeta especifica
// 	$ git config--global user.name 'jonnathan777'
// 	$ git init   es el primer commando que se usa para inicializar  git
// 	$ git config--global user.email 'roycreacionesysoluciones@gmail.com'
// 	$ git config--global user.name     para confirmer que quedo inscrito el nombre.
// 	$ git config--global user.email     para confirmer que quedo registrado el email.
// 	$ git status      			me muestra la información de los cambios para git
// 	$ git add index.html      		agrega el archivo nombrado para dejarlo en sala de espera
// 	$ git log 			muestra lo que se ha hecho en los commint el historial
// 	$ git commit - m "comentario"  se realiza un commit para empezar a guardar lo que esta en sala de espera
// 	$ git log--oneline		muestro lo de git log pero solo los commint sin fecha
// 	$ git diff	muestra la diferencia entre los últimos archivos guardados antes del add
// 	$ git add.agrega todos los cambios de todos los archivos
// 	$ git restore--staged precios.html  quita quitarEsto.html en este caso del ultimo add para que no este mas pendiente por guardar en el commit
// 	$ git checkout archivo.html	devuelve o revierte el ultimo cambio del archvo nombrado 	
// 	$ git checkout 35a010f 	devuelve el proyecto hasta el commit que tenga el código alfanumérico que se pone en frente de checkout
// 	$ git checkout master	vuelve a la rama master o principal
// 	$ git stash	se usa cuando hay un error volviendo a la rama master y lo que hace es no guardar los cambios hechos y volver a la master sin modificación alguna
// 	$ git diff archivo.html	muestra las diferencias entre el archivo antes y despues del ultimo commit
// 	$ git diff eccd63b 35a010f	muestra las diferencias entre los dos commit con los dos códigos respectivos
// 	$ git branch	muestra todas las ramas y con asterisco la rama actual(si no aparece es porque hay que hacer un commit previo asi : $ git commit - m "comentario")
// 	$ git branch devJonnathan	crea una nueva rama con el nombre especificado
// 	$ git switch devJonnathan	pasa de rama a la mensionada para seguir trabajando sobre esta.
// 	$ git merge devJonnathan 	mescla la rama devJonnathan con la rama master o principal
// 	$ git log--oneline –graph	muestra un grafico de los commint según las ramas existentes
// 	$ git remote	muestra los repositorios remotos que hay
// 	$ git remote add origin1 https://github.com/Jonnathan777/ciclo3rodolfo.git   en este caso creamos la conexion con el repositorio remote que es link azul, origin es el nombre del repositorio, podria ser cualquier otro nombre
// 	$ git remote '-v'	muestra el link de arriba del repositorio remoto en uso
// 	$ git remote rm origen 	origen es el nombre del repositorio que vamos a eliminar con este comando
// 	$ git fetch 	trae todo lo que hay en el repositorio nuevo que no existe en el repositorio local pero si en el remoto.
// 	$ git push origin master	origin es el nombre del repositorio remoto y master el nombre de la rama, se pueden cambiar.Esto vincula de una vez el repositorio local al remoto agregando los cambios.
// 	$ git pull origin master	Actualiza el repositorio local con el repositorio remoto, osea que trae los cambios que los compañeros hayan hecho en la rama seleccionada, en este caso fue la rama master
// 	RESUMEN DEL SIGUIENTE VIDEO:
// https://www.youtube.com/watch?v=HiXLkL42tMU
	 
	

	

// 	git init	se inicializa el trabajo con git
// 	 git add	pasa los archivos del woriking directory al staging area
// 	git status	para ver en que estado o paso estan los archivos
// 	git commit 	pasa los archivos del staging area al repositorio
// 	git push	para subir los archivos a un repositorio remoto
// 	git pull	trae los cambios que han hecho los otros desarrolladores
// 	git clone		clona todo lo de git a una carpeta local.
// 	----------------------------------------------------------------------------------------------------
//     CUANDO ABRIMOS LA TERMINAL DE GIT:





// ls: Comando para listar directorios y archivos
// pwd: Comando para ver en que ruta de nuestro sistema esta posicionado el terminal
// cd: comando para entrar en las carpetas
// 	ETIQUETAS HTML


//     < img src = "w3schools.jpg" alt = "W3Schools.com" width = "104" height = "142>
// 	En src va la ruta de la imagen, y en alt el mensaje o ruta alterna en caso de que en la primera no salga correctamente la imagen
//     < html lang = "en" > Esta etiqueta es para indicar el lenguaje de la página, va al inicio.
// 	< p title = "I'm a tooltip" > This is a paragraph.</ > Este atributo muestra lo que esta en title cuando se paran sobre el como una informacion emergente
//     < hr > es una línea para separar contenido
//         < br > es un espacio hacia abajo como presionar enter
//             < pre > es igual que p para texto pero esta si deja el text tal como esta, osea espacios y nuevas líneas.
// 	< sub > crea subíndice o sea letras por debajo del nivel de otras letras
//     < sup > crae superíndices o sea que esta por encima del nivel de las otras letras.
// 	< mark > Subraya en amarillo el texto
//     < del > Raya como si fuera un error.
// 	< ins > Pone una línea por debajo del texto.
//     target = "_blank" Abre una nueva ventana al hacer click sobre un enlace.
// 	< figure >
//         <img src="pic_trulli.jpg" alt="Trulli" style="width:100%">
//             <figcaption>Fig.1 - Trulli, Puglia, Italy.</figcaption>
//         </>
	

// 	De esa manera se debe inserter una imagen y el figcaption es la referencia de la imagen. 
	

// 	< video width = "320" height = "240" controls >
//     <source src="movie.mp4" type="video/mp4">
//         <source src="movie.ogg" type="video/ogg">
//             Your browser does not support the video tag.
//         </>   Etiqueta para video





//         Aquí se muestra como tomar un tiempo de reproducción de video con #t=10,40 desde el segundo 10 hasta el 40


//         <iframe src="../layouts/navegacion.html" frameborder="2" height="50px" width="90%"></iframe>


//         Con esta etiqueta insertamos ventanas de paginas propias o externas como google o youtube




//         RUTA PARA DESCARGAR LAS LIBRERIAS DE NPM:
//         $ npm i @babel/core babel-loader webpack@4 webpack-cli@4 webpack-dev-server html-webpack-plugin@4 copy-webpack-plugin@6 --save-dev
//         ver este video
//         https://www.youtube.com/watch?v=BzynYwGx-qg
//         Give feedback

