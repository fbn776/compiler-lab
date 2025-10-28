%{
        int yylex();
        int yyerror();
        #include<stdio.h>
%}
%%
start: S '\n' {printf("Valid Parentheses\n"); return 0;}

S: '('S')'S
 | '{'S'}'S
 | '['S']'S
 |
 ;
%%

int main() {
        printf("Enter parantheses: ");
        yyparse();
}

int yyerror() {
        printf("Invalid Parantheses\n");
        return 0;
}