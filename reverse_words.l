%{
#include <stdio.h>
#include <string.h>

void reverse(char* str) {
    int len = strlen(str);
    for (int i = len - 1; i >= 0; i--)
        putchar(str[i]);
}
%}

%%
[a-zA-Z]+ {
    reverse(yytext);
    printf(" ");
}
[ \t\n]    { ECHO; } 
.          { ECHO; } 
%%

int main() {
    yylex();
    return 0;
}
