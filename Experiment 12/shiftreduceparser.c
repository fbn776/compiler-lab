#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define NUMPROD 6	//maximum production nos
#define MAXPRODLEN 10	//maximum production length
#define MAX 50		//size of value and input string

char productions[NUMPROD][MAXPRODLEN] = {"E=E+E", "E=E*E", "E=i", "E=(E)", "E=E-E", "E=E/E"};	//define productions
char *ptr_prod = &productions[0][0];	//ptr to production table
char input[MAX] = {0}, stack[MAX] = {0};
short top = -1, ip_ptr = 0; 		//ptr to top of stack and input string

void shift(char symb);
void reduce(int prodno, char *stackpos);

int main()
{
    printf("Enter the string to be parsed: ");
    scanf("%[^\n]", input);
    getchar();				//remove extra new line
    printf("\nSHIFT-REDUCE-PARSING\n");
    printf("STACK\t\tINPUT\t\tACTION\n");
    printf("-----\t\t-----\t\t------\n");
    while(input[ip_ptr] != '\0')
    {
	shift(input[ip_ptr++]);
        for(int j=0; j < NUMPROD; j++)	//continuously reduce
	{
	    for(int i=0; i < NUMPROD; i++)
            {
		//finding the begining of the handle in the stack
		char *pos = strstr(stack, (ptr_prod + i * MAXPRODLEN + 2));
		if(pos != NULL)
		{
		    reduce(i, pos);
		}
            }
	}
    }
    //after input is finished
    if(top == 0 &&  stack[top] == 'E')
    {
        printf("Input accepted\n");
    }
    else
    {
	printf("Input rejected\n" );
    }
}

void shift(char c)
{
    stack[++top] = c;
    printf("%s\t\t%s\t\tShifted %c to stack\n", stack, (input + ip_ptr), c);
}

void reduce(int prodno, char *stackpos)
{
    int len = strlen(stackpos);
    top -= len;
    bzero((stack + top + 1), len);
    stack[++top] = productions[prodno][0];
    printf("%s\t\t%s\t\tReduced by the production %s\n", stack, (input + ip_ptr), productions[prodno]);
}
