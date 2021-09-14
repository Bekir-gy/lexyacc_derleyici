%{
	#include <stdio.h>
	#include <math.h>
	int yyparse();


%}
%union
{ double yac;}
%token<yac>num
%token SIN COS TAN LOG 



%left '+''-'
%left '*''/'
%right '^'/*sagdan birleşmeli öncelik üssün*/
%nonassoc uminu
%type<yac>exp
%%


ss: exp {printf(" İŞLEMİN SONUCU =%g\n" ,$1);}

exp :exp'+'exp  { $$=$1+$3; }
|exp'-'exp  { $$=$1-$3; }
|exp'*'exp  { $$=$1*$3; }
|exp'-'exp  { if($3==0)
printf("sıfıra bolum durumu");
else 
$$=$1/$3;
}
|exp'^'exp  {$$=pow($1,$3);} 	
|'-'exp        {$$=-$2;}
|SIN'('exp')'  {$$=sin($3);}
|COS'('exp')'  {$$=cos($3);}
|TAN'('exp')'  {$$=tan($3);}
|LOG'('exp')'  {$$=log($3);}
|num;
|'('exp')'	{$$=-$2;}
       
%%
void main()
{
	do
	{
		printf("\n işlem girmeniz bekleniyor :");
		yyparse();
	}while(1);
}

void yyerror(char *s;)
{
	printf("SYNTAX error");
}
        
      
