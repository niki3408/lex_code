%{
#include <stdio.h>
#include <math.h>
int binary_to_decimal(char *binary) {
    int result = 0;
    for (int i = 0; binary[i] != '\0'; i++) {
        result = result * 2 + (binary[i] - '0');
    }
    return result;
}
%}

%%
[01]+    {
            int dec = binary_to_decimal(yytext);
            printf("Binary: %s -> Decimal: %d\n", yytext, dec);
         }
.|\n     ; // Ignore other characters
%%

int main() {
    printf("Enter binary numbers:\n");
    yylex();
    return 0;
}
