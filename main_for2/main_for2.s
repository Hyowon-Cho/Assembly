	.file	"main_for.c"
	.text
	.section	.rodata
.LC0:
	.string	"Enter n (0 to 100):"
.LC1:
	.string	"%d"
.LC2:
	.string	"total = %d\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	pushq	%rbp # 이전 함수의 스택 기준점(%rbp)을 스택에 저장합니다.
	movq	%rsp, %rbp
	subq	$32, %rsp


	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax

	movl	$0, -16(%rbp) # int total = 0;

	# printf("Enter n (0 to 100):");

	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
 
 	# ------------------------

	leaq	-20(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC1(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT

	
	movl	$1, -12(%rbp)
	jmp	.L2
.L3:
	movl	-12(%rbp), %eax
	addl	%eax, -16(%rbp)
	addl	$1, -12(%rbp)
.L2:
	movl	-20(%rbp), %eax
	cmpl	%eax, -12(%rbp)
	jle	.L3

	
	movl	-16(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC2(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, %eax
	movq	-8(%rbp), %rdx
	xorq	%fs:40, %rdx
	je	.L5
.L5:
	leave
	ret
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:
