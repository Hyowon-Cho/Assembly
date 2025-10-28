//====================================
// Matt Kretchmar
// October 2025
// main_str.c
// This function reads and stores a string, then calls
// function foo(s) on it.  Prints
// the results
//====================================

#include <stdio.h>

void foo ( char * );

int main ( void )
{
    char buffer[100];
    printf("Enter a string: ");
    //scanf("%s\n",buffer);
    fgets(buffer,100,stdin);
    foo(buffer);
    printf("%s\n",buffer);
    return 0;
}