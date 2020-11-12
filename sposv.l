%{
#include <stdio.h>
#include "y.tab.h"
%}

%%
int|float|char          return BUILTIN;
"["                     return OPEN_SQ;
"]"                     return CLOSE_SQ;
"="                     return EQ;
","                     return COMMA;
";"                     return SC;
[a-zA-Z_]+[a-zA-Z0-9_]  return ID;
[0-9]                   return DIGIT; 
\n                      return 0;
%%
