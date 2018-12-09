#   Advent of Code 2018. Day 9, first part.
#   Luis Delgado.

File = open("Data.txt",'r')

import sys
sys.dont_write_bytecode = True

from Import import Extract,Circle

data = File.readline()
Players, Worth = Extract(data)
z

MarbleGame = Circle()
Elves_Points = []
for i in range(Players):
    Elves_Points.append(0)

a=0
for i in range(Worth):
    
    Elves_Points[a]=Elves_Points[a]+MarbleGame.add()
    a=a+1
    if(a==Players):
        a=0

print(max(Elves_Points))

