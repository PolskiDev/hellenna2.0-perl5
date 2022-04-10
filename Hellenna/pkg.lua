function define_package(name)
    file:write("package "..name..";\n")
end
function define_import(name)
    file:write("use "..name..";\n")
end