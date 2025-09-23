%{
    #include "validid.tab.h"
%}
%option noyywrap
%%
[a-z_A-Z]    {return ALPHA;}
[0-9]    {return DIGIT;}
.    {return yytext[0];}
\n    {return '\n';}
%%
