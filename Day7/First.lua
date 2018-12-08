-- Advent of Code 2018. Day 7, first part.
-- Luis Delgado.

Data_File="Data.txt";
local File = io.open (Data_File,"r");

require "Functions"

Mem = {};
--[[
	Mem holds an array of tables.
	Each table is an array itself:
		string ID
		string Requirement 1
		string Requirement 2
		string Requirement 3
		...
]]--

local Count =0

for line in io.lines(Data_File) do 
	Pre = line:sub(6,6)
	Cur = line:sub(37,37)
	PrePos = Mem[Pre]
	CurPos = Mem[Cur]

	Pre_Exists = PrePos ~= nil
	Cur_Exists = CurPos ~= nil
	Both_Exists = Pre_Exists and Cur_Exists
	Neither_Exists = (not Pre_Exists) and (not Cur_Exists)
	Appended = Pre_Exists and (not Cur_Exists)
	Needed = (not Pre_Exists) and Cur_Exists

	print(Pre .. " -> " .. Cur)

	if(not Pre_Exists) then
		Count=Count+1;
		Mem[Pre]={Pre,0,Count}
	end 

	if(not Cur_Exists) then
		Mem[Cur]={Cur,1,Pre}
		Count=Count+1;
	else
		if Mem[Cur][2] == 0 then
			table.remove(Mem[Cur],3)
		end
		table.insert(Mem[Cur],Pre)
		Mem[Cur][2] = Mem[Cur][2] +1
	end
end

Mem = table_sort(Mem)

print()
for k,v in pairs(Mem) do
	for a,e in pairs(v) do
		io.write(e.." ")
	end
	print()
end
print(Count)
print()

WorkerMem = {}

while(Count>0) do
	for k,v in pairs(Mem) do
		local ID = v[1]	

		local Already_Listed = false
		for x,y in pairs(WorkerMem) do
			if (ID == y) then
				Already_Listed = true
			end
		end

		if(not Already_Listed) then
			local Quant = v[2]	
			print("ID: "..ID .. " ("..Quant..")")
			local total = Quant+2

			local Completed = true
			for i=3,total do
				data = v[i]
				io.write("  "..data)
				local Listed = false
				for x,y in pairs(WorkerMem) do
					if (data == y) then
						Listed = true
					end
				end
				if(Listed) then 
					io.write("(ok)")
				end

				if(not Listed) then
					Completed = false
				end
			end
			print()
			if((Completed) or Quant == 0) then
				print("New: "..ID)
				table.insert(WorkerMem,ID)
				Count = Count-1;
				break;
			
			end
		end

	end
	print("*****")
end

print()

for k,v in pairs(WorkerMem) do
	io.write(v)
end

print()