.global _start

.section .text
_start:

	xor %rbx, %rbx
	movq num, %rax
	

loop_HW1:	
					test  %rax, %rax
					jz end_HW1
					shr $1, %rax
					jnc loop_HW1
					inc %rbx
					jmp loop_HW1
end_HW1: 
					movb %bl, Bool
