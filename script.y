%{
    #include <stdio.h>
    #include <stdlib.h>
    #include <math.h>

    extern int yylex(void);
    extern char *yytext;
    void yyerror(char *s);
%}

%union{
    float real;
}


%start loop

%token <real> TKN_NUM 
%token TKN_ASIGN 
%token TKN_PTOCOMA
%token TKN_COMA
%token TKN_MULT
%token TKN_DIV 
%token TKN_MAS 
%token TKN_MENOS 
%token TKN_PAA 
%token TKN_PAC 
%token TKN_SEN 
%token TKN_COS
%token TKN_TAN
%token TKN_POW
%token TKN_SQRT
%token TKN_LN
%token TKN_UNOSOBREX
%token <real> TKN_ID 

%type <real> expresion

%left TKN_MAS TKN_MENOS 
%left TKN_MULT TKN_DIV
%left TKN_POW
%left TKN_SQRT
%left TKN_LN
%left TKN_UNOSOBREX

%%
    loop 
        : loop calculadora
        | calculadora
    ;

    calculadora 
        : TKN_ID { printf("%s = ",yytext);}   
        TKN_ASIGN expresion TKN_PTOCOMA {printf("%5.2f;\n", $4);};


    expresion 
        : TKN_NUM                            { $$ = $1; }
        | TKN_PAA expresion TKN_PAC          { $$ = $2; }
        | expresion TKN_MAS expresion        { $$ = $1 + $3; }
        | expresion TKN_MENOS expresion      { $$ = $1 - $3; }
        | expresion TKN_MULT expresion       { $$ = $1 * $3; }
        | expresion TKN_POW expresion        { $$ = pow($1,$3); }
        | expresion TKN_DIV expresion        { if($3 != 0){ $$ = $1 / $3; }}
        | TKN_SEN TKN_PAA expresion TKN_PAC  { $$ = sin($3); }
        | TKN_COS TKN_PAA expresion TKN_PAC  { $$ = cos($3); }
        | TKN_TAN TKN_PAA expresion TKN_PAC  { $$ = tan($3); }
        | TKN_LN TKN_PAA expresion TKN_PAC   { $$ = log($3); }
        | TKN_SQRT TKN_PAA expresion TKN_PAC { $$ = sqrt($3); }
        | TKN_UNOSOBREX TKN_PAA expresion TKN_PAC { $$ = 1 / $3; }
    ;
%%

void yyerror(char *s){
    printf("\n Error: %s\n",s);
}

int main(){
    yyparse();
    return 0;
}