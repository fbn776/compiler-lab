%{
    #include <stdio.h>
    int yylex();
    int yyerror();
%}
%token id num
%left '+' '-'
%left '*' '/'
%left '(' ')'

%%
start : E'\n' {printf("Valid Arithmetic Expression\n"); return 0;}
E : E '+' E
  | E '-' E
  | E '*' E
  | E '/' E
  | '('E')'
  | id
  | num
  ;
%%
int main()
{
    yyparse();
    return 0;
}
int yyerror(char *m)
{
    printf("Invalid Arithmetic Expression\n");
    return 0;
}
