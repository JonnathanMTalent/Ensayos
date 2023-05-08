pasajeros=[]         #listas que se van a usar .. las otras listas estan dentro de las funciones y solo se usan alli.
pasajerosLower=[]
preciosl=[]
agregar=1
menuu=0
                  #diccionarios donde se guardaran los datos de los clientes
pasajero1={"nombre":"Andres Cardona Romel","edad":24,"vuelo":11,"dia":14,"mes":"Enero","anio":2021,"temporada":"alta","precio":400000,"destino":"Bucaramanga-Cartagena"}
pasajero2={"nombre":"Carolina del Toro","edad":28,"vuelo":23,"dia":14,"mes":"Enero","anio":2021,"temporada":"alta","precio":420000,"destino":"Bucaramanga-Cartagena"}
pasajero3={"nombre":"Daniela Gil","edad":34,"vuelo":22,"dia":21,"mes":"Febrero","anio":2021,"temporada":"baja","precio":50000,"destino":"Medellin-Bogota"}
pasajero4={"nombre":"Carlos Ateortua","edad":42,"vuelo":33,"dia":18,"mes":"Marzo","anio":2021,"temporada":"baja","precio":51000,"destino":"Medellin-Bogota"}
pasajero5={"nombre":"Natalia Dimaria","edad":32,"vuelo":44,"dia":27,"mes":"Diciembre","anio":2022,"temporada":"alta","precio":480000,"destino":"Bucaramanga-Medellin"}

pasajeros.append(pasajero1)  #guardamos los diccionarios en la lista pasajeros
pasajeros.append(pasajero2)
pasajeros.append(pasajero3)
pasajeros.append(pasajero4)
pasajeros.append(pasajero5)
nuevod={}

for i in pasajeros:       #guardamos los rrecios en una lista
    preciosl.append(i["precio"])

def actualizaPasajeros():    #funcion que actualiza los valores en la lista lower para la busqueda en mayusculas o minusculas.
    for dic in pasajeros:
        nombrer=dic["nombre"]
        pasajerosLower.append(nombrer.lower())

actualizaPasajeros()

def elimina(nombre):   #func para eliminar de la lista pasajeros los dic con el nombre en mayus o minuscula.
    nombrel=nombre.lower()
    if nombrel in pasajerosLower:
        e=pasajerosLower.index(nombrel)
        for dic in pasajeros:
            if dic["nombre"].lower()==nombrel:
                pasajeros.remove(dic)
        pasajerosLower.remove(nombrel)
        print("\n EL PASAJERO HA SIDO ELIMINADO EXITOSAMENTE \n NUEVA LISTA: ")
        for i in pasajeros:
            print(i["nombre"])
    else:
        print("     \n   ")
        for i in pasajeros:
            print(i["nombre"])
        print("\nNO ESTA EN EL REGISTRO: verifique en la lista si esta escrito correctamente. \n Escriba sin puntos ni comas. \n Busquelo en la lista anterior y escribalo sin tildes ni puntos.")
        nomb=input("ingrese nuevamente el nombre")
        elimina(nomb)         #aqui aplicamos recursividad llamando nuevamente a la misma funcion elimina dentro de si misma, la recurs finaliza al eliminar correctamente el usuario. 

def anual(ani):  #funcion que calcula o suma las ganancias segun el anio seleccionado en la variable ani.
    anuall=[]
    s=0.00
    for dic in pasajeros:
        if dic["anio"]==ani:
            anuall.append(dic["precio"])
    for i in range(len(anuall)):
        s=s+anuall[i]
    if s==0:
        print("el anio",ani,"no tuvo viajes registrados.")
    else:
        print("las ganancias del",ani,"fueron: ",s)

def ordenBurbuja(li):  #aplicacion del ordenamiento burbuja en la lista que sea llamada en li
    lon=len(li)
    for i in range(1,lon):
        for j in range(0,lon-i):
            if li[j]>li[j+1]:
                g=li[j+1]
                li[j+1]=li[j]
                li[j]=g
    return(li)

ordenBurbuja(preciosl) #se aplico ord burb en preciosl


def actualizaPrecio():     #funcion para actalizar los precios segun la cantidad de pasajeros por cada 5 pasajeros 1 por ciento, por cada 10 2 por ciento.
    d=(len(pasajeros)//5)-(2*(len(pasajeros)//10))
    f=(d*(0.01))
    t=(len(pasajeros)//10)*(0.02)
    p=((len(pasajeros)*f)+(len(pasajeros)*t))+1
    for dic in pasajeros:
        dic["precio"]=dic["precio"]*p
    return(pasajeros)

actualizaPrecio()

def tempA(tem): #funcion para asignar la temporada y retornar ganancia de la temporada seleccionada
    n=0
    g=0
    if tem==1:
        tempor="alta"
    else:
        tempor="baja"
        print
    for i in pasajeros:
        if i["temporada"]==tempor:
            n=n+1
            print("Numero de vuelo: ",i["vuelo"],"Valor del vuelo",i["precio"]," Temporada:",i["temporada"])
            g=g+i["precio"]
    print("Ganancia temporada: ",g)


def listVuelos(): #funcion para retornar los valores del menu
    for i in pasajeros:
        print("Numero de vuelo: ",i["vuelo"],"El trayecto es: ",i["destino"])

def messs(me):  #funcion para seleccionar el mes con un numero y no tener que escribir el nombre del mes.
    if me==1:
        mess="Enero"
    if me==2:
        mess="Febrero"
    if me==3:
        mess="Marzo"
    if me==4:
        mess="Abril"
    if me==5:
        mess="Mayo"
    if me==6:
        mess="Junio"
    if me==7:
        mess="Julio"
    if me==8:
        mess="Agosto"
    if me==9:
        mess="Septiembre"
    if me==10:
        mess="Octubre"
    if me==11:
        mess="Noviembre"
    if me==12:
        mess="Diciembre"
    return(mess)

def totpormes():  #funcion para retornar el total de pasajeros por mes de todos los meses.
    for i in range(1,13):
        ca=0
        m=messs(i)
        print(m)
        for n in pasajeros:
            if n["mes"]==m:
                ca=ca+1
        print("Cantidad de pasajeros: ",ca)

def porMes():   #funcion para retornar en el menu info del mes, segun el mes seleccionado.
    mes=int(input("""Ingrese el mes con su numero correspondiente: 
     1. Enero
     2. Febrero
     3. Marzo
     4. Abril
     5. Mayo
     6. Junio
     7. Julio
     8. Agosto
     9. Septiembre
     10.Octubre
     11.Noviembre
     12.Diciembre
     """))
    a=0
    met=messs(mes)
    for dic in pasajeros:
        if dic["mes"]==met:
            a=a+1
            print("Mes: ",dic["mes"],"Numero de vuelo", dic["vuelo"])
    print("cantidad de vuelos este mes:",a)

def nuevo():  #funcion que usa otras funciones para agregar un usuario nuevo
  nombre=input("Nombre: ")
  edad=int(input("Edad: "))
  vuelo=int(input("Numero de vuelo: "))
  mes=int(input("""Ingrese el mes con su numero correspondiente: 
  1. Enero
  2. Febrero
  3. Marzo
  4. Abril
  5. Mayo
  6. Junio
  7. Julio
  8. Agosto
  9. Septiembre
  10.Octubre
  11.Noviembre
  12.Diciembre
  """))
  dia=int(input("Ingrese el dia (dd)"))
  anio=int(input("Ingrese el anio (aaaa)"))
  destino=int(input("(Medellin-Bogota) ingrese 1.....(Bucaramanga-Medellin)ingrese 2....(Bucaramanga-Cartagena) ingrese 3."))
  if mes==1 or mes==12:
     temporada1="alta"
     precio=500000
  else:
     temporada1="baja"
     precio=50000
  if destino==1:
      trayecto="Medellin-Bogota"
  if destino==2:
      trayecto="Bucaramanga-Medellin"
  if destino==3:
      trayecto="Bucaramanga-Cartagena"
  temporada=temporada1
  mees=messs(mes)
  nuevod.update({"nombre":nombre,"edad":edad,"vuelo":vuelo,"mes":mees,"dia":dia,"anio":anio,"temporada":temporada,"precio":precio,"destino":trayecto})
  nuevac=nuevod.copy()
  pasajeros.append(nuevac)
  pasajerosLower.append(nuevac["nombre"].lower())
  return(pasajeros)



print("BIENVENIDO A AEROLINEA EL AVISPADO") #aqui en el menu usamos validaciones

while menuu!=9:          #menu que retornara las funciones segun el numero seleccionado
  try:
      menu1=int(input("""ELIJA UNA OPCION INGRESANDO EL NUMERO CORRESPONDIENTE:
      1.Lista de pasajeros
      2.Lista de vuelos
      3.Lista de vuelos mes.
      4.Lista de vuelos por temporada.
      5.Cantidad total de vuelos realizados por mes.
      6.Total de ganancia anual
      7.Agregar nuevo pasajero.
      8.Eliminar pasajero.
      9.Terminar.\n 
     """))
      if (menu1!=1 and menu1!=2 and menu1!=3 and menu1!=4 and menu1!=5 and menu1!=6 and menu1!=7 and menu1!=8 and menu1!=9):
       print("\nNo has seleccionado una de las opciones validas, intenta nuevamente")
      else:
        menuu=menu1

        if menuu==8:
            nom=input("Ingrese el nombre del pasajero a eliminar: ")
            elimina(nom)
            volver=int(input("\nDesea volver al menu? \n 1 para si 2 para terminar: "))
            if volver==1:
             actualizaPasajeros()
             menuu=0
            else:
             menuu=9

        if menuu==6:
            ani=int(input("Ingrese el anio que desea verificar"))
            anual(ani)
            volver=int(input("\nDesea volver al menu? \n 1 para si 2 para terminar: "))
            if volver==1:
             menuu=0
            else:
             menuu=9

        if menuu==5:
            totpormes()
            volver=int(input("\nDesea volver al menu? \n 1 para si 2 para terminar: "))
            if volver==1:
             menuu=0
            else:
             menuu=9

        if menuu==4:
            actualizaPrecio()
            tem=int(input("digite: \n 1...Temporada alta. \n 2....Temporada baja"))
            tempA(tem)
            volver=int(input("\nDesea volver al menu? \n 1 para si 2 para terminar: "))
            if volver==1:
             menuu=0
            else:
             menuu=9
        if menuu==2:
            listVuelos()
            volver=int(input("\nDesea volver al menu? \n 1 para si 2 para terminar: "))
            if volver==1:
             menuu=0
            else:
             menuu=9
        if menuu==7:
           print(".....................................")
           while agregar==1:
             nuevo()
             agregar=input("desea agregar otro pasajero mas?\n 1 si, 2 no: ")
           volver=int(input("desea volver al menu? \n 1 para si 2 para terminar: "))
           if volver==1:
             menuu=0
             agregar=1
           else:
             menuu=9

        if menuu==1:
         print("CANTIDAD DE USUARIOS EN LISTA: ",len(pasajeros))
         for i in pasajeros:
             print("Nombre: ",i["nombre"],"Edad: ",i["edad"])
         volver=int(input("\nDesea volver al menu? \n 1 para si 2 para terminar: "))
         if volver==1:
           menuu=0
         else:
           menuu=9

        if menuu==3:
         porMes()
         volver=int(input("\nDesea volver al menu? \n 1 para si 2 para terminar: "))
         if volver==1:
           menuu=0
         else:
           menuu=9

  except:
    print("\n POR FAVOR INGRESE LOS DATOS CORRECTAMENTE COMO ESTA INDICADO EN LAS INSTRUCCIONES EN CADA LINEA \n")
    volver=int(input("desea volver al menu? \n 1 para si 2 para terminar: "))
    if volver==1:
       menuu=0
    else:
       menuu=9

