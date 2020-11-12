%{

#include <stdio.h>
#include <stdlib.h>

extern int yylex();
extern int yyparse();
extern FILE* yyin;

void yyerror(const char* s);
%}

%token T_ID
%token T_TYPE
%token T_SEMICOLON
%token T_COMMA;


%%
program:
        declarationList
        ;
declarationList:
        declarationList declaration 
        | declaration
        ;
declaration:
        varDeclaration
        ;
varDeclaration:
        typeSecifier varDeclList T_SEMICOLON
        ;
varDeclList:
        varDeclList T_COMMA varDeclList
        | varDecInitialize
        ;
varDecInitialize:
        varDeclId
        ;
varDeclId:
        T_ID
        ;
typeSecifier:
        T_TYPE
        ;

%%

int main() {
	yyin = stdin;

	do {
		yyparse();
	} while(!feof(yyin));

	return 0;
}

void yyerror(const char* s) {
	fprintf(stderr, "Parse error: %s\n", s);
	exit(1);
}