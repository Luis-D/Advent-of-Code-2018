-- Advent of Code 2018. Day 1, second part.
-- Luis Delgado.

Data_File="Data.txt";
local File = io.open (Data_File,"r");

Data = {};
Mem = {};

o=0;
i=-1;

function check (x,y,z)
	
	a = string.len(x);
	Acc = 0;
	Accb = 0;
	chr = '.';
	for e = 1, a do
		char_1 = string.sub(x,e,e);
		char_2 = string.sub(y,e,e);
		if(char_1 == char_2) then
			Acc = Acc+1;
			z[Accb] = char_1
			Accb=Accb+1;
		end
	end
	
	return (Acc == a-1);
end

for line in io.lines(Data_File) do 

	i=i+1;
	Data[i] =line;
	aa = string.len(line) -1;

	for u = i-1,0,-1 do
		if (check (Data[i],Data[u],Mem)) then
			for k = 0, aa-1 do
      				io.write(Mem[k]);
    			end
		end
	end
	
end

print();