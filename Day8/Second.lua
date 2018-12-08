-- Advent of Code 2018. Day 8, second part.
-- Luis Delgado.

Data_File="Data.txt";
local File = io.open (Data_File,"r");

require "Functions"

function Recursive (Table,Pointer)
    local New_Acc = 0
        local Header = {Table[Pointer],Table[Pointer+1]}
        Pointer=Pointer+2;
        if Header[1] > 0 then 
            local tmp = {}
            for i = 1,Header[1] do
                New_new_Acc, Pointer = Recursive(Table,Pointer);
                table.insert(tmp,New_new_Acc);
            end

            for i=1, Header[2] do
                local Cur = Table[Pointer];
                Pointer = Pointer+1
                if(Cur > 0 and Cur <= Header[1]) then
                    New_Acc = New_Acc +tmp[Cur]
                end
            end
        else
            for i=1, Header[2] do
                New_Acc = New_Acc + Table[Pointer];
                Pointer = Pointer+1
            end
            
        end
    return New_Acc,Pointer
end

String = File:read()
StringSize = String:len();

Data = Extract_Data(String)

Root = Recursive(Data,1)

print(Root)
