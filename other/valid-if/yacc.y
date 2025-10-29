%{
        int yylex();
        int yyerror();
        #include<stdio.h>
%}
%token IF ELSE ID RELOP

%%
start: stmt '\n' {printf("Valid if-else statement\n"); return 0;}

stmt: IF '(' cond ')' block
 | IF '(' cond ')' block ELSE block
 | ID
 ;

cond: ID RELOP ID
 ;

block: '{' stmt_list '}'
     ;

stmt_list: stmt_list stmt
         |
         ;
%%

int main() {
        printf("Enter if_else statement: ");
        yyparse();
}

int yyerror() {
        printf("Invalid if-else statement\n");
        return 0;
}