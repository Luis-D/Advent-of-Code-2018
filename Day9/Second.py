#   Advent of Code 2018. Day 9, second part.
#   Luis Delgado.

File = open("Data.txt",'r')

import sys
sys.dont_write_bytecode = True

from Import import Extract,Circle

data = File.readline()
Players, Worth = Extract(data)

Worth*=100

MarbleGame = Circle()
Elves_Points = []
for i in range(Players):
    Elves_Points.append(0)

print("It can take a ridiculous amount of time.")
print("Insertions seems extremely slow")

a=0
for i in range(Worth):
    print(str(Worth-1)+" | "+str(i))
    Elves_Points[a]+=MarbleGame.add()
    a=a+1
    if(a==Players):
        a=0

print(max(Elves_Points))

