%option noyywrap nounput noinput

%{
#include <memory>
#include <string>
#include "yystype.h"
#include "parser.tab.h"

%}

identifier      [a-z][a-z_]+[0-9]*
value           [0-9]+
linefeed        \n

%%

[\t\ ]+         ;
{linefeed}      { return LINEFEED; }
{identifier}    { yylval = std::make_unique<astNode>(std::string{yytext}); return STRING; }
{value}         { yylval = std::make_unique<astNode>((uint64_t)atoll(yytext)); return VALUE; }

%%
