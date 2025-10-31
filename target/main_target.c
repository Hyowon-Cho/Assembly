//==========================================
// Matt Kretchmar
// main_target.c
// October 2025
// This program creates an array of ints
// and counts the number of instances of a
// particular target value in the array
//==========================================

#include <stdio.h>

int		countTarget ( int a[], int n, int target );

int main ( void )
{
	int array[] = { 5, 8, 1, 3, -3, 3, 6, 3, 3, -3, 0, 3};
	int n = 12;
	int target = 3;
	
	int count = countTarget(array,n,target);
	
	printf("Number of instances of %d in array is %d\n",target,count);
	return 0;
}



