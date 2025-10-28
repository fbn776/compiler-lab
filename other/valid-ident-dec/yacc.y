%{
        int yylex();
        int yyerror();
        #include<stdio.h>
%}
%token TYPE ID NUM EQ
%%
start: S '\n' {printf("Valid Declaration\n"); return 0;}
S: TYPE L ';'
 | TYPE L EQ NUM ';'
 ;

L: L ',' ID
 | ID
 ;
%%

int main() {
        printf("Enter the variable declaration: ");
        yyparse();
        return 0;
}

int yyerror() {
        printf("Invalid declaration\n");
        return 0;
}