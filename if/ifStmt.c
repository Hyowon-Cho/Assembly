//===============================================
// Matt Kretchmar
// October 2025
// ifStmt.c
// This program tests if statements 
//==============================================

#include <stdio.h>

// externally defined function
int foo (int a, int b);

int main ( void )
{
	int a, b;
	
	printf("Enter hex a: ");
	scanf("%x",&a);
	printf("Enter hex b: ");
	scanf("%x",&b);

	int c = foo(a,b);
	printf("c = 0x%08X\n",c);
	
	return 0;
}



