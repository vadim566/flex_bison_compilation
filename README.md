# flex_bison_compilation
translation compilation using flex and bison

## Installation WIN users(use powershell/gitbash admin mode)
1. Download chocolate using powershell in windows in the link
```bash
https://chocolatey.org/install
```
or use the script can be changed better use the one in the link
```bash
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
```
2. install cygwin32 using terminal (git bash/powershell)
```bash
choco install cygwin
```
3.install flex using terminal
```bash
choco install winflexbison
```

## Create First app
1. use vim using git_bash or notepad and name it flex_1
```bash
%{
	#include <assert.h>
%}

%%
. ECHO;
%%
int yywrap(){return 1;}
void main(int argc, char* argv[])
{
	yyin=fopen(argv[1],"r");
	assert(yyin);
	yylex();
	fclose(yyin);
	return;
}
```
2.create another file contains, name the file test_1.txt
```bash
line 1
line 2
line 3
```
3. open terminal (continue only if there is no errors)
```bash
flex flex_1.txt
```
4.use gcc and compile the new file created - lex.yy.c
```bash
gcc lex.yy.c
```
5.run a.exe using test_1.txt  and it should output the following
```bash
$ ./a test_file.txt 
line 1
line 2
line 3
```
![image](https://user-images.githubusercontent.com/7335823/201414565-3bb7a712-1c26-42c7-b207-1fe51a13f600.png)



 
