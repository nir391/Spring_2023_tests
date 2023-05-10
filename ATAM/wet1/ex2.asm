.global _start

.section .text
_start:
	
	movl num, %eax
	movq $source, %r8
	movq $destination, %r9
	movq $0, %rcx
	cmpl $0, %eax
	jle end_HW1
	
	cmp %r9, %r8
	ja copyLoopNoOF_HW1
	
	movl num,%ebx
	add $source, %rbx
	sub $destination, %rbx
	cmp $0, %rbx	#rbx has the overlap
	js copyLoopNoOF_HW1

	movl num,%edx
	dec %edx
	
copyLoopOF_HW1:
							movb (%r8, %rdx), %r10b 		#r10b = *(r8+rdx)
							leaq (%r9, %rdx), %r11			#r11 = r9+rbx
							movb %r10b, (%r11)				#r11 = *r10b
							inc %rcx								#couter++
							dec %rdx
							cmp %ecx, %eax					#check if finish
							je end1_HW1						
							jmp copyLoopOF_HW1
							
copyLoopNoOF_HW1:
							movb (%r8, %rcx), %r10b 		#r10b = *(r8+rdx)
							leaq (%r9, %rcx), %r11			#r11 = r9+rcx
							movb %r10b, (%r11)				#r11 = *r10b
							inc %rcx								#couter++
							cmp %ecx, %eax					#check if finish
							je end1_HW1						
							jmp copyLoopNoOF_HW1
end_HW1:
					movl %eax, (%r9)
end1_HW1:
