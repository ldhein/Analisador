/*Lucas Dhein*/
/*Definição do scanner Léxico.*/
/*Esse analisador foi feito e compilado em ambiente linux!*/
%{
#include "y.tab.h"
%}

%%
int|float|char          return BUILTIN;
"["                     return OPEN_SQ;  
"]"                     return CLOSE_SQ; 
","                     return COMMA;   
";"                     return SC; 
"if"			        return IF; 
"else" 			        return ELSE; 
[a-zA-Z_]+[a-zA-Z0-9_]  return ID;
[0-9]                   return DIGIT;
")"			            return CLOSE_PARENT; 
"("			            return OPEN_PARENT; 
"{"			            return OPEN_BRACE; 
"}"			            return CLOSE_BRACE; 
[=]			            return ATRIB;
(\+=)                   return ATRIB;
(\-=)                   return ATRIB;
(\*=)                   return ATRIB;
(\/=)                   return ATRIB;
\+			            return MATH; 
\-			            return MATH; 
\*			            return MATH; 
[/]			            return MATH; 
[<]			            return RELATIONAL; 
[>]			            return RELATIONAL; 
"=="			        return RELATIONAL;
"<="			        return RELATIONAL;
">="			        return RELATIONAL;
"!="			        return RELATIONAL;
\n                      ;
%%
