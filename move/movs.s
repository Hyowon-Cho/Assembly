	.file	"move.c"
	.text
	.section	.rodata
.LC0:
	.string	"%016lX\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	pushq	%rbp
	movq	%rsp, %rbp
	
	# set constant for rax
	movabsq	$0x8877665544332211, %rax
	
	#======================================
	# insert your mov instruction(s) below
	#======================================
	
	movabsq	$0x1122334455667788, %rbx
	
	movsbq	%bl, %rax
	
	
	
	#======================================
	# insert your mov instruction(s) above
	#======================================

	# load first argument to printf()	
	leaq	.LC0(%rip), %rdi
	# load second argument to printf()	
	movq	%rax, %rsi
	call	printf@PLT
	
	# set return value and exit from main
	movl	$0, %eax
	leave
	ret

