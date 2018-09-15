(* open Core.Std *)
;;
let testDummy () =
  let i = 10 in
  let ii = i in
  ()
;;

(* let curDir = Sys.getcwd () in

print_string (curDir ^ " "); *)
;;
(* let dynamic_to_string = function
| STRING s -> s
| INT i -> string_of_int i *)

type dynamic_t = 
  | YZKString of string
  | YZKInt of int
  | YZKUnknownType

;;
type yzk_type_def_t = {
  tag : int;
  name : string;
  mapper : Obj.t -> dynamic_t;
}

let sYzkTypesTable = Hashtbl.create 1024

let addTypeDef : yzk_type_def_t -> unit 
= fun def 
-> Hashtbl.add sYzkTypesTable def.tag def

module YZKTypesRepo = 
struct

  (**** Default types ****)
  addTypeDef { 
    tag = Obj.int_tag;
    name = "int";
    mapper = fun r -> YZKInt(Obj.magic r);
  };
  addTypeDef { 
    tag = Obj.string_tag;
    name = "string";
    mapper = fun r -> YZKString(Obj.magic r);
  };

  (**** Functions ****)
  let def x =
    let repr = Obj.repr x in
    let tag = Obj.tag repr in
    let result = if Hashtbl.mem tag
    then
      Some(YZKInt(42))
      (* let def = Hashtbl.find tag in
      Some(def.(mapper repl)) *)
    else
      None
    in
    result
  
end


(* let to_dymaic_impl : 'a -> dynamic_t *)
;;
let dynamic_to_string : dynamic_t -> string
= fun d
-> match d with
  | YZKString(s) -> s
  | YZKInt(i) -> string_of_int i
  | YZKUnknownType -> "Unknown type"
;;
let to_dynamic  : 'a -> dynamic_t 
= fun t 
-> 
  let repr = Obj.repr t in
  let tag = Obj.tag repr in
  if tag = Obj.int_tag 
    then YZKInt(Obj.magic repr)
  else if tag = Obj.string_tag 
    then YZKString(Obj.magic repr)
  else 
    YZKUnknownType
  (* let string_tag = Obj.string_tag in
  let int_tag = Obj.int_tag in
  match tag with
    | string_tag  -> YZKString(Obj.magic repr)
    | int_tag -> YZKInt(Obj.magic repr)
    | _ -> YZKUnknownType *)

(* match t with
  | int as i -> 
    YZKInt(Obj.magic(i) : int )
  | string as s -> 
    YZKString(Obj.magic(s)) *)
;;
let def : int -> string
= fun t 
-> 
  if t = Obj.int_tag then "int" 
  else if t = Obj.string_tag then "string" 
  else "unknown"

  (* let result = match t with
    | string_tag -> 
      "string"
    | int_tag -> 
      "int"
    | _ ->
      "unknown"
  in result *)
;;
let print_dynamic : dynamic_t -> unit
= fun d 
-> print_string (dynamic_to_string(d) ^ "\n")
;;
type dynamic_tuple_t = 
  | VAR1 of dynamic_t
  | VAR2 of dynamic_t * dynamic_t
  | VAR3 of dynamic_t * dynamic_t * dynamic_t
;;
print_string (def(Obj.tag (Obj.repr "agaga")) ^"\n");
print_string (def(Obj.tag (Obj.repr 42)) ^"\n");

print_dynamic (YZKString("agaga"));
print_dynamic (YZKInt(42));

let d = to_dynamic "agaga" in print_dynamic d;
let d = to_dynamic 42 in print_dynamic d;

(* print_string (dynamic_to_string(d) ^ "\n") *)

(* (dynamic_to_string YZKString("agaga")) *)
;;
(* let hui = to_dynamic 42 in
print_string (dynamic_to_string hui) *)
(* let mui = to_dynamic "dui"
let dui = to_dynamic 1.0 *)



(* 
testDummy ();
let argc, args      = CLI.init () in
let inputFile       = CLI.get_string [ "-i" ; "--input" ] args in
let outDir          = CLI.get_string [ "-o" ; "--out" ] args in
print_string (inputFile ^ " " ^ outDir); *)
