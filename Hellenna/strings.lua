-- @REPLACE RULES:

--from:  (func_ret, v)
--to:    (func_ret, v)

--from:  return 
--to:    file:write("my $"..func_ret:sub(2).." = "..


String = {}


-- FIND CHAR IN STRING
--@ let (|$variable:string|, "&Hello world")
--@ String.find(|$variable|, "&w")

--@ let (|$variable:string|, "&Hello world")
--@ let (|$char:string|, "&w")
--@ String.find(|$variable|, |$char|)

--@ String.find("&Hello world", "&w")
function String.find(func_ret, s, substring)    --OK
    if s:sub(1, 1) == "&" then
        if substring:sub(1,1) == "&" then
            --index($s,$sub);
            file:write("my $"..func_ret:sub(2).." = ".."index(\""..s:sub(2).."\", \""..substring:sub(2).."\");")

            --file:write("my $"..func_ret:sub(2).." = ".."\""..s:sub(2).."\".find(\""..substring:sub(2).."\")"
            --file:write("my $"..func_ret:sub(2).." = ".."strings.Index(\""..s:sub(2).."\", \""..substring:sub(2).."\")"

        elseif substring:sub(1,1) == "$" then
            file:write("my $"..func_ret:sub(2).." = ".."index(\""..s:sub(2).."\", $"..substring:sub(2)..");")
            --file:write("my $"..func_ret:sub(2).." = ".."\""..s:sub(2).."\".find("..substring:sub(2)..")"
            --file:write("my $"..func_ret:sub(2).." = ".."strings.Index(\""..s:sub(2).."\", "..substring:sub(2)..")"
        else
            file:write("my $"..func_ret:sub(2).." = ".."index("..s:sub(2)..", "..substring:sub(2)..");")
            --file:write("my $"..func_ret:sub(2).." = ".."\""..s:sub(2).."\".find("..substring..")"
            --file:write("my $"..func_ret:sub(2).." = ".."strings.Index(\""..s:sub(2).."\", "..substring..")"
        end

    elseif s:sub(1, 1) == "$" then
        if substring:sub(1,1) == "&" then
            file:write("my $"..func_ret:sub(2).." = ".."index("..s:sub(2)..", \""..substring:sub(2).."\");")
            --file:write("my $"..func_ret:sub(2).." = "..s:sub(2)..".indexOf(\""..substring:sub(2).."\")"
            --file:write("my $"..func_ret:sub(2).." = "..s:sub(2)..".find(\""..substring:sub(2).."\")"
            --file:write("my $"..func_ret:sub(2).." = ".."strings.Index("..s:sub(2)..", \""..substring:sub(2).."\")"

        elseif substring:sub(1,1) == "$" then
            file:write("my $"..func_ret:sub(2).." = ".."index("..s:sub(2)..", "..substring:sub(2)..");")
            --file:write("my $"..func_ret:sub(2).." = "..s:sub(2)..".indexOf("..substring:sub(2)..")"
            --file:write("my $"..func_ret:sub(2).." = "..s:sub(2)..".find("..substring:sub(2)..")"
            --file:write("my $"..func_ret:sub(2).." = ".."strings.Index("..s:sub(2)..", "..substring:sub(2)..")"
        else
            file:write("my $"..func_ret:sub(2).." = ".."index("..s..", "..substring..");")
            --file:write("my $"..func_ret:sub(2).." = "..s:sub(2)..".indexOf("..substring..")"
            --file:write("my $"..func_ret:sub(2).." = "..s:sub(2)..".find("..substring..")"
            --file:write("my $"..func_ret:sub(2).." = ".."strings.Index("..s:sub(2)..", "..substring..")"
        end
    else
        if substring:sub(1,1) == "&" then
            file:write("my $"..func_ret:sub(2).." = ".."index("..s:sub(2)..", \""..substring:sub(2).."\");")
            --file:write("my $"..func_ret:sub(2).." = "..s..".indexOf(\""..substring:sub(2).."\")"
            --file:write("my $"..func_ret:sub(2).." = ".."strings.Index("..s:sub(2)..", \""..substring:sub(2).."\")"

        elseif substring:sub(1,1) == "$" then
            file:write("my $"..func_ret:sub(2).." = ".."index("..s:sub(2)..", "..substring:sub(2)..");")
            --file:write("my $"..func_ret:sub(2).." = "..s..".indexOf("..substring:sub(2)..")"
            --file:write("my $"..func_ret:sub(2).." = ".."strings.Index("..s:sub(2)..", "..substring:sub(2)..")"
        else
            file:write("my $"..func_ret:sub(2).." = ".."index("..s..", "..substring..");")
            --file:write("my $"..func_ret:sub(2).." = "..s..".indexOf("..substring..")"
            --file:write("my $"..func_ret:sub(2).." = ".."strings.Index("..s:sub(2)..", "..substring..")"
        end
    end
    
end


--@ Console.WriteLine(|String.slice("&Hello world", |1:3|)|)

--@ let (|$variable:string|, "&Hello world")
--@ Console.WriteLine(|String.slice("$variable", |1:3|)|)
function String.slice(func_ret, s,seq)      --OK
    local seq_begin = seq:sub(1,seq:find(":")-1)    --my $(name)
    local seq_end = seq:sub(seq:find(":")+1)      --my $(type)
    
    if s:sub(1,1) == "&" then
        file:write("my $"..func_ret:sub(2).." = substr \""..s:sub(2).."\", "..seq_begin..","..seq_end..";\n")
        --file:write("my $"..func_ret:sub(2).." = ".."\""..s:sub(2).."\".slice("..seq_begin..".."..seq_end..")"

    elseif s:sub(1,1) == "$" then
        file:write("my $"..func_ret:sub(2).." = substr $"..s:sub(2)..", "..seq_begin..","..seq_end..";\n")
        --file:write("my $"..func_ret:sub(2).." = "..s:sub(2)..".slice("..seq_begin..".."..seq_end..")" 
    else
        file:write("my $"..func_ret:sub(2).." = substr "..s..", "..seq_begin..","..seq_end..";\n")
        --file:write("my $"..func_ret:sub(2).." = "..s..".slice("..seq_begin..".."..seq_end..")" 
    end
end


--@ let(|$variable:string|, "&Hello World")
--@ Console.WriteLine(Strings.replace(|$variable|, "Hello","Bye"))

function String.replace(func_ret, var, x,y)     --OK

    -- First part
    if var:sub(1,1) == "&" then
        file:write("my $"..func_ret:sub(2).." = \""..var:sub(2).."\";\n")
    
    elseif var:sub(1,1) == "$"
    or var:sub(1,1) == "@" then
        file:write("my $"..func_ret:sub(2).." = "..var:sub(2)..";\n")
    end
    
    --Second part
    file:write("$"..func_ret:sub(2).." =~ s/"..x:sub(2).."/"..y:sub(2).."/ig;\n")

end



--@ let(|$cadeia:string|, "&Hello World")
--@ String.split(|$replaced_var|, |$cadeia|, "-")
--@ Console.WriteLine(|$replaced_var|)

function String.split(func_ret, split_var,split_char)    --OK
    file:write("my @"..func_ret:sub(2).." = split(\""..split_char.."\", $"..split_var:sub(2)..");\n")
    --file:write("my $"..func_ret:sub(2).." = "..split_var:sub(2)..".split(\""..split_char.."\")")
end


--(NON-PORTABLE) STRING.REVERSE ONLY EXISTS ON JVM IMPLEMENTATION!

--@ Console.WriteLine(|String.uppercase("&hello world")|)
--@ Console.WriteLine(|String.uppercase(|$variable|)|)
--@ Console.WriteLine(|String.uppercase(|variable|)|)
function String.reverse(func_ret, s)    --OK
    if s:sub(1,1) == "&" then 
        file:write("my $"..func_ret:sub(2).." = ".."scalar reverse(\""..s:sub(2).."\");\n")

    elseif s:sub(1,1) == "$" then
        file:write("my $"..func_ret:sub(2).." = ".."scalar reverse($"..s:sub(2)..");\n")
        --file:write("my $"..func_ret:sub(2).." = "..s:sub(2)..".reversed()"
    else
        file:write("my $"..func_ret:sub(2).." = ".."scalar reverse("..s..");\n")
        --file:write("my $"..func_ret:sub(2).." = "..s:sub(2)..".reversed()"
    end
end



--@ Console.WriteLine(|String.uppercase("&hello world")|)
--@ Console.WriteLine(|String.uppercase(|$variable|)|)
--@ Console.WriteLine(|String.uppercase(|variable|)|)
function String.uppercase(func_ret, s)    --OK
    if s:sub(1,1) == "&" then
        file:write("my $"..func_ret:sub(2).." = ".."uc(\""..s:sub(2).."\");\n")

    elseif s:sub(1,1) == "$" then
        file:write("my $"..func_ret:sub(2).." = uc($"..s:sub(2)..");\n")
    else
        file:write("my $"..func_ret:sub(2).." = uc($"..s:sub(2)..");\n")
    end
end


--@ Console.WriteLine(|String.lowercase("&HELLO WORLD")|)
--@ Console.WriteLine(|String.lowercase(|$variable|)|)
--@ Console.WriteLine(|String.lowercase(|variable|)|)

function String.lowercase(func_ret, s)    --OK
    if s:sub(1,1) == "&" then
        file:write("my $"..func_ret:sub(2).." = ".."lc(\""..s:sub(2).."\");\n")

    elseif s:sub(1,1) == "$" then
        file:write("my $"..func_ret:sub(2).." = lc($"..s:sub(2)..");\n")
    else
        file:write("my $"..func_ret:sub(2).." = lc($"..s:sub(2)..");\n")
    end
end


--@ Console.WriteLine(|String.len("&HELLO WORLD")|)
--@ Console.WriteLine(|String.len(|$variable|)|)
--@ Console.WriteLine(|String.len(|variable|)|)
function String.len(func_ret, s)    --OK
    if s:sub(1,1) == "&" then
        file:write("my $"..func_ret:sub(2).." = length(\""..s:sub(2).."\");\n")

    elseif s:sub(1,1) == "$" then
        file:write("my $"..func_ret:sub(2).." = length($"..s..");\n")
    else
        file:write("my $"..func_ret:sub(2).." = length($"..s..");\n")
    end
end



-- STRING.INCLUDES
--@ Console.WriteLine( |String.includes("&HELLO WORLD", "&HELLO")| )

--@ Console.WriteLine( |String.includes(|$variable|,|$another|)| )
--@ Console.WriteLine( |String.includes(|variable|,|another|)| )

--@ Console.WriteLine( |String.includes(|variable|,"&HELLO")| )
--@ Console.WriteLine( |String.includes("&HELLO", |variable|)| )
function String.includes(func_ret, s,x)    --OK
    if s:sub(1,1) == "&" then
        --(s) is string
        -- possible returns: "true" or "false"
        if x:sub(1,1) == "&" then
            file:write("my $"..func_ret:sub(2).." = includes(\""..s:sub(2).."\",\""..x:sub(2).."\");\n")
            
            --file:write("my $"..func_ret:sub(2).." = ".."\""..s:sub(2).."\" in \""..x:sub(2).."\""
            --file:write("my $"..func_ret:sub(2).." = ".."strings.Contains(\""..s:sub(2).."\",\""..x:sub(2).."\")"
        
        elseif x:sub(1,1) == "$" or x:sub(1,1) == "@" then
            file:write("my $"..func_ret:sub(2).." = includes(\""..s:sub(2).."\", $"..x:sub(2)..");\n")
            --file:write("my $"..func_ret:sub(2).." = ".."\""..s:sub(2).."\" in "..x:sub(2)
            --file:write("my $"..func_ret:sub(2).." = ".."strings.Contains(\""..s:sub(2).."\","..x:sub(2)..")"
        else
            file:write("my $"..func_ret:sub(2).." = includes(\""..s:sub(2).."\","..x..");\n")
            --file:write("my $"..func_ret:sub(2).." = ".."\""..s:sub(2).."\" in "..x:sub(2)
            --file:write("my $"..func_ret:sub(2).." = ".."strings.Contains(\""..s:sub(2).."\","..x..")"
        end

    elseif s:sub(1,1) == "$" then
        --(s) is variable
        if x:sub(1,1) == "&" then
            file:write("my $"..func_ret:sub(2).." = includes($"..s:sub(2)..", \""..x:sub(2).."\");\n")
            --file:write("my $"..func_ret:sub(2).." = "..s:sub(2).." in \""..x:sub(2).."\""
            --file:write("my $"..func_ret:sub(2).." = ".."strings.Contains("..s:sub(2)..",\""..x:sub(2).."\")"
        
        elseif x:sub(1,1) == "$" or x:sub(1,1) == "@" then
            file:write("my $"..func_ret:sub(2).." = includes($"..s:sub(2)..", $"..x:sub(2)..");\n")
            --file:write("my $"..func_ret:sub(2).." = "..s:sub(2).." in "..x:sub(2)
            --file:write("my $"..func_ret:sub(2).." = ".."strings.Contains("..s:sub(2)..","..x:sub(2)..")"
        else
            file:write("my $"..func_ret:sub(2).." = includes($"..s:sub(2)..", "..x..");\n")
            --file:write("my $"..func_ret:sub(2).." = "..s:sub(2).." in "..x
            --file:write("my $"..func_ret:sub(2).." = ".."strings.Contains("..s:sub(2)..","..x..")"
        end


    else
        if x:sub(1,1) == "&" then
            file:write("my $"..func_ret:sub(2).." = includes("..s..",\""..x:sub(2).."\");\n")
            --file:write("my $"..func_ret:sub(2).." = "..s.." in \""..x:sub(2).."\""
            --file:write("my $"..func_ret:sub(2).." = ".."strings.Contains("..s:sub(2)..",\""..x:sub(2).."\")"
            

        elseif x:sub(1,1) == "$" or x:sub(1,1) == "@" then
            file:write("my $"..func_ret:sub(2).." = includes("..s..", $"..x:sub(2)..");\n")
            --file:write("my $"..func_ret:sub(2).." = "..s.." in "..x:sub(2)
            --file:write("my $"..func_ret:sub(2).." = ".."strings.Contains("..s:sub(2)..","..x:sub(2)..")"
        else
            file:write("my $"..func_ret:sub(2).." = includes("..s..","..x..");\n")
            --file:write("my $"..func_ret:sub(2).." = "..s.." in "..x
            --file:write("my $"..func_ret:sub(2).." = ".."strings.Contains("..s:sub(2)..","..x..")"
        end
    end
end
