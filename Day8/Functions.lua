function Extract_Data (_str)
    local array_of_strings ={};
    i=1;
    for tmp in string.gmatch(_str, "([^%s]+)") do
        array_of_strings[i] = tonumber(tmp);
        i = i + 1
    end
    return array_of_strings
end



