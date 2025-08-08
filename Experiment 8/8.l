%option noyywrap
%{
    #include "8.h"
    #include "8.tab.h"
%}
%%
[0-9]+    {yylval.INT=atoi(yytext);return NUMBER;}
\n    {return NL;}
[ \t]+    ;
.    {return yytext[0];}
%%
