System = {}

function System.Process(cmd)
    file:write("system(\""..cmd.."\");")
end


function System.ifwindows()
    file:write("my $__OS_NAME =  \"$Config{osname}\";\n")
    file:write("if ($__OS_NAME == \"msys\") {\n")
    --  Close with:     ..;
end
function System.iflinux()
    file:write("my $__OS_NAME =  \"$Config{osname}\";\n")
    file:write("if ($__OS_NAME == \"linux\") {\n")
end
function System.ifdarwin()
    file:write("my $__OS_NAME =  \"$Config{osname}\";\n")
    file:write("if ($__OS_NAME == \"darwin\") {\n")
    --  Close with:     ..;
end