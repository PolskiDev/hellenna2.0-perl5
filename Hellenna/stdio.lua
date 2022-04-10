Console = {}

-- Console.ReadLine(|x:string|)
-- Console.ReadLine(|x:int|)
function Console.ReadLine(s)
    
    local t = s:sub(s:find(":")+1)      --var (type)
    local n = s:sub(1,s:find(":")-1)    --var (name)

    file:write("my $"..n.." = <STDIN>;")
    file:write("chomp($"..n.."); print(\"\\n\");")

end



--@ Console.WriteLine("&Hello world")       --> String
--@ Console.WriteLine("$x")              --> Variable
--@ Console.WriteLine(|136|)                --> Numeric

function Console.WriteLine(s)
    s=s:gsub("+",".")
    if s:sub(1,1) == "&" then
        file:write("print \""..s:sub(2).."\" . \"\\n\"",';\n')
    
    elseif s:sub(1,1) == "$" or s:sub(1,1) == "@" then
        file:write("print $"..s:sub(2).." . \"\\n\"",';\n')

    elseif s:sub(1,1) == "*" then
        file:write("foreach (@"..s:sub(2)..") { print \"$_ \"; }\n print \"\\n\"; ")
        --file:write("print @"..s:sub(2).." . \"\\n\"",';\n')
    else
        file:write("print "..s.." . \"\\n\"",';\n')
    end
    
end
function Console.Write(s)
    s=s:gsub("+",".")
    if s:sub(1,1) == "&" then
        file:write("print(\""..s:sub(2).."\")",';\n')
    
    elseif s:sub(1,1) == "$" or s:sub(1,1) == "@" then
        file:write("print($"..s:sub(2)..")",';\n')

    elseif s:sub(1,1) == "*" then
        file:write("foreach (@"..s:sub(2)..") { print \"$_ \"; }\n")
        --file:write("print @"..s:sub(2).." . \"\\n\"",';\n')
    else
        file:write("print("..s..")",';\n')
    end
    
end