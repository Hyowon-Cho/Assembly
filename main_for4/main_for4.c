#include <stdio.h>

int main(void)
{
	int n;
	int total = 0; // '1' 비트의 개수를 세는 변수

	// 어셈블리 코드의 printf/scanf 부분
	printf("Enter n (0 to 100):");
	scanf("%d", &n);
	
	// 어셈블리 코드의 .LOOP_BODY / .LOOP_TEST 부분
	// 루프가 32번 실행됩니다 (32비트 정수의 모든 비트를 검사)
	for (int i = 0; i < 32; i++) {
		
		// 1. n의 마지막 비트가 1이면 1을, 0이면 0을 total에 더함
		// (andl $1, %eax; addl %eax, -16(%rbp))
		total += (n & 1); 
		
		// 2. n의 비트를 오른쪽으로 1칸씩 이동시킴
		// (shrl $1, -20(%rbp))
		n = n >> 1;
	}
	
	// 어셈블리 코드의 마지막 printf 부분
	printf("total = %d\n", total);
	return 0;
}