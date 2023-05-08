contin=int(input("para realizar una consulta escriba: 1 para finalizar 2"))
while contin<2:
    numPay=int(input("cuantas couotas son en total? :"))
    planValue=int(input("cual es el valor del plan? :"))
    feeValue=float(planValue/numPay)                         #valor de la cuota mensual a capital sin intereses.
    discountRate=float()                                        #Porcentaje del descuento.
    discountValue=float()                                    # valor del descuento total
    interestValue=float((planValue*0.05)*numPay)            #valor de los intereses mensuales.
    total=float()                                         #total a pagar
    if numPay>3 and numPay<7:                             #si el numero de cuotas es mayor que tres y menor que site
      discountRate=0.20                                         #aplicar un valor al porcentaje de descuento de 20% 
    elif numPay>6 and numPay<11:                           
      discountRate=0.10
    discountValue=(planValue*discountRate)                   #Opera valor del descuento   
    total=(planValue+interestValue-discountValue)             #imprime todos los comcepotos de valores.
    print("Valor del plan : ", planValue)
    print("Valor de la cuota : ", feeValue)
    print("Numero de cuotas : ", numPay)
    print("Valor del descuento : ", discountValue)
    print("valor de los intereses : ", interestValue)
    print("Total a pagar : ", total)
    ter=int(input("desea hacer otra consulta? 1 para si, 2 para no: "))
    contin=ter