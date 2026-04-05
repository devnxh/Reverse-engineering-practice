%include "util.asm"
GLOBAL _start

section .text

_start:
	mov rdi,msg
	call printstr
	call readint
  	mov [user_value],rax ;square bracket means store rax value in address of user_value that we allocated 8 bytes 
	mov rbx,1
LOOP_START:
	
	mov rcx,[user_value]

	imul rcx,rbx ; 
	mov rdi,rcx
	call printint
	call endl
	add rbx,1
	cmp rbx,11
	jne LOOP_START
	call exit0

section .data
	msg: db "Enter a number",0 ; 0 is null byte to separate two strings otherwise if you write second msg below it will also print that 
	
section .bss
	user_value: resb 8	
