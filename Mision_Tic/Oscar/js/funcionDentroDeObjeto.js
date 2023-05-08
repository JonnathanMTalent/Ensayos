
  let num1, num2;
  num1=prompt('ingrese un numero')
  num2=prompt('ingrese un numero')
  document.write(num1*num2);

document.getElementById("ej1").innerHTML = "cual es su nombre?";

var x = 10;
x *= 5;
document.getElementById("ej2").innerHTML = x;


// Create an object:
const person = {
    firstName: "John",
    lastName: "Doe",
    id: 5566,
    fullName: function() {
      return this.firstName + " esto es una funcion dentro de un objeto " + this.lastName;
    }
  };
  
  // Display data from the object:
  document.getElementById("ej3").innerHTML = person.fullName();
