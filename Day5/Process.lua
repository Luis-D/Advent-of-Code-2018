function Process (Mem,StringSize)	
	ASCII_diff = 32
	local Pre;
	local Pos;
	local Counter;
	flag = true
	while(flag) do
	
		flag = false
	
		for i=1, StringSize do
			Cur = Mem[i]
			Pre = Mem[i-1]
			Pos = Mem[i+1]
			if(Cur >=97) then
				Counter = Cur-ASCII_diff
			else 
				Counter = Cur+ASCII_diff
			end
	
			if(Pre ~= nil and Pre == Counter) then
				table.remove(Mem,i-1)
				table.remove(Mem,i-1)
				StringSize = StringSize-2
				flag = true
				break;
			elseif (Pos ~= nil and Pos == Counter) then
				table.remove(Mem,i)
				table.remove(Mem,i)
				StringSize = StringSize-2
				flag = true
				break;
			end
		end
		
		--print(StringSize)
	end
	return StringSize
end
