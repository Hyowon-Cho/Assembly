	.file	"foo_strlen.c"
	.text
	.globl	strlen2
	.type	strlen2, @function
strlen2:
	pushq	%rbp
	movq	%rsp, %rbp



	#===================================
	
	movq	$0, %rax	# rax <- $0 and same as  xorl	%eax, %eax
	
	movb	(%rdi), %bl # bl = s[0] (first char)

	testb   %bl, %bl 	# if bl ==0
 	je		L0			# jump to L0

	incq	%rdi		# add 1 to address
	call	strlen2 	# recursive call
	incq	%rax 		# add 1 to return value


L0:
	leave
	ret


	#===================================




	
	leave
	ret
.LFE0:
	.size	strlen2, .-strlen2
	.ident	"GCC: (Ubuntu 12.3.0-1ubuntu1~22.04) 12.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
