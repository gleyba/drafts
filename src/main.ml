(* open Core.Std *)
;;
let testDummy () =
  let i = 10 in
  let ii = i in
  ()
;;

let curDir = Sys.getcwd () in

print_string (curDir ^ " ");
(* 
testDummy ();
let argc, args      = CLI.init () in
let inputFile       = CLI.get_string [ "-i" ; "--input" ] args in
let outDir          = CLI.get_string [ "-o" ; "--out" ] args in
print_string (inputFile ^ " " ^ outDir); *)
