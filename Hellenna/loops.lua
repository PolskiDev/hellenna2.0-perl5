function declare_loop()
    file:write("while(true) {",'\n')
end
function declare_while(condition)
    file:write("while("..condition..") {",'\n')
end
function declare_for(i,min,max,step)
    if step == nil then step = 1 end
    file:write("for my $"..i.." ("..min..".."..max..") {")
end


function times(i, max)
    declare_for(i, 0,max, 1)
end


function declare_if(condition)
    condition = condition:gsub("!=","!~")
    condition = condition:gsub("@","$")
    condition = condition:gsub("*","$")

    file:write("if ("..condition..") {",'\n')
end

function declare_elseif(condition)
    condition = condition:gsub("!=","!~")
    condition = condition:gsub("@","$")
    condition = condition:gsub("*","$")

    file:write("} elsif ("..condition..") {",'\n')
end

function declare_else(condition)
    condition = condition:gsub("!=","!~")
    condition = condition:gsub("@","$")
    condition = condition:gsub("*","$")

    file:write("} else {",'\n')
end



function declare_end()
    file:write("};",'\n')
end
function declare_break()
    file:write("last;",'\n')
end