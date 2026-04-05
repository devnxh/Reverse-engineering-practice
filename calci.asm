;calculator
%include "util.asm"

global _start

section .text

_start:

	mov rdi,num1
	call printstr
	call readint
	mov [user_num1],rax

	mov rdi,num2
	call printstr
	call readint
	mov [user_num2],rax

	mov rdi,op
	call printstr
	mov rdi,user_op
	mov rsi,2
	call readstr

cmp_operator:
	mov rdi,[user_op]
	cmp rdi,43 ; 43= "+" sign in dec
	je addition
	cmp rdi,45 ;45="-"
	je sub
	cmp rdi,42 ; 42="*"
	je multiply
	cmp rdi,47 ; 47="/"
	je div	
exception:
	
	mov rdi,error_msg
	call printstr
	call endl
	call exit0

addition:
	mov rdi,[user_num1]
	add rdi,[user_num2]
	jmp result
sub:
	mov rdi,[user_num1]
        sub rdi,[user_num2]
        jmp result

multiply:
	mov rdi,[user_num1]
	imul rdi,[user_num2]
	jmp result

div:
	mov rax,0
	mov rax,[user_num1]
	mov rbx,[user_num2]
	idiv rbx
	mov rdi,rax
	jmp result
result:
	call printint
        call endl
        call exit0

section .data

	num1: db "ENtern number 1:",0
	num2: db "Enter number 2:",0
	op: db "Enter operation (+,=,*,/)",0
	error_msg: db "cannot perform this operation ",0
section .bss
	user_num1: resb 8
	user_num2: resb 8
	user_op: resb 2
