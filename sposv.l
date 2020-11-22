/*Lucas Dhein*/
/*Definição do scanner Léxico.*/
/*Esse analisador foi feito e compilado em ambiente linux!*/
%{
#include "y.tab.h"
%}

%%
"int"                        return INT;
"float"                      return FLOAT;
"char"                       return CHAR;
"if"			             return IF; 
"else" 			             return ELSE;
"switch"                     return SWITCH;
"break"                      return BREAK;
"default"                    return DEFAULT;
"case"[1|2|3]                return CASE;
"["                          return OPEN_SQ;  
"]"                          return CLOSE_SQ; 
","                          return COMMA;   
";"                          return SC;
":"                          return COLON;
[a-zA-Z_]+[a-zA-Z0-9_]       return ID;
[+-]?[0-9]{1,6}              return DIGIT_INT;
[+-]?[0-9]{1,6}[.][0-9]{0,6} return DIGIT_FLOAT;
["'].{1,10}["']              return STRING;
")"			                 return CLOSE_PARENT; 
"("			                 return OPEN_PARENT; 
"{"			                 return OPEN_BRACE; 
"}"			                 return CLOSE_BRACE; 
[=]			                 return ATRIB;
(\+=)                        return ATRIB;
(\-=)                        return ATRIB;
(\*=)                        return ATRIB;
(\/=)                        return ATRIB;
\+			                 return MATH; 
\-			                 return MATH; 
\*			                 return MATH; 
[/]			                 return MATH; 
[<]			                 return RELATIONAL; 
[>]			                 return RELATIONAL; 
"=="			             return RELATIONAL;
"<="			             return RELATIONAL;
">="			             return RELATIONAL;
"!="			             return RELATIONAL;
\n                          ;
%%
