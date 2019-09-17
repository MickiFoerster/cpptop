%option noyywrap

%{
#include <string>
#include "parser.tab.h"

long long val;
std::string str;

%}

identifier          [a-z_-]+
value           [0-9]+

%%

[\t\ ]+         ;
\n              ;
{identifier}    { str = std::string{yytext}; return STRING; }
{value}         { val = atoll(yytext); return VALUE; }

%%
