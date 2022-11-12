/*
this code will echo line number on each line of the input text
*/
%{
    #include <assert.h>
	int line=1;
%}

%%
\n {line++; printf("\n%d:",line);}
. ECHO;
%%
int yywrap(){return 1;}
void main(int argc, char* argv[])
{
	yyin=fopen(argv[1],"r");
	assert(yyin);
    printf("1:");
	yylex();
	fclose(yyin);
	return;
}