%x comment1 comment2

%%
"/*" BEGIN(comment1);
<comment1>[^*]*
<comment1>\n 
<comment1>"*/" BEGIN(0);
"//" BEGIN(comment2);
<comment2>[^\n]
<comment2>\n {ECHO; BEGIN(0);}
.|\n ECHO;
%%
int yywrap(){return 1;}
void main(int argc, char* argv[])
{
	yyin=fopen(argv[1],"r");
    yyout=fopen(argv[2],"w");
	
	yylex();
	fclose(yyin);
	fclose(yyout);
    return;
}
