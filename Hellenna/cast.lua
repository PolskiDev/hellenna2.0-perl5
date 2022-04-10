-- @REPLACE RULES:

--from:  (func_ret, v)
--to:    (func_ret, v)

--from:  return 
--to:    file:write("my $"..func_ret:sub(2).." = "..


Cast = {}
function Cast.toString(func_ret, v)
    if v:sub(1,1) == "&" then
        file:write("my $"..func_ret:sub(2).." = ".."\""v:sub(2)"\""..";\n")

    elseif v:sub(1,1) == "$" then
        file:write("my $"..func_ret:sub(2).." = $"..v:sub(2)..";\n")
    else
        file:write("my $"..func_ret:sub(2).." = $"..v..";\n")
    end
end
function Cast.toBoolean(func_ret, v)
    if v:sub(1,1) == "&" then
        file:write("my $"..func_ret:sub(2).." = ".."\""v:sub(2)"\""..";\n")
    elseif v:sub(1,1) == "$" then
        file:write("my $"..func_ret:sub(2).." = $"..v:sub(2)..";\n")
    else
        file:write("my $"..func_ret:sub(2).." = $"..v..";\n")
    end
end


--@FLOAT
function Cast.toFloat(func_ret, v)
    if v:sub(1,1) == "&" then
        file:write("my $"..func_ret:sub(2).." = ".."\""v:sub(2)"\""..";\n")
    elseif v:sub(1,1) == "$" then
        file:write("my $"..func_ret:sub(2).." = $"..v:sub(2)..";\n")
    else
        file:write("my $"..func_ret:sub(2).." = $"..v..";\n")
    end
end
function Cast.toDouble(func_ret, v)
    if v:sub(1,1) == "&" then
        file:write("my $"..func_ret:sub(2).." = ".."\""v:sub(2)"\""..";\n")
    elseif v:sub(1,1) == "$" then
        file:write("my $"..func_ret:sub(2).." = $"..v:sub(2)..";\n")
    else
        file:write("my $"..func_ret:sub(2).." = $"..v..";\n")
    end
end


--@INTEGER
function Cast.toInt(func_ret, v)
    if v:sub(1,1) == "&" then
        file:write("my $"..func_ret:sub(2).." = ".."\""v:sub(2)"\""..";\n")
    elseif v:sub(1,1) == "$" then
        file:write("my $"..func_ret:sub(2).." = $"..v:sub(2)..";\n")
    else
        file:write("my $"..func_ret:sub(2).." = $"..v..";\n")
    end
end
function Cast.toInt8(func_ret, v)
    if v:sub(1,1) == "&" then
        file:write("my $"..func_ret:sub(2).." = ".."\""v:sub(2)"\""..";\n")
    elseif v:sub(1,1) == "$" then
        file:write("my $"..func_ret:sub(2).." = $"..v:sub(2)..";\n")
    else
        file:write("my $"..func_ret:sub(2).." = $"..v..";\n")
    end
end
function Cast.toInt16(func_ret, v)
    if v:sub(1,1) == "&" then
        file:write("my $"..func_ret:sub(2).." = ".."\""v:sub(2)"\""..";\n")
    elseif v:sub(1,1) == "$" then
        file:write("my $"..func_ret:sub(2).." = $"..v:sub(2)..";\n")
    else
        file:write("my $"..func_ret:sub(2).." = $"..v..";\n")
    end
end
function Cast.toInt32(func_ret, v)
    if v:sub(1,1) == "&" then
        file:write("my $"..func_ret:sub(2).." = ".."\""v:sub(2)"\""..";\n")
    elseif v:sub(1,1) == "$" then
        file:write("my $"..func_ret:sub(2).." = $"..v:sub(2)..";\n")
    else
        file:write("my $"..func_ret:sub(2).." = $"..v..";\n")
    end
end
function Cast.toInt64(func_ret, v)
    if v:sub(1,1) == "&" then
        file:write("my $"..func_ret:sub(2).." = ".."\""v:sub(2)"\""..";\n")
    elseif v:sub(1,1) == "$" then
        file:write("my $"..func_ret:sub(2).." = $"..v:sub(2)..";\n")
    else
        file:write("my $"..func_ret:sub(2).." = $"..v..";\n")
    end
end

--@UNSIGNED INTEGER
function Cast.toUInt(func_ret, v)
    if v:sub(1,1) == "&" then
        file:write("my $"..func_ret:sub(2).." = ".."\""v:sub(2)"\""..";\n")
    elseif v:sub(1,1) == "$" then
        file:write("my $"..func_ret:sub(2).." = $"..v:sub(2)..";\n")
    else
        file:write("my $"..func_ret:sub(2).." = $"..v..";\n")
    end
end
function Cast.toUInt8(func_ret, v)
    if v:sub(1,1) == "&" then
        file:write("my $"..func_ret:sub(2).." = ".."\""v:sub(2)"\""..";\n")
    elseif v:sub(1,1) == "$" then
        file:write("my $"..func_ret:sub(2).." = $"..v:sub(2)..";\n")
    else
        file:write("my $"..func_ret:sub(2).." = $"..v..";\n")
    end
end
function Cast.toUInt16(func_ret, v)
    if v:sub(1,1) == "&" then
        file:write("my $"..func_ret:sub(2).." = ".."\""v:sub(2)"\""..";\n")
    elseif v:sub(1,1) == "$" then
        file:write("my $"..func_ret:sub(2).." = $"..v:sub(2)..";\n")
    else
        file:write("my $"..func_ret:sub(2).." = $"..v..";\n")
    end
end
function Cast.toUInt32(func_ret, v)
    if v:sub(1,1) == "&" then
        file:write("my $"..func_ret:sub(2).." = ".."\""v:sub(2)"\""..";\n")
    elseif v:sub(1,1) == "$" then
        file:write("my $"..func_ret:sub(2).." = $"..v:sub(2)..";\n")
    else
        file:write("my $"..func_ret:sub(2).." = $"..v..";\n")
    end
end
function Cast.toUInt64(func_ret, v)
    if v:sub(1,1) == "&" then
        file:write("my $"..func_ret:sub(2).." = ".."\""v:sub(2)"\""..";\n")
    elseif v:sub(1,1) == "$" then
        file:write("my $"..func_ret:sub(2).." = $"..v:sub(2)..";\n")
    else
        file:write("my $"..func_ret:sub(2).." = $"..v..";\n")
    end
end