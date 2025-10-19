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
	movl      %edi, %eax       # eax <- a
	addl      %esi, %eax       # eax <- a + b
	
	# subtraction   return a - b
	
		
	# bit and       return a & b
		
	# bit or        return a | b
		
	# bit xor       return a ^ b
		
	# bit compl     return ~a   (ignore b)
	
	# bit negate    return -a
	
	# shift logical right    return a >> b   zero pad
	
	# shift arithmetic right return a >> b   sign pad
		
	# shift left     return a << b
	
	# return 4a + b -5  in one instruction
		
	ret
	

