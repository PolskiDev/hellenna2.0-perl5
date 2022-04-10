--@ ThrowError "System has been crashed!"
function ThrowError(s)
    file:write("die(\""..s.."\");\n")
end


--(NON-PORTABLE)
--@ try;;
--      ...
--
--@ catch;;
--      ...
--
--@ except;;
--      ...
--
--@ ..;

function try()
    file:write("try {\n")
end
function catch()
    file:write("} catch {\n")
end