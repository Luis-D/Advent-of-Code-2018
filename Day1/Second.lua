-- Advent of Code 2018. Day 1, part 2.
-- Luis Delgado.
-- This code works with the example, but it enters in an very long loop with the puzzle input (Data.txt)

Data_File="Data.txt";
local File = io.open (Data_File,"r");

Data = {};
a = 0;
e = 0;
i=-1;
o = 0;
u = 0;
flag = 0;

for line in io.lines(Data_File) do 
	i=i+1;
	Data[i] = tonumber(line);
  end

Mem = {};
Mem[0] = 0;

while (flag == 0) do
	o=u;	
	u = o+1;
	Mem[u] = Mem[o] + Data[a];
	--print(Mem[o] .. " + " .. Data[a] .. " = " .. Mem[u]);

	e=0;
	while (e<u) do
		--print(Mem[u] .. " == " .. Mem[e]) ;
		if (Mem[u] == Mem[e]) then
			flag=1;
			print(Mem[u]);
			break;
		end
		e=e+1;
	end

	a=a+1;
	if(a>i) then 
		a=0;
	end
end

print(Mem[u]);