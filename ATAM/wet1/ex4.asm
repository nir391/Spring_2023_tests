.global _start

.section .text
_start:
	movq head(%rip), %rdi
	#xor %eax, %eax
	movq Source(%rip), %r8
	#movl %r8d, %r15d
	movl (Value), %r9d
	testq %rdi, %rdi
	je end_HW1
	testq %r8, %r8
	je end_HW1
	movl (%r8), %ebx # *source
	cmpl %r8d, %r9d # if *source == value {end}
	je end_HW1
	
loop1_HW1:
	movl (%rdi), %eax
	cmpl %eax, %r9d #change %r9d with (Value)
	je match_HW1
	movq 4(%rdi), %rdi
	testq %rdi, %rdi
	jne loop1_HW1
	jmp end_HW1
	
match_HW1:
	
	movl %r8d, %eax
	movl %r9d, %r8d

end_HW1:
	