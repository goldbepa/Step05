%{
#include <stdio.h>
#include "../../COMMON_FILES/COMMON_H_FILES/util.h"
#include "../../COMMON_FILES/COMMON_H_FILES/errormsg.h"

#define alloca malloc

int yylex(void); /* function prototype */

void yyerror(char *s)
{
 EM_error(EM_tokPos, "%s", s);
}
%}


%union {
	int pos;
	int ival;
	float fval;
	string sval;
	}

%token INT
%token FLOAT
%token STRING
%token ID
%token COMMA
%token COLON
%token SEMICOLON
%token LPAREN
%token RPAREN
%token LBRACK
%token RBRACK
%token LBRACE
%token RBRACE
%token DOT
%token PLUS
%token MINUS
%token TIMES
%token DIVIDE
%token EQ
%token NEQ
%token LT
%token LE
%token GT
%token GE
%token AND
%token OR
%token ASSIGN
%token ARRAY
%token IF
%token THEN
%token ELSE
%token WHILE
%token FOR
%token TO
%token DO
%token LET
%token IN
%token END
%token OF 
%token BREAK
%token NIL
%token FUNCTION
%token VAR
%token TYPE 

%start program

%%

program:	E					{printf("Legal Expression\n");}

E:			ID ASSIGN INT		{printf("E --> ID = INT\n");}
			| LBRACE L RBRACE	{printf("E --> { L }\n");}

L:			E					{printf("L --> E\n");}
			| L SEMICOLON E		{printf("L --> L ; E\n");}

%%

	
