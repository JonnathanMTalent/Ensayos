rechazan=int(0)                                                                                                             #variables que se van a usar para contar
indiceRepetido=int()
while True:
    try:
        verVacunados=int(input("\nver lista de pacientes ya vacuandos? 1 para si, 2 para no. "))                            #variables que se usaran para el menu, como entradas
        verRechazan=int(input("\nver lista de los pacientes que rechazan la vacuna? 1 para si, 2 para no"))
        verRepetidos=int(input("\nver lista de pacientes repetidos? 1 para si, 2 para no. "))
        verUltimoM=int(input("\n ver lista de pacientes de ultimo momento? 1 para si, 2 para no."))
        verReemplazados=int(input("\nver lista de pacientes reemplazados? 1 para si, 2 para no."))
        verPfizer=int(input("\nver cantidad de pacientes vacunados con Pfizer? 1 para si, 2 para no. "))
        verModerna=int(input("\nver cantidad de pacientes vacunados con Moderna? 1 para si, 2 para no"))
        verAstraZeneca=int(input("\nver cantidad de pacientes vacunados con AstraZeneca? 1 para si, 2 para no"))
        verAntesCovid=int(input("\n ver cantidad de pacientes con covid previo a la vacuna?"))
        agregar=int(input("\ndesea agregar un nuevo paciente?"))
        break
    except:
        print("\nINGRESE LOS DATOS DE MANERA CORRECTA, USANDO 1 PARA SI, 2 PARA NO.")

listaEtapa1=["maria cabrera", "andrea gimenez", "Jaime lozada", "catalina gimenez", "Alexander cabal"]                               #listas que se van a agregar para la ejecucion del programa segun etapa o conjunto al que pertenece.
cedula1=[43216, 8745456, 7657823, 6542389, 4576321]
edad1=[81, 74, 47, 82, 35]
genero1=["f", "f", "m", "f", "m"]
fechaVacunacion1= ["23-04-2021", "18-02-2021", "05-04-2021", "25-03-2021", "09-03-2021"]
tipoVacuna1=["Pfizer","Pfizer","AstraZeneca","Moderna","Moderna"]
tuvoCovid1=["si","no","no","no","si"]

listaEtapa2=["Maria cabrera", "Alejandra cardona", "Mariana giraldo", "Carlos buitrago", "fernado cardenas"]
cedula2=[43216, 344353446, 443573927, 7878642, 789746]
edad2=[32, 25, 53, 45, 87]
genero2=["f", "f", "f", "m", "m"]
fechaVacunacion2= ["08-03-2021", "04-04-2021", "08-02-2021", "17-03-2021", "21-04-2021"]
tipoVacuna2=["Pfizer","Pfizer","AstraZeneca","AstraZeneca","Moderna"]
tuvoCovid2=["si","no","si","no","si"]

listaEtapa3=["andrea guzman", "natalia bedoya", "Maria naranjo", "juan gonzales", "andres lopez"]
cedula3=[89934583, 653243621, 32443436, 44356243, 98678325]
edad3=[56, 90, 82, 75, 28]
genero3=["m", "m", "m", "m", "f"]
fechaVacunacion3= ["23-03-2021", "12-03-2021", "22-02-2021", "14-04-2021", "18-02-2021"]
tipoVacuna3=["Pfizer","Pfizer","AstraZeneca","AstraZeneca","Moderna"]
tuvoCovid3=["si","si","no","no","si"]

rechazanVacuna=["andres cardona", "manuel bedoya", "carolina Buitrago"]
cedulaR=[546756,676575,23423]
edadR=[38,27,54]
generoR=["m","m","f"]

ultimoMomentoNomb=["carlos bustamante", "andres buitrago"]
ultimoCedula=[67609,9083736]
ultimoEdad=[45,27]
ultimoGenero=["m","m"]
ultiFecha=["17-05-2021","21-05-2021"]
tipoVacunau=["Pfizer","Pfizer"]
tuvoCovidu=["si","no"]

pacReempNomb=["guillermo buen dia","carolina santander"]
pacReempCed=[459883,980980]
pacReempEdad=[35,20]
pacReempGener=["m","f"]

if verRechazan==1:                                                                                 # condicional para empezar a ver la lista segun la seleccion que se haya hecho en el menu arriba.
    print("\n LISTA DE QUINES RECHAZAN LA VACUNA: ")
    for i in range(len(rechazanVacuna)):
        rechazan=rechazan+1
        print("paciente",rechazanVacuna[i] ,"cedula",cedulaR[i],"edad",edadR[i],"genero",generoR[i])
    print("la cantidad de personas que rechazan la vacuna son: ",rechazan)

pacientesVacunados= listaEtapa1 + listaEtapa2 + listaEtapa3                                          # listas generales donde se suman las listas respectivas segun su propio grupo.
cedula= cedula1 + cedula2 + cedula3
edad= edad1 + edad2 + edad3
genero= genero1 + genero2 + genero3
fechaVacunacion= fechaVacunacion1+fechaVacunacion2+fechaVacunacion3
tuvoCovidT=tuvoCovid1+tuvoCovid2+tuvoCovid3+tuvoCovidu
tipodeVacuna=tipoVacuna1+tipoVacuna2+tipoVacuna3+tipoVacunau
cedulaTotal=cedula+pacReempCed+ultimoCedula+cedulaR

noRepetida=[]                                                                             #listas creadas para contabilizar y separar los elementos repetidos en la lista. usando como criterio la cedula, ya que dos personas pueden tener mismo nombre y apellido, pero no misma cedula.
repetida=[]
indicesRep=[]
for i in cedula:
    if i not in noRepetida:
        noRepetida.append(i)
    else:
        if i not in repetida:
            indiceRepetido=i
            repetida.append(i)
            indicesRep.append(indiceRepetido)
    

if verRepetidos==1:                                                                                     # condicionales para ver las listas segun se haya hecho la eleccion en el menu de arriba.
    print("\n LA LISTA DE LOS PACIENTES CON CEDULAS REPETIDAS ES: ")
    for i in range(len(indicesRep)):
        print("Nombre: ",pacientesVacunados[i],"cedula: ",cedula[i],"Edad: ",edad[i],"Genero: ",genero[i])
    print("la cantidad de pacientes repetidos es: ",len(repetida))
if verVacunados==1:
    print("\n LA LISTA DE LOS PACIENTES YA VACUNADOS ES: ")
    for i in range(len(pacientesVacunados)):
        print("Nombre: ", pacientesVacunados[i],"Cedula: ", cedula [i],"Edad: ", edad [i],"Genero: ", genero[i],"Fecha de Vacunacion: ", fechaVacunacion[i] )

if verUltimoM==1:
    print("\nLA LISTA DE PACIENTES AGREGADOS DE ULTIMO MOMENTO POR EL GOVIERNO ES: ")
    for i in range(len(ultimoMomentoNomb)):
        print("Nombre: ",ultimoMomentoNomb[i],"Cedula: ",ultimoCedula[i],"Edad: ",ultimoEdad[i],"Genero: ",ultimoGenero[i],"Fecha de vacunacion:",ultiFecha[i])

if verAstraZeneca==1:
    print("\nLA CANTIDAD DE PACIENTES VACUNADOS CON ASTRAZENECA: ")
    print(tipodeVacuna.count("AstraZeneca"))

if verModerna==1:
    print("\nLA CANTIDAD DE PACIENTES VACUNADOS CON MODERNA ES:")
    print(tipodeVacuna.count("Moderna"))

if verPfizer==1:
    print("\nLA CANTIDAD DE PACIENTES VACUNADOS CON PFIZER ES: ")
    print(tipodeVacuna.count("Pfizer"))

if verAntesCovid==1:
    print("\nLA CANTIDAD DE PACIENTES CON COVID PREVIO A LA VACUNA ES: ")
    print(tuvoCovidT.count("si"))

if verReemplazados==1:
    print("\n LA LISTA DE PACIENTES REEMPLAZADOS ES: ")
    for i in range(len(pacReempCed)):
        print("Nombre: ",pacReempNomb[i],"Cedula: ",pacReempCed[i],"Edad: ",pacReempEdad[i],"Genero: ",pacReempGener[i])

listNuev=[]                            #nueva lista creada para agregar los elementos nuevos y luego reclasificarlos.
listCedulaN=[]
listEdadN=[]
listGeneroN=[]
listayaVacunadosN=[]
listAntesCovidN=[]
listFechaVacunacionN=[]
listPruebaN=[] 
while agregar==1:                                      # ciclo creado para ver un nuevo menu para agregar nuevos pacientes a las listas.
     try:
         if agregar==1:
             print("\n CONTESTE LO SIGUIENTE PARA AGREGAR UN PACIENTE: ")
             cedulaN=int(input("\n numero de cedula sin puntos ni comas:  "))
             if cedulaN in cedulaTotal:
                 print("el paciente ya se encuentra registrado")
             nuevosPacientes=str(input("\n Ingrese Nombre del paciente: "))
             edadN=int(input("\n ingrese la edad del paciente: "))
             generoN=input("\n Escriba el genero de la persona f para femenino m: ")
             yaVacunados=int(input("\n Ya fue vacunado? 1 para si 2 para no: "))
             antesCovid=int(input("\n Antes ha tenido covid? 1 para si 2 para no:  "))
             fechaVacunacionN=str(input("\n fecha de vacunacion? dd-mm-aaaa:  "))
             aprueba=int(input("\n Quiere ser vacunado? 1 para si 2 para no:  "))
             otro=int(input("\n desea agregar otro paciente? 1 para si 2 para no: "))
     except:
         print("\n INGRESE CORRECTAMENTE LOS DATOS: \n INTENTELO NUEVAMENTE:")
     else:
         listNuev.append(nuevosPacientes)                           #aqui se agregan los datos a las listas nuevas.
         listCedulaN.append(cedulaN)
         listEdadN.append(edadN)
         listGeneroN.append(generoN)
         listayaVacunadosN.append(yaVacunados)
         listAntesCovidN.append(antesCovid)
         listFechaVacunacionN.append(fechaVacunacionN)
         listPruebaN.append(aprueba)
         agregar=otro

cantNuevos=len(listNuev)                                        #se muestran los datos del paciente nuevo y la cantidad de pacientes que se agregaron.
print("\n LISTA DE PACIENTES QUE AGREGASTE: ")
for i in range(len(listNuev)):
    print(" Nombre: ",listNuev[i],"Cedula: ", listCedulaN[i], "Edad: ",listEdadN[i],"Genero: ",listGeneroN[i])
    print("la cantidad de pacientes agregados es: ",cantNuevos)