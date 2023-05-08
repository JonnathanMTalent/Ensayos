from datetime import datetime
import json
#listas
lfech=[]
lista=[]                       #JONNATHAN JESUS MONROY SEQUEDA
listadoc=[]                    #GRUPO G-45
listanombre=[]
listatipo=[]
nvlista=[]
jsonlista=[]

#variables
menuu=0
#creo estas variables con las fechas para poder transcribirlas al formato correcto y meterlas al diccionario.
fecha1="12-05-2021"
fecha2="31-12-2021"
fecha3="21-11-2022"
fecha4="12-06-2021"
fecha5="23-04-2021"
notas1=" "
notas2=" "
notas3=" "

#aqui guardo las fechas en el formato de datatime en la carpeta lfech
lfech.append(datetime.strptime(fecha1, "%d-%m-%Y"))
lfech.append(datetime.strptime(fecha2, "%d-%m-%Y"))
lfech.append(datetime.strptime(fecha3, "%d-%m-%Y"))
lfech.append(datetime.strptime(fecha4, "%d-%m-%Y"))
lfech.append(datetime.strptime(fecha5, "%d-%m-%Y"))
# genero los dicccionario en los que guardo listas con los datos de los clientes para organizarlos respecto a la fecha que hay en la clave fecha.
dic1={"fecha":lfech[0],"nombre":"Juan Aguirre","edad":23,"sexo":"masculino","doc cliente":[434234,5566],"nombre cliente":["Fernando Cardenas","Natalia Bedoya"],"tipo llamada":[2,1],"calidad":[100,50]}
dic2={"fecha":lfech[1],"nombre":"Mariana Giraldo","edad":29,"sexo":"femenino","doc cliente":[454354,879843],"nombre cliente":["Juan Felipe","Catalina Ramirez"],"tipo llamada":[0,2],"calidad":[0,100]}
dic3={"fecha":lfech[2],"nombre":"Andres Bedoya","edad":24,"sexo":"masculino","doc cliente":[1245234,234234],"nombre cliente":["Adriana Cardona","Carlos Carson"],"tipo llamada":[2,2],"calidad":[100,100]}
dic4={"fecha":lfech[3],"nombre":"Andrea Betancour","edad":19,"sexo":"femenino","doc cliente":[1212],"nombre cliente":["Liseth Arango"],"tipo llamada":[2],"calidad":[100]}
dic5={"fecha":lfech[4],"nombre":"Pilar Rodriguez","edad":28,"sexo":"femenino","doc cliente":[23323],"nombre cliente":["Yesenia Ortiz"],"tipo llamada":[2],"calidad":[100]}

#guardo los diccionarios con los datos de cada asesor en la lista.
lista.append(dic1)
lista.append(dic2)
lista.append(dic3)
lista.append(dic4)
lista.append(dic5)
#aplico ordenamiento burbuja en el diccionario usando la clave fecha como referente a comparar
def ordenBurbuja(li):
    lon=len(li)
    for i in range(1,lon):
        for j in range(0,lon-i):
            if li[j]["fecha"]>li[j+1]["fecha"]:  #se comparan las fechas para orgnizar las listas
                g=li[j+1]
                li[j+1]=li[j]
                li[j]=g
    return(li)

#esta funcion me permite cambiar la opcion dwl while del menu menuu!=9, para continuar o terminar
def volverM(cont):
    volver=int(input("\nDesea volver al menu? \n 1 para si 2 para terminar: "))
    if volver==1:
        cont=0
    elif volver==2:
        cont=9
    else:
        print("POR FAVOR ELIJA 1 PARA VOLVER AL MENU, 2 PARA TERMINAR")
        volverM()   #se usa recursividad
    return(cont)
#con esta funcion extraigo los valores en las listas que estan en el diccionario para poderlas usar en otra lista estando ya organizados los valore por la funcion orden burbuja
def extr(clave,listar):
  for dic in lista:
    va=dic[clave]
    b=len(va)
    for i in range(b):
      va2=va[i]
      listar.append(va2)



#funciones en funcionamiento antes del menu

extr("nombre cliente",listanombre)
extr("tipo llamada",listatipo)
extr("doc cliente",listadoc)

print("BIENVENIDO A AEROLINEA EL AVISPADO: ")
#genero el menu d opciones con un whyle y las excepciones try,, except...
while menuu!=9:
  try:
      menu1=int(input("""ELIJA UNA OPCION INGRESANDO EL NUMERO CORRESPONDIENTE:
      1.Lista de empleados.
      2.Lista de llamadas.
      3.Lista de Revisiones.
      4.Informe de Revision.
      5.Imprimir archivo txt.
      6.Imprimir archivos Json.
      9.Terminar
      .\n 
     """))
      if (menu1!=1 and menu1!=2 and menu1!=3 and menu1!=4 and menu1!=5 and menu1!=6  and menu1!=9):
       print("\nNo has seleccionado una de las opciones validas, intenta nuevamente")
      else:
        menuu=menu1

        if menuu==1:   #lista de empleados : nombre edad sexo
            for dic in lista:
                print("Nombre Empleado: ",dic["nombre"],"Edad: ",dic["edad"],"Sexo: ",dic["sexo"])
            menuu=volverM(menuu)

        if menuu==2:
            b=len(listadoc)
            for i in range(b):
                print("Documento cliente: ",listadoc[i],"Nombre cliente:  ",listanombre[i],"Tipo de llamada",listatipo[i])
            menuu=volverM(menuu)

        if menuu==3:
            for i in range(len(lista)): 
                print(" ")
                print("fecha: (dd-mm-aaaa) ",lfech[i].day,lfech[i].month,lfech[i].year," Nombre del empleado: ",lista[i]["nombre"])
                m=lista[i]["doc cliente"]
                u=lista[i]["tipo llamada"]
                s=lista[i]["calidad"]
                for j in range(len(m)):
                    print("Documento del cliente: ",m[j]," Tipo de llamada: ",u[j],"Calidad: ",s[j])
            menuu=volverM(menuu)

        if menuu==4:
            for i in range(len(lista)):    #en esta funcion se usan variables que cuentan valores dentro de las listas para dar los resultados.
                print(" ")
                print("Nombre del empleado",lista[i]["nombre"])
                m=lista[i]["doc cliente"]
                u=lista[i]["tipo llamada"]  #listas dentro del dccionario de las que se extraen los valores para mostrarlo organizados por trabajador respectivo
                s=lista[i]["calidad"]
                w=len(m)
                print("Cantidad de llamadas ",w,)
                tcero=0
                tuno=0
                tdos=0
                tot=0
                calidad=tot/w
                for j in range(len(m)):
                    tot+=s[j]
                    if u[j]==0:
                        tcero+=1
                    if u[j]==1:
                        tuno+=1
                    if u[j]==2:
                        tdos+=1
                calidad=tot/w
                print("Cantidad baja(0): ",tcero," cantidad normal(1): ",tuno," cantidad alta(2): ",tdos)
                print("porcentaje de calidad: ",calidad)

            menuu=volverM(menuu)
        
        if menuu==5:  #archivo en txt 
            try: 

                m=("Reto 5. JONNATHAN MONROY SEQUEDA"+notas1+notas2+notas3)
                with open("C:/Users/USUARIO/Desktop/UNAB/arjonnathanm.txt","w") as abrirarchivo:
                    print(abrirarchivo.writelines(["ciclo1\n","Que buen curso\n",m, str(2021)]))

                with open("C:/Users/USUARIO/Desktop/UNAB/arjonnathanm.txt","a") as abrirarchivo:
                    print(abrirarchivo.writelines(["Muchas gracias profesor Rodolfo, he aprendido mucho en muy"]))
                    print(abrirarchivo.writelines(["poco tiempo, espero poder seguir aprendiendo en el siguiente nivel del curso"]))
                print("Se ha creado el erchivo .txt con exito.")
            except:
                ruta=str(input("por favor ingrese la ruta donde quiere que se guarde el archivo:"))
                m=("Reto 5. JONNATHAN MONROY SEQUEDA")
                with open(ruta,"w") as abrirarchivo:
                    print(abrirarchivo.writelines(["ciclo1\n","Que buen curso\n",m, str(2021)]))

                with open(ruta,"a") as abrirarchivo:
                    print(abrirarchivo.writelines(["Muchas gracias profesor Rodolfo, he aprendido mucho en muy"]))
                    print(abrirarchivo.writelines(["poco tiempo, espero poder seguir aprendiendo en el siguiente nivel del curso"]))
                print("Se ha creado el erchivo .txt con exito.")

                
                m=("Reto 5. JONNATHAN MONROY SEQUEDA")
                with open("/User/ACER/Desktop/python_G11/arjonnathanm.txt","w") as abrirarchivo:
                    print(abrirarchivo.writelines(["ciclo1\n","Que buen curso\n",m, str(2021)]))

                with open("/User/ACER/Desktop/python_G11/arjonnathanm.txt","a") as abrirarchivo:
                    print(abrirarchivo.writelines(["Muchas gracias profesor Rodolfo, he aprendido mucho en muy"]))
                    print(abrirarchivo.writelines(["poco tiempo, espero poder seguir aprendiendo en el siguiente nivel del curso"]))
                print("Se ha creado el erchivo .txt con exito.")

            menuu=volverM(menuu)

        if menuu==6:
            for dic in lista:
                dicjs={"nombre":dic["nombre"],"edad":dic["edad"],"sexo":dic["sexo"],"doc cliente":dic["doc cliente"],"nombre cliente":dic["nombre cliente"],"tipo llamada":dic["tipo llamada"],"calidad:":dic["calidad"]}
                nvlista.append(dicjs)
            for dic in nvlista:
                dic=json.dumps(dic,ensure_ascii=False)  #se convierte los dicc en json.
                jsonlista.append(dic)
            print(jsonlista)

            try:
                valoresjson=[
                    ("Juan Aguirre","porcentaje de calidad 75","2 llamdas")
                    ("Mariana Giraldo","porcentaje de calidad 5o","2 llamadas")
                    ("Pilar Rodriguez","porcentaje de calidad 100","1 llamada")
                    ]

                for nombre, calidad, llamadas in valoresjson:  #guarda tuplas de json d valaoresjson
                    jsonlista.append({"nombre":nombre,"calidad":calidad,"llamadas":llamadas})
                with open("listatrabajadores.json","w") as archivojonnathanJson:
                    json.dump(jsonlista,archivojonnathanJson)
            except:
                print(jsonlista)
            menuu=volverM(menuu)


  except:
        print("\n POR FAVOR INGRESE LOS DATOS CORRECTAMENTE COMO ESTA INDICADO EN LAS INSTRUCCIONES EN CADA LINEA \n")
        menuu=volverM(menuu)
