DIGIT [0-9]
%%
0|[1-9]{DIGIT}* {fprintf(yyout,"\nInteger:%s",yytext);}
0"."{DIGIT}+ |[1-9]{DIGIT}*"."{DIGIT}+ {fprintf(yyout,"\nReal:%s",yytext);}
"*"|"-"|"="|"/"|"+" {fprintf(yyout,"\nOperator:%s",yytext);}
\n
. {fprintf(yyout,"\nNot Valid:%s",yytext);}
%%

int yywrap(){return 1;}
void main(int argc , char* argv[])
{
    yyin=fopen(argv[1],"r");
    if(argv[2])
    yyout=fopen(argv[2],"w");
    else yyout=stdout;
    yylex();
    fclose(yyin);
    fclose(yyout);
}