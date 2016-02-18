
type var = string 

type pattern =
  | PUnit
  | PVar of var
  | PPair of pattern * pattern

type oper = ADD | MUL | SUB | LT | AND | OR | EQB | EQI

type unary_oper = NEG | NOT | READ 

type expr = 
       | Unit  
       | Var of var
       | Integer of int
       | Boolean of bool
       | UnaryOp of unary_oper * expr
       | Op of expr * oper * expr
       | If of expr * expr * expr
       | Pair of expr * expr
       | Fst of expr 
       | Snd of expr 
       | Inl of expr 
       | Inr of expr 
       | Case of expr * lambda * lambda 

       | While of expr * expr 
       | Seq of (expr list)
       | Ref of expr 
       | Deref of expr 
       | Assign of expr * expr 

       | Lambda of plambda 
       | App of expr * expr
       | LetFun of var * plambda * expr
       | LetRecFun of var * plambda * expr

and lambda = Past.var * expr 
and plambda = pattern * expr

(* printing *) 
val string_of_unary_oper : unary_oper -> string 
val string_of_oper : oper -> string 
val string_of_uop : unary_oper -> string 
val string_of_bop : oper -> string 
val print_expr : expr -> unit 
val eprint_expr : expr -> unit
val string_of_pattern : pattern -> string
val string_of_expr : expr -> string 
