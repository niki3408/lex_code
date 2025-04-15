%{
#include <stdio.h>
#include <ctype.h>

int stack[100];
int top = -1;

void push(int val) {
    stack[++top] = val;
}

int pop() {
    return stack[top--];
}
%}

%%

[0-9]   {
            push(yytext[0] - '0');
        }

[+\-*/] {
            int b = pop();
            int a = pop();
            int result;
            switch(yytext[0]) {
                case '+': result = a + b; break;
                case '-': result = a - b; break;
                case '*': result = a * b; break;
                case '/': result = a / b; break;
            }
            push(result);
        }

\n      {
            printf("Result: %d\n", pop());
        }

.       ;

%%

int main() {
    printf("Enter postfix expression:\n");
    yylex();
    return 0;
}
