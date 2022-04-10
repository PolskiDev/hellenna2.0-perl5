--@ let(|$my_variable:string|, "&Hello world")
--@ let(|$my_variable:int|, |136|)
--@ let(|$my_variable:float, |$another_variable|)
--@ let(|$my_variable:double, |$another_variable|)

function let(name,value)
    name = tostring(name)
    value = tostring(value)
    
    local n = name:sub(1,name:find(":")-1)    --var (name)
    local t = name:sub(name:find(":")+1)      --var (type)
    value:gsub("+",".")

    if name:find(":") ~= nil then
        --@exists explicit declaration
        if n:sub(1,1) == "$"
        or n:sub(1,1) == "@" then
            if value:sub(1,1) == "&" then
                file:write("my $"..n:sub(2).." = \""..value:sub(2).."\";\n")

            elseif value:sub(1,1) == "$"
            or value:sub(1,1) == "@" then
                file:write("my $"..n:sub(2).." = "..value:sub(2)..";\n")
            else
                file:write("my $"..n:sub(2).." = "..value..";\n")
            end

        else
            if value:sub(1,1) == "&" then
                file:write("my $"..n.." = \""..value:sub(2).."\";\n")

            elseif value:sub(1,1) == "$" then
                file:write("my $"..n.." = "..value:sub(2)..";\n")
            else
                file:write("my $"..n.." = "..value..";\n")
            end
            
        end

    end
end






--@ var(|my_variable|, "&Hello world")
--@ var(|my_variable|, |136|)
--@ var(|my_variable|, |another_variable|)
function var(name,value)
    if value:sub(1,1) == "&"
    or value:sub(1,1) == "$" 
    or value:sub(1,1) == "@" then
        -- String:      &Arnold
        file:write("$"..name:sub(2).." = \""..value.."\"",'\n')
    else
        -- Number:      136
        file:write("$"..name.." = "..value,'\n')
    end
end
