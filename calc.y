%{
    #include <stdio.h>
    #define YYSTYPE double
    int yylex();
    int yyerror();
%}
%token NUM NL
%left '+' '-'
%left '*' '/'
%left '(' ')'
%right UMINUS
%%
ln: e NL {printf("=%f\n", $1); return 0;}
e: e '+' e {$$=$1+$3;}
 | e '-' e {$$=$1-$3;}
 | e '*' e {$$=$1*$3;}
 | e '/' e {$$=$1/$3;}
 | '-' e %prec UMINUS {$$=-$2;}
 | '(' e ')' {$$ = $2;}
 | NUM {$$=$1;}
%%
int main()
{
    yyparse();
    return 0;
}
int yyerror(char *m)
{
    fprintf(stderr, "%s: Invalid Expression\n", m);
    return 0;
}
