%{
    #include <stdio.h>
    int yylex();
    int yyerror();
%}
%token ALPHA DIGIT
%%
start: S '\n'    {printf("Valid Identifier\n"); return 0;}
S : ALPHA A
  ;
A : ALPHA A
  | DIGIT A
  |
  ;
%%
int main()
{
    yyparse();
    return 0;
}
int yyerror(char *m)
{
    printf("Invalid Identifier\n");
}
