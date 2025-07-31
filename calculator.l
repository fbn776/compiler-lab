%option noyywrap
%{
    int opcode = 0;
    float opnd1, opnd2, res;
    void calculate();
%}
num [0-9]+|[0-9]*"."[0-9]+
%%
{num} {calculate ();}
"+" {opcode=1;}
"-" {opcode=2;}
"*" {opcode=3;}
"/" {opcode=4;}
"\n" {printf("\n The result is %g\n", res);}
%%
void calculate()
{
    if(opcode==0)
    opnd1=atof(yytext);
    else
    {
        opnd2 = atof(yytext);
        res = (opcode==1)?(opnd1+opnd2):
        (opcode==2)?(opnd1-opnd2):
        (opcode==3)?(opnd1*opnd2):(opnd1/opnd2);
        opcode=0;
    }
}
int main()
{
    yylex();
    return 0;
}
