//https://pandolia.net/tinyc/ch13_bison.html
//S Ternimal         {printf("\nFINISH");}         
//    |  S E  
%{
#include <stdio.h>
#include <stdlib.h>
void yyerror(const char*);
#define YYSTYPE char *
%}

%token Consonant Vowel Ternimal

%%

S   :   E Ternimal
    ;

E   :   
    |   Consonant E         {printf("Consonant: %s\n",$1);}
    |   Vowel E             {printf("Vowel: %s\n",$1);}  
    |   Consonant           {printf("Consonant: %s\n",$1);}
    |   Vowel               {printf("Vowel: %s\n",$1);}      
    ;
%%

int main() {
    return yyparse();
}