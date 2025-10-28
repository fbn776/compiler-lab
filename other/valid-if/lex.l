%{
        #include "if_else.tab.h"
%}
%option noyywrap
%%
"if" {return IF;}
"else" {return ELSE;}
"(" {return '(';}
")" {return ')';}
"{" {return '{';}
"}" {return '}';}
[a-zA-Z_][a-zA-Z0-9_]* {return ID;}
"=="|"!="|">"|"<"|">="|"<=" {return RELOP;}
\n  {return '\n';}
. {return yytext[0];}
%%