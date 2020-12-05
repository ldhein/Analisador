/*Lucas Dhein*/
/*Analisador Sintático*/
%{
#include<stdio.h>
#include "y.tab.h"
int yylex();
int yyerror(char *);
FILE *yyin;
%}

//Deinição dos tokens
%token TYPE
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
%token WHILE;
%token FOR;
%token INCRE_DEC_OPERATOR;
%token CARACTERE;

//Inicio da gramatica
%%
start:
        |TYPE builtin SC {printf("MATCH REGRA #1\n");} start
        |IF OPEN_PARENT condition CLOSE_PARENT OPEN_BRACE commands CLOSE_BRACE opt_else {printf("MATCH REGRA #2\n");} start
        |SWITCH OPEN_PARENT ID CLOSE_PARENT OPEN_BRACE case_list opt_default CLOSE_BRACE {printf("MATCH REGRA #3\n");} start
        |WHILE OPEN_PARENT condition CLOSE_PARENT OPEN_BRACE commands CLOSE_BRACE {printf("MATCH REGRA #4\n");} start
        |FOR OPEN_PARENT ini_variable SC condition SC ID INCRE_DEC_OPERATOR CLOSE_PARENT OPEN_BRACE commands CLOSE_BRACE {printf("MATCH REGRA #5\n");} start
        ;

builtin:
        ID
        |builtin COMMA ID
        |ID OPEN_SQ DIGIT_INT CLOSE_SQ
        |builtin ID OPEN_SQ DIGIT_INT CLOSE_SQ
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
        ID ATRIB operation SC
        |ID ATRIB operation SC commands
        ;

operation:
        target MATH target
        |target
        ;

case_list:
        CASE case_option COLON OPEN_BRACE commands BREAK SC CLOSE_BRACE case2
        |CASE case_option COLON case2
        ;
case2:
        |CASE case_option COLON OPEN_BRACE commands BREAK SC CLOSE_BRACE case3
        |CASE case_option COLON case3
        ;
case3:
        |CASE case_option COLON OPEN_BRACE commands BREAK SC CLOSE_BRACE
        ;

case_option:
        DIGIT_INT
        |CARACTERE
        ;
opt_default:
        |DEFAULT COLON OPEN_BRACE commands CLOSE_BRACE
        ;

ini_variable:
        ID ATRIB ID
        |ID ATRIB DIGIT_INT
        ;
%%

//Incio dos comandos em C
int yywrap()
{
    return 1;
}

int main(int argc,char **argv)
{
        yyin=fopen(argv[1],"r");
        yyparse();
        fclose(yyin);
}

int yyerror(char *s)
{
        fprintf(stderr,"INVALIDO\n");
        return -1;

}