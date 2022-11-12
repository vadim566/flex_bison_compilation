int lines=0;


%x line_jump


%%
"/n" BEGIN(line_jump);
<line_jump>[^.]* {lines++;}
<line_jump>.{fprintf(yyout,"%s",yytext);BEGIN(0);}
%%

int yywrap(){return 1;}
void main(int argc, char* argv[])
{
    if(argv[1] & argv[2]){

    
	yyin=fopen(argv[1],"r");
    yyout=fopen(argv[2],"w");
	
	yylex();
	fclose(yyin);
	fclose(yyout);
    }
    else
        fprintf(stdout,"missing in file or out file");
    return;
}
