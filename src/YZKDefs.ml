(* let dynamic_to_string = function
| STRING s -> s
| INT i -> string_of_int i *)


type dynamic_t = 
  | STRING of string
  | INT of int

type dynamic_tuple_t = 
  | VAR1 of dynamic_t
  | VAR2 of dynamic_t * dynamic_t
  | VAR3 of dynamic_t * dynamic_t * dynamic_t

module YZKLogger = 
struct
  
  let level = ref 0

  let log x = 
    print_string x
  
  let debug x = 
    if !level > 0 
    then 
      log x

end