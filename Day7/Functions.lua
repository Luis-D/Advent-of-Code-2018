function table_find (Table,value)
    local i=0;
    for k,v in pairs(Table) do
        i=i+1;
        if (value == v) then
            return i;
        end
    end
    return 0
end

function table_sort(Table)
    Keys = {};
    Sorted ={};
    for k,v in pairs(Table) do
        table.insert(Keys,k)
    end

    table.sort(Keys)

    for k,v in pairs(Keys) do
        table.insert(Sorted,Table[v])
    end

    return Sorted
    
end
