#include <stdio.h>

int main ( void )
{
	int n;
	int total = 0;
	printf("Enter n (0 to 100):");
	scanf("%d",&n);
	
	for (int i = 1; i <= n; i++ )
		total += i;
		
	printf("total = %d\n",total);
	return 0;
}

	