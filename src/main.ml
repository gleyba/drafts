open Angstrom
;;
print_string "Hello world!\n";
print_string "Hello world!\n";
print_string "Hello world!\n";
print_string "Hello world!\n"
;;
let argc, args = CLI.init () in
let inputFile = CLI.get_string ["-i";"--input"] args in
let outDir = CLI.get_string ["-o";"--out"] args in
print_string (inputFile ^ " " ^ outDir)