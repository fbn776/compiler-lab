%option noyywrap
%{
    #define YYSTYPE double
    #include "calc.tab.h"
%}
%%
([0-9]+)|([0-9]*\.[0-9]+) {yylval=atof(yytext);return NUM;}
\n {return NL;}
. {return yytext[0];}
%%
