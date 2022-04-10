Oper = {}

--@ New array with *size positions
--@ Oper.new(|vetor:string|, {{"Gabriel","Mike","Roberto"}} )
--@ Oper.new(|vetor:int|, {{2,4,6,8,10,12,14,16, ...}} )
function Oper.new(name,size)
    -- body
    local t = name:sub(name:find(":")+1)      --var (type)
    local n = name:sub(1,name:find(":")-1)    --var (name)

    file:write("my @"..n:sub(2).." = ("..size..");\n")
end



--@ Add new value to an existing or new (index) in array
--@ Oper.set(|vetor:3|, "Gabriel")
function Oper.set(name, value)
    local pos = name:sub(name:find(":")+1)      --var (type)
    local n = name:sub(1,name:find(":")-1)    --var (name)
    --file:write("$"..n.." = $"..n.."["..pos.."]")

    if value:sub(1,1) == "&" then
        file:write("push(@"..n:sub(2)..",\""..value:sub(2).."\");","\n")

    elseif value:sub(1,1) == "$"
    or value:sub(1,1) == "@" then
        
        file:write("push(@"..n:sub(2)..","..value:sub(2)..");","\n")
    end
        
end

--@ Get value from an existing (index) in array
--@ Oper.get(|vetor:3|)
function Oper.get(func_ret, name)
    local pos = name:sub(name:find(":")+1)      --var (type)
    local n = name:sub(1,name:find(":")-1)    --var (name)
    --file:write("var "..func_ret:sub(2).." = "..n.."["..pos.."]")
    file:write("my $"..func_ret:sub(2).." = ".."@"..n:sub(2).."["..pos.."];","\n")
end


--@ Std.list.add(|lista|, "Julia")
function Oper.add(name,element)
    if element:sub(1,1) == "&" then
        file:write("push(@"..name:sub(2)..", \""..element:sub(2).."\");\n")

    elseif element:sub(1,1) == "$"
    or element:sub(1,1) == "@" then
        file:write("push(@"..name:sub(2)..", "..element:sub(2)..");\n")
    end
end