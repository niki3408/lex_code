%{
#include <stdio.h>
#include <string.h>

char smallest[100] = "";
int first_word = 1;
%}

%%
[a-zA-Z]+ {
    if (first_word || strlen(yytext) < strlen(smallest)) {
        strcpy(smallest, yytext);
        first_word = 0;
    }
}
.|\n ; // Ignore all non-word characters
%%

int main() {
    yylex();
    if (!first_word)
        printf("Smallest word: %s\n", smallest);
    return 0;
}
