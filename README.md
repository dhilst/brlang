# BRLang 

[A linguagem dos memes](https://twitter.com/geckones/status/1571998321765482496?s=20&t=fXlAJMV_6f6VyybmCucJmA)

Rodando os exemplos : 

_Vc vai precisar de ocaml instalado_

```
opam install --deps-only .
$ echo "lek a = 1 fi a" | dune exec bin/main.exe 
```

Exemplos até agora, (ainda não tem comentário)

* let: `lek a = 1 fi a`
* if then else: `sepah 1 podpah 2 sqn sepah 3 podpah 4 sqn 5`, o unico tipo de dado
  até agora é inteiro, 0 é falso, qualquer outra coisa é verdadeiro
* Aritimética `1 + 2`, `1 * 2`, `1 - 2`, `1 / 2`

PRs são totalmente bem vindos

TODO: 
 * funções, com `receba` no lugar do return
 * ideias : https://twitter.com/geckones/status/1571998321765482496?s=20&t=fXlAJMV_6f6VyybmCucJmA
