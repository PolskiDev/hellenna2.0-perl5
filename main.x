(import) "Hellenna.lang"
(import) "Hellenna.stdio"
(import) "Hellenna.error"
(import) "Hellenna.stdtab"
(import) "Hellenna.var"
(import) "Hellenna.arr.oper"
(import) "Hellenna.cast"
(import) "Hellenna.strings"
(import) "Hellenna.incr"
(import) "Hellenna.loops"
(import) "Hellenna.file"
(import) "Hellenna.os"
(import) "Hellenna.fn"
(import) "Hellenna.pkg"
(import) "Hellenna.mod"


namespace "main"
    
    (import_perl) "strict"
    (import_perl) "warnings"



    fn("main:void") >>
        (import_module) "main"


        let (|$msg:string|, "&Hello world")
        Console.WriteLine |$msg|

        Console.WriteLine "&Hallo Welt"
        Console.WriteLine |"Hello "+"Darwin"|
    
    ..;




    --@System Call
    Syscall("main");
..?