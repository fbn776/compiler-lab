%{
        #include "val_dec.tab.h"
%}
%option noyywrap
%%
"int"|"float"|"char"  {return TYPE;}
[0-9]+ {return NUM;}
[a-zA-Z_][a-zA-Z0-9_]* {return ID;}
"=" {return EQ;}
"," {return ',';}
";" {return ';';}
[ \t]+ ;
\n {return '\n';}
. {return yytext[0];}
%%
