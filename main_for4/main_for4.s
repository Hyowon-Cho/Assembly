#==========================================
# Matt Kretchmar
# October 2025
# This program prompts the user to enter an integer.
# It then counts the number of 1-bits in the int
# and prints this count.
#  -12(%rbp) as i, loop counter   from 32 downto 0
#  -16(%rbp) as total, counter of bits
#  -20(%rbp) as n, value entered
#==========================================


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
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$32, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$0, -16(%rbp)			# total = 0
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-20(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC1(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	$32, -12(%rbp)			# i = 32
	jmp	.LOOP_TEST
	
	
.LOOP_BODY:	
	movl	-20(%rbp), %eax			# eax = n
	andl	$1, %eax				# clear all but last bit
	addl	%eax, -16(%rbp)			# total += and result
	shrl	$1, -20(%rbp)			# shift n right one spot
	
.LOOP_TEST:
	decl	-12(%rbp)				# i--
	jge		.LOOP_BODY
	
	
	movl	-16(%rbp), %eax			# load total for printing
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
