-- Advent of Code 2018. Day 5, first part.
-- Luis Delgado.

require "Process"

Data_File="Data.txt";
local File = io.open (Data_File,"r");

String = File:read()
StringSize = String:len();
local Sz = StringSize -1;

Mem = {};

for i = 0,Sz do
	table.insert(Mem, string.byte(String,i+1));
end

print("Processing. It can take a long time")

PolymerSize = Process(Mem,StringSize)

print("*****");
for k,v in pairs(Mem) do
	io.write(string.char(v))
end
print()
print("(" ..PolymerSize.. ")")