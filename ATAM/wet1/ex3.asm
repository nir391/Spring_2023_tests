.global _start

.section .text
_start:
	xor %r8, %r8
	xor %r9, %r9
	xor %r10, %r10
	movq $array1, %r11
	movq $array2, %r12
	movq $mergedArray, %rcx
	
loop1_HW1:
	movl (%r11, %r8, 4), %eax
	movl (%r12, %r9, 4), %ebx
	movl %eax, %r15d
	add %ebx, %r15d
	cmp $0, %r15d
	je end_HW1
	cmp $0, %eax
	je greater_HW1
	cmp $0, %ebx
	je less_HW1
	
	
	cmpq %rax,  %rbx #if (*array2 > *array1){ mergedArray == *array2}
	jg greater_HW1
	jl less_HW1
	je equal_HW1
	
	
greater_HW1:
	movl %ebx, (%ecx, %r10d, 4)
inLoop1_HW1:
	inc %r9d
	movl (%r12,%r9, 4), %r13d
	cmp %r13d, (%ecx, %r10d, 4) 
	je inLoop1_HW1
	inc %r10d
	jmp loop1_HW1
	
	
less_HW1:
	movl %eax, (%ecx, %r10d, 4)
inLoop2_HW1:
	inc %r8d
	movl (%r11, %r8, 4), %r14d
	cmp %r14d,  (%ecx, %r10d, 4)
	je inLoop2_HW1
	inc %r10d
	jmp loop1_HW1

equal_HW1:
	movl %ebx,  (%ecx, %r10d, 4) 
inLoop3_HW1:
	inc %r9d
	movl (%r12,%r9, 4), %r13d
	cmp %r13d, (%ecx, %r10d, 4) 
	je inLoop3_HW1
	jmp inLoop2_HW1


end_HW1:
	#inc %r10d
	movl $0, (%ecx, %r10d, 4) 
	