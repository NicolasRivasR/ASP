#Nicolas Rivas Rodriguez
import sys

matriz = []

with open("shingoki-examples/" + sys.argv[1]) as f:
    for linea in f:
        fila = linea.split()
        fila = [int(x) for x in fila]
        matriz.append(fila)
    
archivo = open(sys.argv[2], "w")

archivo.write("#const n=" + str(len(matriz)) + ".\n")

primero = 0

for i in range(len(matriz)):
    
    for j in range(len(matriz[i])):
        if(matriz[i][j]) > 0 and primero == 0:
            primero = 1
            archivo.write("#const start =(" + str(i) + "," + str(j) +  ").\n")
            archivo.write("number(( " + str(i) + "," + str(j) + " ) ," + str(matriz[i][j]) + ").   ")
        elif(matriz[i][j]) < 0 and primero == 0:
            primero = 1.
            archivo.write("#const start =(" + str(i) + "," + str(j) +  ").\n")
            archivo.write("number(( " + str(i) + "," + str(j) + " ) ," + str(matriz[i][j]) + ").   ")
        elif (matriz[i][j]) > 0 and primero == 1:
            archivo.write("number(( " + str(i) + "," + str(j) + " ) ," + str(matriz[i][j]) + ").   ")
        elif (matriz[i][j]) < 0 and primero == 1:
            archivo.write("number(( " + str(i) + "," + str(j) + " ) ," + str(matriz[i][j]) + ").   ") 


        
    

