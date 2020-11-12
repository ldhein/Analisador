# Analisador lexico sintático utilizando Flex/Bison.
Analisador simples para reconhecimento de declarações de variáveis pertencentes à linguagem C. É possível fazer múltiplas declarações e declarações de arrays. Para que as sentenças sejam validadas elas devem seguir a seguinte sintaxe:

  - Declarar o tipo (int,float ou char)
  - Declarar o nome da variável (de acordo com os padrões do C)
  - Finalizar com o cracter ponto e vírgula (;). Para mais uma declaração use vírgula e por fim o ;

# Exemplos
```c
int teste1,_teste,t3ste;
float teste;
char teste[3];
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
