%{
        #include "val_par.tab.h"
%}
%option noyywrap
%%
"(" {return '(';}
")" {return ')';}
"{" {return '{';}
"}" {return '}';}
"[" {return '[';}
"]" {return ']';}
\n  {return '\n';}
.   {return yytext[0];}
%%
