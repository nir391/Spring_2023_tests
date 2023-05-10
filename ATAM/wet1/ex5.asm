.global _start

.section .text
_start:
			movq $new_node, %rax				#rax is the adress of new node
			movq $root, %rbx
			
			test %rbx, %rbx								#root = NULL
			jz makeRoot_HW1
			movq %rbx, %rdx						    #if root != NULL , put the adress of the first node to rdx
			
find_HW1:
					movq (%rdx), %rdx			 	#rdx is the adress of current node
					movq (%rdx), %r8				#r8 is the value of the current node
					
				   cmp %r8, (%rax)
				   je end_HW1							#if the node exists do nothing
				   jg goRight_HW1
				   jl goLeft_HW1
				   
goRight_HW1:
							cmp $0, 16(%rdx)
							je makeRightNode_HW1
							
							leaq 16(%rdx), %rdx
							
							jmp find_HW1
goLeft_HW1:				
							cmp $0, 8(%rdx)
							je makeLeftNode_HW1
							
							leaq 8(%rdx), %rdx		
							jmp find_HW1
							

makeRightNode_HW1:
								movq %rax, 16(%rdx)
								jmp end_HW1
makeLeftNode_HW1:
								movq %rax, 8(%rdx)
								jmp end_HW1
makeRoot_HW1:
							movq %rax, (%rbx)
end_HW1:
