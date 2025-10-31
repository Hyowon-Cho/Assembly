	.file	"countTarget.s"
	.text
	.globl	countTarget
	.type	countTarget, @function
countTarget:

# signiture: 
    # int countTarget (int a[], int n, int target);

	#------------------------------------
	# stack frame set up
	# variable      location     param
    # array         -8(rbp)      rdi 
    # target        -c(rbp)      edx
    # i             -10(rbp)     loop counter 
    # n             -14(rbp)     esi array size
    # count         -18(rbp)     return count
    # rbx           -20(rbp)     callee saved register
	#------------------------------------
	
    # set up and create space

    pushq   %rbp
    movq    %rbp, %rsp # %rsp <- %rbp
    subq    $0x20, %rsp # create frame space on stack

    # copy parameters into stack frame

    movq    %rdi, -0x8(%rbp) # save array address
    movl    %esi, -0x14(%rbp) # save n
    movl    %edx, -0xc(%rbp) # save target
    movq    %rbx, -0x20(%rbp) # save callee reg

	#------------------------------------
	# preloop init
	#------------------------------------

    movl

	#------------------------------------
	# loop body
	#------------------------------------

	#------------------------------------
	# loop test
	#------------------------------------

	#------------------------------------
	# loop exit
	#------------------------------------

    # load the return value
    movl    -0x18(%rbp), %eax

	#------------------------------------
	# stack frame clean up
	#------------------------------------
	
    movq -0x20(%rbp), %rbx
    leave
    ret
	
	
