# Trabalho academico.
[link do trabalho](https://drive.google.com/file/d/1EB6Qi98cv0MagDmq8j7_QyoinslnqPxF/edit)

## Analisador lexico sintático utilizando Flex/Bison.
Analisador simples para reconhecimento de declarações de variáveis pertencentes à linguagem C. O analisador também reconhece sintaxe básica de if-else, while, for e switch case.

## Resalvas
Esse analisador funciona conforme as especificações do trabalho. Alguns detalhes devem ser levados em conta
  - A sintaxe é parecida com a linguagem C, mas não identica
  - As operações matematicas são as 4 básicas
  - No switch case só é possivel declarar 3

## Exemplos
```c
int teste1,_teste,t3ste;
float teste;
char teste[3];
if(var1>var2){var1 += var2;}
```
```c
if(teste>teste){var=var1+3;}else{var1=var2+3;}
```

### Installation

Requer Flex ou Lex e Bison ou Yacc

```sh
$ lex sposv.l
$ yacc -d spovs.y
$ gcc lex.yy.c y.tab.c -o analisador
$ ./analisador
```


#### Vídeo referência

See [YACC Specification program for Variable Declaration](https://www.youtube.com/watch?v=DVohJ4nljhg)
