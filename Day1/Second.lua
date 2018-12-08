-- Advent of Code 2018. Day 1, part 2.
-- Luis Delgado.

Data_File="Data.txt";
local File = io.open (Data_File,"r");

Acc = 0;
Mem = {};
Data = {};

for line in io.lines(Data_File) do 
	table.insert(Data, tonumber(line));
end

flag = false

while flag == false do
    for k,v in pairs(Data) do
	Acc = Acc+v

	if(Mem[Acc]) then
	    flag=true
	    break;
	end

	Mem[Acc] = true;
    end
end

print(Acc)
