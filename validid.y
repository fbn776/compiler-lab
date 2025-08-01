%{
    #include <stdio.h>
    int yylex();
    int yyerror();
%}
%token id num nl
%left '+' '-'
%left '*' '/'
%left '(' ')'

%%
start : E '\n' {printf("Valid Arithmetic Expression\n"); return 0;}
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
    fprintf(stderr, "%s: Invalid Arithmetic Expression\n", m);
    return 0;
}
