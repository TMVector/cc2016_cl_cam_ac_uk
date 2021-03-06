(* 
   The Parsed AST 
*) 
type var = string 

type loc = Lexing.position 

type type_expr = 
   | TEint 
   | TEbool 
   | TEunit 
   | TEref of type_expr 
   | TEarrow of type_expr * type_expr
   | TEproduct of type_expr * type_expr
   | TEunion of type_expr * type_expr

type pattern =
  | PUnit
  | PVar of var * type_expr
  | PPair of pattern * pattern

type oper = ADD | MUL | SUB | LT | AND | OR | EQ | EQB | EQI

type unary_oper = NEG | NOT 

type expr = 
       | Unit of loc  
       | What of loc 
       | Var of loc * var
       | Integer of loc * int
       | Boolean of loc * bool
       | UnaryOp of loc * unary_oper * expr
       | Op of loc * expr * oper * expr
       | If of loc * expr * expr * expr
       | Pair of loc * expr * expr
       | Fst of loc * expr 
       | Snd of loc * expr 
       | Inl of loc * type_expr * expr 
       | Inr of loc * type_expr * expr 
       | Case of loc * expr * plambda * plambda 

       | While of loc * expr * expr 
       | Seq of loc * (expr list)
       | Ref of loc * expr 
       | Deref of loc * expr 
       | Assign of loc * expr * expr

       | Lambda of loc * plambda 
       | App of loc * expr * expr 
       | Let of loc * pattern * expr * expr
       | LetFun of loc * var * plambda * type_expr * expr
       | LetRecFun of loc * var * plambda * type_expr * expr

and lambda = var * type_expr * expr 
and plambda = pattern * expr
val loc_of_expr : expr -> loc 
val string_of_loc : loc -> string 
val type_of_pattern : pattern -> type_expr 

(* printing *) 
val string_of_unary_oper : unary_oper -> string 
val string_of_oper : oper -> string 
val string_of_type : type_expr -> string 
val string_of_pattern : pattern -> string
val string_of_expr : expr -> string 
val print_expr : expr -> unit 
val eprint_expr : expr -> unit


