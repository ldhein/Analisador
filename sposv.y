%{
#include<stdio.h>
#include "y.tab.h"
%}

//Deinição dos tokens
%token INT
%token FLOAT
%token CHAR
%token ID
%token SC
%token COMMA
%token COLON
%token IF
%token ELSE
%token CLOSE_PARENT
%token OPEN_PARENT
%token CLOSE_BRACE
%token OPEN_BRACE
%token MATH
%token RELATIONAL
%token ATRIB
%token SWITCH
%token BREAK
%token DEFAULT
%token CASE
%token DIGIT_INT
%token DIGIT_FLOAT
%token STRING
%token OPEN_SQ
%token CLOSE_SQ
//Inicio da gramatica
%%
start:
        builtin SC
        |IF OPEN_PARENT condition CLOSE_PARENT OPEN_BRACE commands CLOSE_BRACE opt_else
        |SWITCH OPEN_PARENT ID CLOSE_PARENT OPEN_BRACE case_list opt_default CLOSE_BRACE
        ;
builtin:
        FLOAT float_dec
        |CHAR char_dec
        |INT int_dec
        ;

float_dec:        
        float_dec COMMA ID
        | ID
        | float_dec ID ATRIB DIGIT_FLOAT
        | ID ATRIB DIGIT_FLOAT
        ;

char_dec:
        char_dec COMMA ID 
        | ID
        | char_dec COMMA ID ATRIB STRING
        | ID ATRIB STRING
        | ID OPEN_SQ DIGIT_INT CLOSE_SQ ATRIB STRING
        ;

int_dec:
        int_dec COMMA ID 
        | ID
        | int_dec ID ATRIB DIGIT_INT
        | ID ATRIB DIGIT_INT
        ;

opt_else:
        |ELSE OPEN_BRACE commands CLOSE_BRACE
        ;

condition:
        target RELATIONAL target
        ;

target:
        ID
        |DIGIT_INT
        |DIGIT_FLOAT
        ;

commands:
        |ID ATRIB operation SC commands
        |ID ATRIB target SC commands
        |operation SC commands
        ;

operation:
        target MATH operation
        |target
        ;

case_list:
        CASE COLON OPEN_BRACE commands BREAK SC CLOSE_BRACE case2
        ;
case2:
        |CASE COLON OPEN_BRACE commands BREAK SC CLOSE_BRACE case3
        ;
case3:
        |CASE COLON OPEN_BRACE commands BREAK SC CLOSE_BRACE
        ;

opt_default:
        |DEFAULT COLON OPEN_BRACE commands CLOSE_BRACE
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