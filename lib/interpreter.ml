open Ast

module StringMap = Map.Make(String)
type env = int StringMap.t

let lookup env k : int =  StringMap.find k env
let extend env k v = StringMap.add k v env
let empty : env = StringMap.empty

let rec eval env = function
  | Var a -> lookup env a
  | Int i -> i
  | BinOp (Add, Int a, Int b) -> a + b
  | BinOp (Mul, Int a, Int b) -> a * b
  | BinOp (Sub, Int a, Int b) -> a - b    
  | BinOp (Div, Int a, Int b) -> a / b
  | BinOp (op, Var a, b) ->
    let a = lookup env a in
    eval env (BinOp (op, Int a, b))
  | BinOp (op, a, Var b) ->
    let b = lookup env b in
    eval env (BinOp (op, a, Int b))
  | If (cond, then_, else_) ->
    (match cond with
    | Int 0 -> eval env else_
    | Int _ -> eval env then_
    | e ->
      let e' = eval env e in
      eval env (If (Int e', then_, else_)))
  | Let (x, e, body) ->
    let e' = eval env e in
    let env' = extend env x e' in
    eval env' body
  | expr -> failwith (Format.asprintf "ta moscando? %a" pp_expr expr)

let eval expr = eval empty expr
