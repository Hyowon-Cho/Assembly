#============================================
# Function signature
# void foo ( char * );
# What does this function do?
#============================================

	.file	"foo_str.s"
	.text
	.globl	foo
	.type	foo, @function
foo:
.LFB0:
	endbr64

	pushq	%rbp #스택 프레임을 생성합니다.
	movq	%rsp, %rbp # %rbq <- %rsp 

	subq	$8, %rsp #8바이트의 로컬 변수 공간을 스택에 확보합니다.
	movq	%rdi, -8(%rbp) # %

	jmp		.LOOP_TEST

.LOOP_BODY:


	movq	-8(%rbp), %rax
	movb	(%rax), %al


	cmpb	$'a', %al
	jl		.LOOP_UPDATE
	cmpb	$'z', %al
	jg		.LOOP_UPDATE

	movq	-8(%rbp), %rax		
	subb	$32, (%rax)			

.LOOP_UPDATE:
	addq	$1, -8(%rbp)		

.LOOP_TEST:
	movq	-8(%rbp), %rax
	movb	(%rax), %al
	testb	%al, %al
	jne		.LOOP_BODY

	leave
	ret



.LFE0:
	.size	foo, .-foo
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
