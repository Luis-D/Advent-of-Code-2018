-- Advent of Code 2018. Day 5, second part.
-- Luis Delgado.

local db = require "Process"

Data_File="Data.txt";
local File = io.open (Data_File,"r");

function Tablecopy(Dest,Src)
	for k,v in pairs(Src) do
		table.insert(Dest,v)
	end
end

function ReducePolymer(Mem,PolymerSize)
	local MinSize = PolymerSize
	Dest = nil
	
	for i = string.byte('A'), string.byte('Z') do
		print("Testing with " .. string.char(i))

			_Mem_ ={};
		Tablecopy(_Mem_,Mem);
		_PolySize = PolymerSize
		flag = true
		flag_2 = false
		while (flag) do
			flag = false
			for o = 1,_PolySize do
				b = i;
				if(_Mem_[o] >= 97) then
					b = b + 32			
				end			

				if (_Mem_[o] == b) then
					table.remove(_Mem_,o);
					_PolySize = _PolySize-1
					flag = true
					flag_2 = true;
					break;
				end
			end
		end
		
		if(flag_2) then
			_PolySize = Process(_Mem_,_PolySize)
		
			if(_PolySize < MinSize) then
				MinSize = _PolySize;
				Dest = _Mem_
			end	
		end
	end
	return MinSize,Dest
end

String = File:read()
StringSize = String:len();
local Sz = StringSize -1;

Mem_ = {};

for i = 0,Sz do
	table.insert(Mem_, string.byte(String,i+1));
end

print("Processing. It can take a long time")

NewS,Mem_ = ReducePolymer(Mem_,StringSize);

print("*****");
for k,v in pairs(Mem_) do
	io.write(string.char(v))
end
print()
print("(" ..NewS.. ")")