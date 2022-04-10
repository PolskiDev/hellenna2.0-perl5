-- C-Like Tables (NON-PORTABLE)
Std = {
    table = {},
    list = {}
}

--@ Std.table.new(|tabela:3|, "Daniel")
function Std.table.new(struct,value)
    local i = struct:sub(struct:find(":")+1)      --struct index
    local s = struct:sub(1,struct:find(":")-1)    --struct name
    
    if value:sub(1,1) == "&" then
        --"my $"..s.."_"..i.." = \""..value:sub(2).."\";\n"
        file:write("my $"..s.."_"..i.." = \""..value:sub(2).."\";\n")
        --file:write("var "..s.."_"..i.." = \""..value:sub(1).."\";\n")
    else
        file:write("my $"..s.."_"..i.." = "..value..";\n")
    end
end

--@ Std.table.getIndex(|retorno|, |tabela:5|)
function Std.table.getIndex(pointer, struct)
    local i = struct:sub(struct:find(":")+1)      --struct index
    local s = struct:sub(1,struct:find(":")-1)    --struct name

    file:write("my $"..pointer.." = "..s.."_"..i..";")
end



-- (Array)
--@ Std.list.new(|lista|, |"Daniel","Maria", 5.8, 55, 0.95|)
function Std.list.new(name, values)
    file:write("my @"..name:sub(2).." = ("..values..");\n")
end

--@ Std.list.getLength(|retorno|, |lista|)
function Std.list.getLength(pointer, list)
    --file:write("var "..pointer.." = "..list..".size")
    file:write("my $"..pointer:sub(2).." = scalar @"..list:sub(2)..";")
end

--@ Std.list.drop(|retorno|, |lista:5|)
function Std.list.drop(pointer, list)
    local index = list:sub(list:find(":")+1)      --struct index
    local list = list:sub(1,list:find(":")-1)    --struct name
    
    if tonumber(index) > (#list/2) then
        file:write("pop(@"..list:sub(2)..");\n")
    elseif tonumber(index) < (#list/2) then
        file:write("shift(@"..list:sub(2)..");\n")
    end
end




-- DEPENDENCY
--@ Std.list.add(|lista|, "Julia")
function Std.list.add(name,element)
    if element:sub(1,1) == "&" then
        file:write("push(@"..name:sub(2)..", \""..element:sub(2).."\");\n")

    elseif element:sub(1,1) == "$"
    or element:sub(1,1) == "@" then
        file:write("push(@"..name:sub(2)..", "..element:sub(2)..");\n")
    end
end



-- Std.table.new(|usuario:0|, "Debora")
-- Std.table.new(|usuario:1|, "Lilian")
-- Std.table.getIndex(|retorno|, |usuario:0|)