let digit = [%sedlex.regexp? '0'..'9']
let number = [%sedlex.regexp? Plus digit]
let id = [%sedlex.regexp? Plus ('a'..'z')]

open Parser
exception Eof


let rec token buf =
  match%sedlex buf with
  | Plus (Chars " \t") -> token buf
  | '\n' ->   EOL
  | number -> INT (int_of_string (Sedlexing.Utf8.lexeme buf))
  | "sepah" -> IF
  | "podpah" -> THEN
  | "sqn" -> ELSE
  | "lek" -> LET
  | "fi" -> IN
  | "=" -> EQ
  | '+' -> PLUS
  | '-' -> MINUS
  | '*' -> TIMES
  | '/' -> DIV
  | '(' -> LPAREN
  | ')' -> RPAREN
  | id -> ID (Sedlexing.Utf8.lexeme buf)
  | eof -> raise Eof
  | _ -> failwith "Unexpected character"
