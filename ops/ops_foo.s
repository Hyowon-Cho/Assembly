//===============================================
// Matt Kretchmar
// October 2025
// ops_foo.s
// This program tests different math operator
//==============================================

	.text
	.globl	foo
	.type	foo, @function

	#=========================================
	# Function: int   foo   (int a, int b )
	# Parameters:
	#  a, b are any two integers
	# Return: a op b    where op is 
	# +, -, bitxor, bitand, bitor, >>, <<
	# parameter a is in %edi
	# parameter b is in %esi
	# return value goes in %eax
	#=========================================

foo:
	# put your code here
	
	# addition  return a + b
	movl %edi, %eax # %eax <- %edi
	addl %esi, %eax # %eax <- %eax + %esi
	
	# subtraction   return a - b
	# movl %edi, %eax # %eax <- a
	# subl %edi, %eax # %eax <- a - b
		
	# bit and       return a & b
	# movl %edi, %eax # %eax <- a
	# andl %esi, %eax # %eax <- a & b
		
	# bit or        return a | b
	# movl	%edi, %eax	# eax <- a
	# orl	%esi, %eax	# eax <- a | b
		
	# bit xor       return a ^ b
	# movl	%edi, %eax	# eax <- a
	# xorl	%esi, %eax	# eax <- a ^ b
		
	# bit compl     return ~a   (ignore b)
	# movl	%edi, %eax	# eax <- a
	# notl	%eax		# eax <- ~a (비트 반전)
	
	# bit negate    return -a

	# movl	%edi, %eax	# eax <- a
	# negl	%eax		# eax <- -a (2의 보수)

	
	# shift logical right   return a >> b   zero pad 일때는 shrl
	# (shrl = Shift Logical Right, 0으로 채움)

	# movl	%edi, %eax	# eax <- a
	# movl	%esi, %ecx	# ecx <- b (시프트 횟수를 %cl로 전달하기 위함)
	# shrl	%cl, %eax	# eax <- eax >> cl (logical)

	
	# shift arithmetic right return a >> b   sign pad 일떄는 sarl 
	# (변수 시프트는 %cl 레지스터를 사용해야 함)

	# movl	%edi, %eax	# eax <- a
	# movl	%esi, %ecx	# ecx <- b
	# sarl	%cl, %eax	# eax <- eax >> cl (arithmetic)
		
	# shift left     return a << b
	
	# movl	%edi, %eax	# eax <- a
	# movl	%esi, %ecx	# ecx <- b
	# sall	%cl, %eax	# eax <- eax << cl

	# return 4a + b -5  in one instruction
	
	# leal	-5(%esi, %edi, 4), %eax

	ret
	

