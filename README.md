## Analisador lexico sintático utilizando Flex/Bison e C. 
Esse analisador é capaz de reconher a declaração de uma variavel em linguagem C (dentro dos conformes da linguagem) e o seu tipo (int,float,char). É possível também reconhecer listas de declaraçãoes como por exemplo: int var1,var2,var3;
Para compilar e criar os arquivos necessários é preciso executar os seguintes comandos no terminal:
```
> $ flex lex.l*
> $ bison -d y.y*
> $ gcc y.tab.c lex.yy.c -o lex -lm*
> $ ./lex*
```
