%{
#include <ctype.h>
%}

%%
[a-z]     { ECHO; printf(" -> %c\n", toupper(yytext[0])); }
.|\n      { ECHO; }  // Print all other characters as-is
%%

int main() {
    yylex();
    return 0;
}
