%{
    #include <stdio.h>
    int vows = 0, cons = 0;
%}
%option noyywrap
%%
[aeiouAEIOU]    {vows++;}
[a-zA-Z]    {cons++;}
.|\n    {printf("No. of Vowels: %d\nNo. of consonants: %d\n", vows, cons); return 0;}
%%
int main()
{
    yylex();
    //printf("No. of Vowels: %d\n", vows);
    //printf("No. of consonants: %d\n", cons);
    return 0;
}
