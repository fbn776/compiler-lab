%{
        int yylex();
        int yyerror();
        #include<stdio.h>
%}
%token WORD AT DOT

%%
input: email '\n' {printf("Valid email address\n"); return 0;}

email: WORD AT WORD DOT WORD
     ;
%%

int main() {
        printf("Enter email id: ");
        yyparse();
}

int yyerror() {
        printf("Invalid email id\n");
}