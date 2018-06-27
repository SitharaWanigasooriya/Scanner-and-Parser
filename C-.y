%{                                                                                   
   #include <stdarg.h> 
   #include <stdio.h> 
   #include "C-_shared.h"                                                        
   #define YYSTYPE char *   
   void yyerror(char const *s){
     fprintf(stderr, "line %d:----------- %s---------\n", line_number, s);
   }
   int yylex();                                                         
   int yydebug=0;                                                                    
   int indent=0;                                                                     
   char *iden_dum;                                                                   
%}   

/* token declaration*/                                                                                
%token IF                                                                         
%token ELSE                                                                           
%token INTEGER
%token RETURN
%token VOID
%token WHILE

%token PLUS
%token MINUS
%token MULTI
%token DIVI
%token LESSTHAN
%token LESSTHAN_OREQUAL
%token GREATERTHAN
%token GREATERTHAN_OREQUAL
%token EQUAL
%token NOTEQUAL
%token ASSIGN
%token SCOLON
%token COMMA
%token LEFT_BRACE
%token RIGHT_BRACE
%token LEFT_PARAN
%token RIGHT_PARAN
%token LEFT_SQUARE_BRACKET
%token RIGHT_SQUARE_BRACKET


%token IDENTIFIER
%token NUM
 
%% 
/* Grammar rules and actions follow */ 

program: 
declaration-list;

declaration-list: 
declaration-list declaration | declaration;

declaration: 
var-declaration | fun-declaration;

var-declaration: 
type-specifier IDENTIFIER SCOLON | type-specifier IDENTIFIER LEFT_SQUARE_BRACKET NUM RIGHT_SQUARE_BRACKET SCOLON;

type-specifier: 
INTEGER | VOID;

fun-declaration: 
type-specifier IDENTIFIER LEFT_PARAN params RIGHT_PARAN compound-stmt;

params: 
param-list | VOID;

param-list:
param-list COMMA param | param;

param: 
type-specifier IDENTIFIER | type-specifier IDENTIFIER LEFT_SQUARE_BRACKET RIGHT_SQUARE_BRACKET;

compound-stmt: 
LEFT_BRACE local-declarations statement-list RIGHT_BRACE;

local-declarations: 
local-declarations var-declaration | %empty;

statement-list: 
statement-list statement | %empty;

statement: 
expression-stmt | compound-stmt | selection-stmt | iteration-stmt | return-stmt;

expression-stmt: 
expression SCOLON | SCOLON;

selection-stmt: 
IF LEFT_PARAN expression RIGHT_PARAN statement | IF LEFT_PARAN expression RIGHT_PARAN statement ELSE statement;

iteration-stmt: 
WHILE LEFT_PARAN expression RIGHT_PARAN statement;

return-stmt: 
RETURN SCOLON | RETURN expression SCOLON;

expression: 
var ASSIGN expression | simple-expression;

var: 
IDENTIFIER | IDENTIFIER LEFT_SQUARE_BRACKET expression RIGHT_SQUARE_BRACKET;

simple-expression: 
additive-expression relop additive-expression | additive-expression;

relop: 
LESSTHAN | LESSTHAN_OREQUAL | GREATERTHAN | GREATERTHAN_OREQUAL | EQUAL | NOTEQUAL;

additive-expression: 
additive-expression addop term | term;

addop: 
PLUS | MINUS;

term:
term mulop factor | factor;

mulop: 
MULTI | DIVI;

factor: 
LEFT_PARAN expression RIGHT_PARAN | var | call | NUM;

call: 
IDENTIFIER LEFT_PARAN args RIGHT_PARAN;

args: 
arg-list | %empty;

arg-list:
arg-list COMMA expression | expression;
                                                                                   
%% 

 #include <stdio.h>
                                                                                  
 
int main ()                                                                              
{                                                                                    
  if (yyparse ()==0){
    printf("Valid Syntax");
    return 0;
  }
  else{
    printf("Not Valid");
    return 1;
  }                                                                        
}
