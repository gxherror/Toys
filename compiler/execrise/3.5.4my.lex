%{
#include <string.h>
#include "y.tab.h"
int isVowel(char letter);
void yyerror(const char *msg);
char vowel[]={'a','e','i','o','u','A','E','I','O','U'};
%}

DELIM            [ \t]
TERNIMAL         [\n]
WORD             [a-zA-Z]+            

%%
{DELIM}         { printf(" "); }
{TERNIMAL}      { return Ternimal; }
{WORD}          {   
                    int len = strlen(yytext); 
                    if (isVowel(yytext[0])){
                        char tmp = yytext[0];
                        for (int i=0;i<len-1;++i){
                            yytext[i]=yytext[i+1];
                        }
                        yytext[len-1] = tmp;
                        yytext = strcat(yytext,"ay");
                        yylval = strdup(yytext);
                        //printf("%s",yytext);
                        return Vowel;
                    } 
                    else {
                        yytext = strcat(yytext,"ay");
                        yylval = strdup(yytext);
                        //printf("%s",yytext);
                        return Consonant;
                    } ;
                }
%%

int yywrap() {
	return 1;
}

int isVowel(char letter){
    if (strchr(vowel,letter)!=NULL) return 1;
    else return 0;
}

void yyerror(const char *msg) {
    printf("Error Heppen\n");
    exit(1);
}
