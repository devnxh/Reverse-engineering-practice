;taking user input and printing it 
global _start
section .text
	_start:
		mov rax,1
		mov rdi,1
		mov rsi,hello
		mov rdx,hello_length
		syscall

	user_input:
		mov rax,0
		mov rdi,0
 		mov rsi,input
		mov rdx,100
		syscall
		mov rbx,rax
	printing_input:
		mov rax,1
		mov rdi,1
		mov rsi,input
		mov rdx,rbx
		syscall
		
	exiting_program:
		mov rax,60
		mov rdi,22
		syscall

section .data
	hello: db 'Enter you name :'
	hello_length: equ $-hello

section .bss
	input: resb 100

