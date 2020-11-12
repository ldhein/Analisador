%{
#include<stdio.h>
#include "y.tab.h"
%}

%token BUILTIN
%token ID
%token OPEN_SQ
%token CLOSE_SQ
%token EQ
%token SC
%token COMMA
%token DIGIT

%%
start:
    BUILTIN varlist SC {printf(" valido \n");}
    | BUILTIN ID OPEN_SQ DIGIT CLOSE_SQ SC {printf(" valido \n");}
    | varlist: varlist COMMA ID | ID;
%%
int yywrap()
{
    return 1;
}

main()
{
    printf("\nEnter declaration: ");
    yyparse();
}

yyerror(char *s)
{
    fprintf(stderr,"%s\n",s);
}