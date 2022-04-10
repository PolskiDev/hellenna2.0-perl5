File = {}

--function File.CreateFile(filename)    =>  (NON-PORTABLE)


function File.WriteLine(filename, text)
    if filename:sub(1,1) == "&" then
        if text:sub(1,1) == "&" then
            file:write("open(FILE_VAR, '>', \""..filename:sub(2).."\") or die $!;")
            file:write("print FILE_VAR \""..text:sub(2).."\";")
            file:write("close(FILE_VAR);")
            
        elseif text:sub(1,1) == "$"
        or text:sub(1,1) == "@" then
            file:write("open(FILE_VAR, '>', \""..filename:sub(2).."\") or die $!;")
            file:write("print FILE_VAR $"..text:sub(2)..";")
            file:write("close(FILE_VAR);")
        end


    elseif filename:sub(1,1) == "$"
    or filename:sub(1,1) == "@" then

        if text:sub(1,1) == "&" then
            file:write("open(FILE_VAR, '>', $"..filename:sub(2)..") or die $!;")
            file:write("print FILE_VAR \""..text:sub(2).."\";")
            file:write("close(FILE_VAR);")
            
        elseif text:sub(1,1) == "$"
        or text:sub(1,1) == "@" then
            file:write("open(FILE_VAR, '>', $"..filename:sub(2)..") or die $!;")
            file:write("print FILE_VAR $"..text:sub(2)..";")
            file:write("close(FILE_VAR);")
        end

    end


end


-- VERY UNSTABLE - IN DEVELOPMENT
function File.ReadLine(filename)
    if filename:sub(1,1) == "&" then
        file:write("open(FILE_VAR,'<', \""..filename:sub(2).."\") or die $!;")
        file:write("while(<FILE_VAR>) { return($_); }")
        file:write("close;")
        
    elseif filename:sub(1,1) == "$"
    or file:sub(1,1) == "@" then
        file:write("open(FILE_VAR,'<', $"..filename:sub(2)..") or die $!;")
        file:write("while(<FILE_VAR>) { return($_); }")
        file:write("close;")
        
    end
    
end