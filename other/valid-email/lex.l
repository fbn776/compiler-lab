%{
    #include "valid_email.tab.h"
%}
%option noyywrap
%%
[a-zA-Z_][a-zA-Z0-9_]*     {return WORD;}
"@"               {return AT;}
"."               {return DOT;}
\n                {return '\n';}
[ \t]+            ;
.                 {return yytext[0];}
%%
