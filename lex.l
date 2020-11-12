%option noyywrap
%{
 #include <stdio.h>
 #include "y.tab.h"
%}

%%
(int)                   {return T_TYPE;}
(float)                 {return T_TYPE;}
(char)                  {return T_TYPE;}
[a-zA-Z_][a-zA-Z_]*     {return T_ID;}
;                       {return T_SEMICOLON;}
, {return T_COMMA;}
\n|\r                   /* ignore EOL */;
[ \t]+                  /* ignore whitespace */;
