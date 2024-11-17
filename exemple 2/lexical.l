%{
#include "syntax.tab.h"
extern YYSTYPE yylval;
%}

%%

[a-zA-Z][a-zA-Z0-9]* { yylval.str = strdup(yytext); return ID; }
[0-9]+               { yylval.entier = atoi(yytext); return NUM; }
"="                  { return '='; }
";"                  { return ';'; }
[ \t\n]              { /* Ignorer les espaces */ }
.                    { printf("Caractère inattendu : %s\n", yytext); }

%%
int yywrap() { return 1; }
