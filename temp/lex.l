%option noyywrap
%{
#include "y.tab.h"
#include <stdio.h>
%}
%%
[a-zA-Z0-9_]+ { return ID_LOCAL; }
[a-zA-Z0-9-]+ { return ID_DOMAIN; }
\.            { return DOT; }
@             { return AT; }
\n            { return NEWLINE; }
[ \t]+        { /* Skip whitespace */ }
.             { fprintf(stderr, "Lexical error: Invalid character '%s'\n", yytext); return *yytext; }
%%
