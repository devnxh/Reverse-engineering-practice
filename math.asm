global _start

section .text

_start:
	;2+3
	mov rax,2
	add rax,3
	
	;2-2
	mov rax,2
	sub rax,2

	;6*2
	mov rax,6
	imul rbx,rax,2

	;0100/2
	mov rdx,0
	mov rax,100
	mov rbx,2
	idiv rbx
	
	;DIV OPERATION COMBINES TWO REGISTERS LIKE 
	;RDX:RAX/2
	;0100/2

_exit:
	mov rax,60
	mov rdi,0
	syscall


;there is no print label because i used cutter tool to see how it would debug
