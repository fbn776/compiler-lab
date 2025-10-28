%{
        int maxlen = 0;
        char word[100];
        #include<stdio.h>
        #include<string.h>
%}
%option noyywrap
%%
[a-zA-Z]+ {if(strlen(yytext) > maxlen) {
                maxlen = strlen(yytext);
                strcpy(word,yytext);
           }
          }
\n {return 0;}
%%

int main() {
        printf("Enter the sentence : ");
        yylex();
        printf("Longest word is %s\t and its length is %d\n",word,maxlen);
}