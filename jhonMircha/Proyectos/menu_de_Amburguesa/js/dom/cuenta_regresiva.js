//PARA OPERRAR CON FECHAS HAY QUE CAMBIAR A MILISEGUNDOS


//Exportamos por defecto porque es la unica funcion que vamos a tener en este archivo.
const d=document;
export default function countdown(id, limitDate,finalMessage){
    const $countdown=d.getElementById(id),
    countdownDate=new Date(limitDate).getTime(); //cambia a milisegundos la fecha dada en la variable

    let countdownTempo=setInterval(()=>{
        let now= new Date().getTime(), //Obtiene la fecha actual.
        limitTime=countdownDate-now, //resta la fecha dada contra la fecha actual en milisegundos.
        days=Math.floor(limitTime/(1000*60*60*24)), //obtiene la parte entera,en este caso los días.
        hours=("0"+Math.floor((limitTime %(1000*60*60*24))/(1000*60*60))).slice(-2), //obtiene el residuo de la division (es el mismo residuo que queda de la operacion de dividir por días de arriba) y este lo divide para obtener solo las horas.
        //el ("0"+  ).slice(-2) es para que de las horas en formato de dos digitos ej: 07
        minutes=("0"+Math.floor((limitTime %(1000*60*60*24))/(1000*60))).slice(-2),
        seconds=("0"+Math.floor((limitTime %(1000*60*60*24))/(1000))).slice(-2);

        $countdown.innerHTML=`<h3>Faltan: ${days} días, ${hours} horas, ${minutes} minutos, ${seconds} segundos</h3>`;

        console.log(countdownDate,now,limitTime);

        if(limitTime<0){
            clearInterval(countdownTempo); // limpia la variable o intervalo de tiempo;
            $countdown.innerHTML=`<h3>${finalMessage}</h3>`; // pone en el html el mensaje final de la function.
        }
    },1000);
}