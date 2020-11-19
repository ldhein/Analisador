%{
#include<stdio.h>
#include "y.tab.h"
%}
//Deinição dos tokens
%token BUILTIN
%token ID
%token OPEN_SQ
%token CLOSE_SQ
%token SC
%token COMMA
%token DIGIT
%token IF
%token ELSE
%token CLOSE_PARENT
%token OPEN_PARENT
%token CLOSE_BRACE
%token OPEN_BRACE
%token MATH
%token RELATIONAL
%token ATRIB
//Inicio da gramatica

%%
start:
    BUILTIN varlist SC
    | BUILTIN ID OPEN_SQ DIGIT CLOSE_SQ SC
    | IF OPEN_PARENT condition CLOSE_PARENT OPEN_BRACE commands CLOSE_BRACE opt_else
    ;
varlist: 
    varlist COMMA ID 
    | ID
    ;
    
opt_else:
        |ELSE OPEN_BRACE commands CLOSE_BRACE
        ;

condition:
        target RELATIONAL conditional_list
        ;

conditional_list:
        conditional_list RELATIONAL target
        | target
        ;
target:
        ID
        |DIGIT
        ;

commands:
        |ID ATRIB operation SC commands
        |ID ATRIB target SC commands
        |operation SC
        ;

operation:
        |target MATH operation
        |target
        ;
%%

//Incio dos comandos em C
int ylex();
int yywrap()
{
    return 1;
}

main()
{
   return(yyparse());
}

int yyerror(char *s)
{
    fprintf(stderr,"%s, INVALIDO\n",s);
}
