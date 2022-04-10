--@ fn("hello:string", ...)
function fn(name, arguments)
    local t = name:sub(name:find(":")+1)      --struct element (type)
    local n = name:sub(1,name:find(":")-1)    --struct element (name)


    -- @logic
    if arguments == nil then
        file:write("sub "..n.." {",'\n')
    else
        file:write("sub "..n.." { my ("..arguments..") = @_;",'\n')
    end
        
    
end

function ret(val)
    if val:sub(1,1) == "&" then
        file:write("return (\""..val:sub(2).."\");",'\n')
    
    elseif val:sub(1,1) == "$" then
        file:write("return ("..val:sub(2)..");",'\n')
    else
        file:write("return ("..val..");",'\n')
    end
    
end

function Syscall(fun_name,arguments)

    if arguments ~= nil then
        if arguments:sub(1,1) == "&" then
            file:write(fun_name.."(\""..arguments:sub(2).."\");",'\n')

        elseif arguments:sub(1,1) == "$" then
            file:write(fun_name.."("..arguments:sub(2)..");",'\n')
        else
            file:write(fun_name.."("..arguments..");",'\n')
        end
        
    else
        file:write(fun_name.."();",'\n')
    end

end
