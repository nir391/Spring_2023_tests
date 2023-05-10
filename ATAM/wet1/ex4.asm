.global _start

.section .text
_start:
	movq $head, %rdx		#rdx is pointer to head
	test %rdx,%rdx			#chek head != NULL
	jz end_HW1
	
	movq (%rdx), %rax		#if head != NULL , put the adress of the first node to rax

	movq (Source) , %r8	#r8 is the source
	test %r8, %r8       		#chek source != NULL
	jz end_HW1

	movl (Value), %r9d		#r9 is the value
	
loop1_HW1:
	movl (%rax), %r10d		#r10d is the cureent value
	cmpl %r10d, %r9d			#chec if value the same
	jz swap_HW1
	
	leaq 12(%rax), %rax		#next node
	
	movq (%rax), %rcx		#check if next is NULL
	test %rcx, %rcx
	jz end_HW1
	jmp loop1_HW1
	
swap_HW1:
	movq -8(%rax), %r11
	movq -8(%r8), %r12
	movq %r12, -8(%rax)
	movq %r11, -8(%r8)
	
	movq 4(%rax), %r11
	movq 4(%r8), %r12
	movq %r12, 4(%rax)
	movq %r11, 4(%r8)
end_HW1:
	