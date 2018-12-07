-- Advent of Code 2018. Day 2, first part.
-- Luis Delgado.

Data_File="Data.txt";
local File = io.open (Data_File,"r");

Mem = {};

Three = 0;
Two = 0;

for line in io.lines(Data_File) do 

	for k,v in pairs(Mem) do
      		Mem[k] = 0;
    	end

	a = string.len(line) ;
	
	for e = 1, a do
		char = string.sub(line,e,e);
		if(Mem[char] == nil) then
			Mem[char] = 0;
		end
		Mem[char] = Mem[char] +1;
	end

	flag2 = 0
	flag3 = 0

	for k,v in pairs(Mem) do
      		if(Mem[k] == 3 ) then
			flag3=1;
		elseif(Mem[k] == 2) then
			flag2=1;
		end
    	end

	Two = Two+flag2
	Three = Three + flag3;
end

print(Two * Three)
