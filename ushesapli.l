%{
	#include<math.h>
	#include"y.tab.h"
%}
%%

[0-9]+|[0-9]*\.[0-9]+ { 	
			yylval.yac = atof(yytext);
	 		return num; //return 
	 	       }
 /* trigonometrik kurallar */
sin {return SIN;} 
cos {return COS;} 
tan return TAN;     
log return LOG;

[\t];
\n 	      return 0;
.             return yytext[0];
%%
