//=======================================
// Matt Kretchmar
// October 2025
// main_strlen.c
// A main function to call strlen
//=======================================

#include <stdio.h>

int 	strlen2 ( char * );

int main ( void )
{
	char buffer[100];
	int n;
	
	printf("Enter a string: ");
	fgets(buffer,100,stdin);
	
	n = strlen2(buffer);
	printf("String length: %d\n",n);
	return 0;
}

/*
int strlen(char *s) {

	if (*s ==0 ) {
		return 0;
	}
	else {
		return 1 + strlen(s+1);
	}
		
}
*/