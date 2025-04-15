%{
#include <stdio.h>
#include <string.h>

#define MAX 100
char stack[MAX];
int top = -1;

void push(char op) {
    stack[++top] = op;
}

char pop() {
    return (top == -1) ? '\0' : stack[top--];
}

int precedence(char op) {
    if (op == '+' || op == '-') return 1;
    if (op == '*' || op == '/') return 2;
    return 0;
}
%}

%%

[a-zA-Z0-9]+    { printf("%s ", yytext); } // operands
[+\-*/]         {
                    while (top != -1 && precedence(stack[top]) >= precedence(yytext[0])) {
                        printf("%c ", pop());
                    }
                    push(yytext[0]);
                }
\(              { push('('); }
\)              {
                    while (top != -1 && stack[top] != '(')
                        printf("%c ", pop());
                    if (top != -1) pop(); // pop '('
                }
\n              {
                    while (top != -1) printf("%c ", pop());
                    printf("\n");
                }

.               ; // ignore anything else

%%

int main() {
    printf("Enter infix expression:\n");
    yylex();
    return 0;
}
