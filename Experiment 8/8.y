%{
    #include "8.h"
    int yyerror(char *);
    int yylex();
    ASTNode *root=NULL;
%}
%union
{
    int INT;
    ASTNode *ptr;
}
%token <INT> NUMBER
%token NL

%left '+' '-'
%left '*' '/'
%left '(' ')'

%%
stmt : expr NL    {root=$<ptr>1;return 0;}
expr : expr'+'expr    {$<ptr>$=make_node('+',$<ptr>1,$<ptr>3);}
     | expr'-'expr    {$<ptr>$=make_node('-',$<ptr>1,$<ptr>3);}
     | expr'*'expr    {$<ptr>$=make_node('*',$<ptr>1,$<ptr>3);}
     | expr'/'expr    {$<ptr>$=make_node('/',$<ptr>1,$<ptr>3);}
     | NUMBER    {$<ptr>$=make_leaf($<INT>1);}
     ;
%%
int main()
{
    yyparse();
    printf("\nThe generated AST(post order traversal) is : \n\n");
    print_ast(root);
    printf("\n");
    return 0;
}
int yyerror(char *msg)
{
    fprintf(stderr, "%s\n", msg);
    return 0;
}
