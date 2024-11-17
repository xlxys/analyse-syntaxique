%{
#include <stdio.h>
#include <stdlib.h>
%}

%union {
    int entier;
    char* str;
}

%token <entier> NUM
%token <str> ID

%%
program:
    stmt_list { printf("Programme syntaxiquement correct.\n"); }
    ;

stmt_list:
    stmt_list stmt
    | stmt
    ;



stmt:
    ID '=' NUM ';' {
        printf("Affectation : %s = %d\n", $1, $3);
    }
    ;
%%
int yyerror(char *msg) {
    fprintf(stderr, "Erreur syntaxique : %s\n", msg);
    return 0;
}
int main() {
    return yyparse();
}
