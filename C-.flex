%{                                                                                          
#include "C-.tab.h" 
extern int line_number;                                                                     
%}                                                                                          
%option noyywrap                                                                                 
 
%%   /* yytext-breaks up the raw character stream into "tokens"; patterns and actions are followed ; Keyword and Symbols*/
                                                                                     
"else"          { printf("----------FROM FLEX ELSE: %s ----------\n", yytext); return ELSE;  } 
"if"            { printf("----------FROM FLEX IF: %s ----------\n", yytext); return IF;  }
"int"           { printf("----------FROM FLEX INTEGER: %s ----------\n", yytext); return INTEGER;  }
"return"        { printf("----------FROM FLEX RETURN: %s ----------\n", yytext); return RETURN;  }                                                                                       
"void"          { printf("----------FROM FLEX VOID: %s ----------\n", yytext); return VOID;  }                  
"while"         { printf("----------FROM FLEX WHILE: %s ----------\n", yytext); return WHILE; } 

"+"             { printf("----------FROM FLEX PLUS: %s ----------\n", yytext);return PLUS;}   
"-"             { printf("----------FROM FLEX MINUS: %s ----------\n", yytext);return MINUS;} 
"*"             { printf("----------FROM FLEX MULTI: %s ----------\n", yytext);return MULTI;}   
"/"             { printf("----------FROM FLEX DIVI: %s ----------\n", yytext);return DIVI;} 
"<"             { printf("----------FROM FLEX LESSTHAN: %s ----------\n", yytext);return LESSTHAN;}
"<="            { printf("----------FROM FLEX LESSTHAN_OREQUAL: %s ----------\n", yytext);return LESSTHAN_OREQUAL;} 
">"             { printf("----------FROM FLEX GREATERTHAN: %s ----------\n", yytext);return GREATERTHAN;} 
">="            { printf("----------FROM FLEX GREATERTHAN_OREQUAL: %s ----------\n", yytext);return GREATERTHAN_OREQUAL;}
"=="            { printf("----------FROM FLEX EQUAL: %s ----------\n", yytext);return EQUAL;}
"!="            { printf("----------FROM FLEX NOTEQUAL: %s ----------\n", yytext);return NOTEQUAL;} 
"="             { printf("----------FROM FLEX ASSIGN: %s ----------\n", yytext);return ASSIGN;}
";"             { printf("----------FROM FLEX SCOLON: %s ----------\n", yytext);return SCOLON;}
","             { printf("----------FROM FLEX COMMA: %s ----------\n", yytext);return COMMA;} 
"{"             { printf("----------FROM FLEX LEFT_BRACE: %s ----------\n", yytext);return LEFT_BRACE;} 
"}"             { printf("----------FROM FLEX RIGHT_BRACE: %s ----------\n", yytext);return RIGHT_BRACE;}
"("             { printf("----------FROM FLEX LEFT_PARAN: %s ----------\n", yytext);return LEFT_PARAN;} 
")"             { printf("----------FROM FLEX RIGHT_PARAN: %s ----------\n", yytext);return RIGHT_PARAN;} 
"["             { printf("----------FROM FLEX LEFT_SQUARE_BRACKET: %s ----------\n", yytext);return LEFT_SQUARE_BRACKET;} 
"]"             { printf("----------FROM FLEX RIGHT_SQUARE_BRACKET: %s ----------\n", yytext);return RIGHT_SQUARE_BRACKET;} 



[a-zA-Z][a-zA-Z]*                           { printf("----------FROM FLEX IDENTIFIER: %s ----------\n", yytext); return IDENTIFIER; } 
[0-9][0-9]*                                 { printf("----------FROM FLEX NUM: %s ----------\n", yytext); return NUM; } 
[a-zA-Z]                                    { printf("----------FROM FLEX LETTER: %s ----------\n", yytext); } 
[0-9]                                       { printf("----------FROM FLEX DIGIT: %s ----------\n", yytext); } 
[ \t\r]+                                    /* neglecting the white spaces */                                                 
[\n]                                        { line_number++; }  
[/][*][^*]*[*]+([^*/][^*]*[*]+)*[/]         {printf("----------Here is COMMENT Section-line: %d ----------\n",line_number+1);}
.                                           {yyerror("----------Character Does not Belongs to C- language----------"); return 1;}
%%
