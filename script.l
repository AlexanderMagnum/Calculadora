%{
    #include <stdio.h>
    #include <stdlib.h>
    #include "script.tab.h"
%}


NUM             [0-9]+("."[0-9]+)? 
SEPARADOR       ([ \t])+
PTOCOMA         ";" 
MAS             "+" 
MENOS           "-"
POW             "^"
MULT            "*"
DIV             "/" 
SEN             "sen"
COS             "cos"
TAN             "tan"
RAIZ            "sqrt"
LN              "ln"
unosobrex       "unosobrex"
PAA             "(" 
PAC             ")" 
ASIGN           "="
ID              [a-zA-z][a-zA-Z0-9]* 
SL              [\n]


%%

{NUM}               { yylval.real = atof(yytext); return TKN_NUM;}
{SEPARADOR}         { }
{PTOCOMA}           {return TKN_PTOCOMA;}
{MAS}               {return TKN_MAS;}
{MENOS}             {return TKN_MENOS;}
{MULT}              {return TKN_MULT;} 
{DIV}               {return TKN_DIV;}
{SEN}               {return TKN_SEN;}
{COS}               {return TKN_COS;}
{TAN}               {return TKN_TAN;}
{POW}               {return TKN_POW;}
{RAIZ}              {return TKN_SQRT;}
{LN}                {return TKN_LN;}
{unosobrex}         {return TKN_UNOSOBREX;}
{PAA}               {return TKN_PAA;} 
{PAC}               {return TKN_PAC;}
{ASIGN}             {return TKN_ASIGN;}
{ID}                {return TKN_ID;}
{SL}

%%