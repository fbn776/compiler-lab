%{
    #include <stdio.h>
    int lines=0, words=0, chars=0;
%}

%option noyywrap

%%
[a-zA-Z]+    {words++; chars += yyleng;}
\n    {lines++; chars++;}
.    {chars++;}
%%

int main(int argc, char **argv) {
    yylex();
    printf("Lines : %d\n", lines);
    printf("Words : %d\n", words);
    printf("Characters : %d\n", chars);
    return 0;
}
