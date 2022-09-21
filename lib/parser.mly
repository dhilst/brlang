%{
open Ast
%}

%token <int> INT
%token <string> ID
%token LET
%token EQ
%token IN
%token IF
%token THEN
%token ELSE
%token PLUS MINUS TIMES DIV
%token LPAREN RPAREN
%token EOL
%left PLUS MINUS        /* lowest precedence */
%left TIMES DIV         /* medium precedence */
%start main             /* the entry point */
%type <expr> main
%%

main:
    expr_0 EOL                { $1 }
;
expr_0:
  | LET ID EQ expr_0 IN expr_0  { Let ($2, $4, $6) }
  | IF expr_0 THEN expr_0
    ELSE expr_0               { If ($2, $4, $6) } 
  | expr_1                    { $1 }
;

expr_1: 
  | INT                     { Int $1 }
  | LPAREN expr_0 RPAREN    { $2 }
  | expr_1 PLUS expr_1      { BinOp (Add, $1, $3) }
  | expr_1 MINUS expr_1     { BinOp (Sub, $1, $3) }
  | expr_1 TIMES expr_1     { BinOp (Mul, $1, $3) }
  | expr_1 DIV expr_1       { BinOp (Div, $1, $3) }
  | ID                      { Var $1 }
;

%%
