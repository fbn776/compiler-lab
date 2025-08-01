%{
    #include <stdio.h>
%}
%option noyywrap
%%
abc    {printf("ABC");}
.|\n    {printf("%s", yytext);}
%%
int main()
{
    yylex();
    return 0;
}
