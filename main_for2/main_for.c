#include <stdio.h>

// 1~ n 까지 사용자가 입력한 정수의 합을 계산하는 프로그램 (main_for2)

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

	