/*
this code will echo line number on each line of the input text
*/
%{
    #include <assert.h>
	int line=1;
%}

%%
\n {line++; 
        if(line%2)fprintf(yyout,"\n%d.",line/2+1);}
. ECHO;
%%
int yywrap(){return 1;}
void main(int argc, char* argv[])
{
	yyin=fopen(argv[1],"r");
	assert(yyin);

    if (argv[2])
        yyout=fopen(argv[2],"w");
    else
        yyout=stdout;
    fprintf(yyout,"1:");
	yylex();
	fclose(yyin);
     if (argv[2])
        fclose(yyout);
	return;
}