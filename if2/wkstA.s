#=========================================
# if2.s
# Matt Kretchmar
# March 2025
# A small program to illustrate if statements
#=========================================

	.file	"if2.c"

	.text
	.section	.rodata
.LC0:
	.string	"%d"
.LC1:
	.string	"x = %d\n"
.LC2:
	.string "Enter x: "

	.text
	.globl	main
	.type	main, @function
main:
	#------------------------------
	# set up stack frame
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$16, %rsp
	
	#------------------------------
	# print prompt
	leaq	.LC2(%rip), %rdi		# parm 1 = string to print
	call	puts@PLT
	
	#------------------------------
	# call to scanf to read in value for x
	leaq	.LC0(%rip), %rdi		# parm 1 = scanf string
	leaq	-12(%rbp), %rsi			# parm 2 = address of x
	call	__isoc99_scanf@PLT
    
    #------------------------------
    # my code for exercise b
    # use -12(%rbp) for x
    # use rbx (ebx) for count

    # initialize variables
    # x in -12(rbp) is already entered via the above scanf

    # init count = 0
    xorl    %ebx, %ebx
    jmp     .LOOP_TEST

.LOOP_BODY:
    movl    $1, %ebx # %ebx (count) + 1
    shrl    $1, -12(%rbp) # x >> 1

.LOOP_TEST:
    movl    -12(%rbp), %eax
    testl   %eax, %eax
    je  .L2


    testl   $1, -12(%rbp) # x & 1
    je .LOOP_BODY
   

.L2:
	#------------------------------
	# print value of x
	leaq	.LC1(%rip), %rdi		# parm1 = printf string
	movl	-12(%rbp), %esi			# parm2 = value of x
	call	printf@PLT
	
	#------------------------------
	# clear up stack frame and load return value
	movl	$0, %eax
	leave
	ret
