val dynamic_to_string : 'a -> 'a
type dynamic_t = STRING of string | INT of int
type dynamic_tuple_t =
    VAR1 of dynamic_t
  | VAR2 of dynamic_t * dynamic_t
  | VAR3 of dynamic_t * dynamic_t * dynamic_t
module YZKLogger :
  sig
    val level : int ref
    val log : string -> unit
    val debug : string -> unit
  end
