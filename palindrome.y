%{
#include <stdio.h>
int yyerror(char *s);
int yylex();
%}

%token CHAR

%%
input:
    palindrome '\n'   { printf("Palindrome\n"); return 0; }
  | '\n'              { printf("Empty input\n"); return 0; }
  ;

palindrome:
      /* empty */
    | CHAR
    | CHAR palindrome CHAR {
        if ($1 != $3) yyerror("Not a palindrome");
    }
  ;
%%

int yyerror(char *s) {
    printf("%s\n", s);
    return 0;
}

int main() {
    printf("Enter a string: ");
    yyparse();
    return 0;
}
