//===============================================
// Matt Kretchmar
// October 2025
// if_foo.s
// This program tests if statements
//==============================================

	.text
	.globl	foo
	.type	foo, @function

	#=========================================
	# Function: int   foo   (int a, int b )
	# Parameters:
	#  a, b are any two integers
	# Return: some value depending on operation 
	# parameter a is in %edi
	# parameter b is in %esi
	# return value goes in %eax
	#=========================================

foo:

	#=========================================
	# Puzzle 1
	# if (a == 0) 
	#	return b;
	# else
	#	return a;
	#=========================================

	#---------------------
	# Solution 1
	movl	%edi, %eax		# %eax <- %edi
	testl	%edi, %edi		# if a == 0
	jne		L0				# 	jump to L0
	
	movl	%esi, %eax		# mov b into return value
L0:
	ret

	#---------------------
	# Solution 2
	testl	%edi, %edi		# if a == 0
	je		L0_2a			# then goto L0_2a
	jmp		L0_2b			# else goto L0_2b
	
L0_2a:						# if a==0 return b
	movl	%esi, %eax
	ret
L0_2b:						# else return a
	movl	%edi, %eax
	ret

	#---------------------
	# Solution 3
	movl	%edi, %eax		# assume return a
	testl	%edi, %edi		# if a == 0
	cmove	%esi, %eax		# then return b
	ret


	#=========================================
	# Puzzle 2
	# if (a == b) 
	#	return 1;
	# else
	#	return 0;
	#=========================================

	movl $1, %eax      # 1. "가정": eax는 일단 1이다.
    cmpl %esi, %edi    # 2. (a - b) 연산
    jz L0              # 3. (a == b)이면 L0로 점프
    jnz L1             # 4. (a != b)이면 L1로 점프
L0:
    movl $1, %eax      # 5. eax = 1 (이미 1이었음)
    ret
L1:
    ret                # 6. "else" 경로. 아무것도 안 함.

	#=========================================
	# Puzzle 3
	# if (a > b) 
	#	return a;
	# else
	#	return b;
	#=========================================

	# (jmp가 없는 cmov 방식이 가장 효율적입니다)
	
	movl  %esi, %eax		# eax = b ('else' 케이스를 기본값으로 가정)
	cmpl  %esi, %edi		# (a - b) 연산으로 플래그 세팅
	cmovg %edi, %eax		# "Move if Greater": if  (a > b)이면, eax = a 로 덮어쓴다
	ret


	#=========================================
	# Puzzle 4
	# if (a < 0 ) 
	#	return a+b;
	# else
	#	return a;
	#=========================================
	
	# ("else" 케이스를 가정하고, if가 참일 때만 추가 연산)
	
	movl  %edi, %eax		# eax = a ('else' 케이스를 기본값으로 가정)
	testl %edi, %edi		# (a & a) 연산으로 'a'의 부호 플래그(SF) 세팅
	jns   L4_done			# "Jump if Not Sign": if (a >= 0), 점프해서 끝낸다

	addl  %esi, %eax		# eax = a + b (eax는 이미 a였음)
L4_done:
	ret


	#=========================================
	# Puzzle 5
	# if (a < 0 && b < 0) 
	#	return -1;
	# else if ( a < 0 || b < 0)
	# 	return 0;
	# else
	#	return 1;
	#=========================================
	
	# C 코드의 논리 흐름을 점프로 구현
	
	testl %edi, %edi		# a의 부호 검사
	jl    A_IS_NEG		# if (a < 0), goto A_IS_NEG
	
	# (a >= 0) 케이스:
	testl %esi, %esi		# b의 부호 검사
	jl    ELSE_IF_CASE		# if (b < 0), goto ELSE_IF_CASE (a >= 0 && b < 0)
	
	# (a >= 0 && b >= 0) 케이스 -> 'else'
	movl  $1, %eax		# eax = 1
	ret

A_IS_NEG:
	# (a < 0) 케이스:
	testl %esi, %esi		# b의 부호 검사
	jl    BOTH_NEG_CASE		# if (b < 0), goto BOTH_NEG_CASE (a < 0 && b < 0)

	# (a < 0 && b >= 0) 케이스 -> 'else if'
ELSE_IF_CASE:
	# 'else if (a < 0 || b < 0)' 케이스
	xorl  %eax, %eax		# eax = 0
	ret

BOTH_NEG_CASE:
	# 'if (a < 0 && b < 0)' 케이스
	movl  $-1, %eax		# eax = -1
	ret