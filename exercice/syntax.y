%{
#include <stdio.h>
#include <stdlib.h>
%}

/* %union {
    int entier;
    char* str;
} */

// Déclaration des tokens
%token INT ID NUM IF ELSE WHILE


// Définir l'axiome
%start program

%%

program:
    decl_list stmt_list { printf("Programme syntaxiquement correct.\n"); }
    ;

decl_list:
    decl_list decl
    | decl
    ;

decl:
    INT id_list ';'
    ;

id_list:
    id_list ',' ID
    | ID
    ;

stmt_list:
    stmt_list stmt
    | stmt
    ;

stmt:
    ID '=' expr ';'
    | IF '(' cond ')' stmt ELSE stmt
    | WHILE '(' cond ')' stmt
    | '{' stmt_list '}'
    ;

expr:
    expr '+' term
    | expr '-' term
    | term
    ;

term:
    term '*' factor
    | term '/' factor
    | factor
    ;

factor:
    NUM
    | ID
    | '(' expr ')'
    ;

cond:
    expr '>' expr
    | expr '<' expr
    | expr '==' expr
    | expr '!=' expr
    ;

%%
int main() {
    yyparse();
    return 0;
}

int yyerror(char *s) {
    fprintf(stderr, "Erreur syntaxique : %s\n", s);
    return 0;
}