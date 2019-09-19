%option noyywrap nounput noinput

%{
#include <memory>
#include <string>
#include "meminfo.h"
#include "meminfo.tab.h"

%}

string          [a-zA-Z][A-Za-z0-9_()]+:
unit            kB
value           [0-9]+
linefeed        \n

%%

[\t\ ]+     ;
{linefeed}  { return LINEFEED; }
{string}    { yylval = std::make_unique<astNode>(std::string{yytext}); return STRING; }
{unit}      { return UNIT; }
{value}     { yylval = std::make_unique<astNode>((uint64_t)atoll(yytext)); return VALUE; }

%%
