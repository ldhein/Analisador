/*Lucas Dhein*/
/*Definição do scanner Léxico.*/
%{
#include "y.tab.h"
extern int yyparse();
extern int yyerror();
%}

%%
"int"|"float"|"char"         {printf("[TYPE]\n");return TYPE;}
"if"			             {printf("[IF]\n");return IF;}
"else" 			             {printf("[ELSE]\n");return ELSE;}
"switch"                     {printf("[SWITCH]\n");return SWITCH;}
"break"                      {printf("[BREAK]\n");return BREAK;}
"default"                    {printf("[DEFAULT]\n");return DEFAULT;}
"case"                       {printf("[CASE]\n");return CASE;}
"while"                      {printf("[WHILE]\n");return WHILE;}
"for"                        {printf("[FOR]\n");return FOR;}
"++"                         {printf("[INCRE_DEC_OPERATOR]\n");return INCRE_DEC_OPERATOR;}
"--"                         {printf("[INCRE_DEC_OPERATOR]\n");return INCRE_DEC_OPERATOR;}
"["                          {printf("[OPEN_SQ]\n");return OPEN_SQ;}
"]"                          {printf("[CLOSE_SQ]\n");return CLOSE_SQ;}
","                          {printf("[COMMA]\n");return COMMA;}
";"                          {printf("[SC]\n");return SC;}
":"                          {printf("[COLON]\n");return COLON;}
")"			                 {printf("[CLOSE_PARENT]\n");return CLOSE_PARENT;}
"("			                 {printf("[OPEN_PARENT]\n");return OPEN_PARENT;}
"{"			                 {printf("[OPEN_BRACE]\n");return OPEN_BRACE;}
"}"			                 {printf("[CLOSE_BRACE]\n");return CLOSE_BRACE;}
[=]			                 {printf("[ATRIB]\n");return ATRIB;}
(\+=)                        {printf("[ATRIB]\n");return ATRIB;}
(\-=)                        {printf("[ATRIB]\n");return ATRIB;}
(\*=)                        {printf("[ATRIB]\n");return ATRIB;}
(\/=)                        {printf("[ATRIB]\n");return ATRIB;}
\+			                 {printf("[MATH]\n");return MATH;}
\-			                 {printf("[MATH]\n");return MATH;}
\*			                 {printf("[MATH]\n");return MATH;}
[/]			                 {printf("[MATH]\n");return MATH;}
[<]			                 {printf("[RELATIONAL]\n");return RELATIONAL;}
[>]			                 {printf("[RELATIONAL]\n");return RELATIONAL;}
"=="			             {printf("[RELATIONAL]\n");return RELATIONAL;}
"<="			             {printf("[RELATIONAL]\n");return RELATIONAL;}
">="			             {printf("[RELATIONAL]\n");return RELATIONAL;}
"!="			             {printf("[RELATIONAL]\n");return RELATIONAL;}
['][a-zA-Z]{1}[']            {printf("[CARACTERE]\n");return CARACTERE;}
[a-zA-Z_]+[a-zA-Z0-9_]*      {printf("[ID]\n");return ID;}
[0-9]{1,6}                   {printf("[DIGIT_INT]\n");return DIGIT_INT;}
[0-9]{1,6}[.][0-9]{0,6}      {printf("[DIGIT_FLOAT]\n");return DIGIT_FLOAT;}
["'].{1,10}["']              {printf("[STRING]\n");return STRING;}
[" "\n\t]+                   ;
[.]*                         return -1;
%%
