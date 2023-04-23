#Nicolas Rivas Rodriguez

import sys
import re

solution = sys.stdin.readlines()

ins = []
segs = []
for line in solution:
    if line.startswith("size"):
        valores = line.split()
        for salida in valores:
            if salida.startswith("size"):
                size = int(re.search(r'\d+', salida).group())
            if salida.startswith("in"):
                nums = re.findall(r'\d+', salida)
                celdas = [int(num) for num in nums]
                ins.append(celdas)
                
for seg in ins:
    segs.append([(seg[0],seg[1]), (seg[2],seg[3])])   


for i in range(size):
    for j in range(size):
        if(j == 0 ):
            print ("+", end='')
        elif(j== size - 1):
            if([(i,j-1),(i,j)] in segs) or ([(i,j),(i,j-1)] in segs):
                print("--+")
            else:
                print("  +")
        elif([(i,j-1),(i,j)] in segs) or ([(i,j),(i,j-1)] in segs):
            print("--+", end='') 
        else:
            print("  +", end='')
    if (i == size - 1):
        print("")
    else:
        for h in range(size):
            if(h == size - 1):
                if([(i,h),(i+1,h)] in segs) or ([(i+1,h),(i,h)] in segs):
                    print("|")
                else:
                    print(" ")
            else:
                if([(i,h),(i+1,h)] in segs) or ([(i+1,h),(i,h)] in segs):
                    print("|  ", end='') 
                else:
                    print("   ", end='')


