;This program reads user input, compares it with a predefined key, and prints "Access Granted" or "Access Denied".
global _start

section .text

_start:
	jmp main

main:
        mov rax,0
        mov rdi,0
        mov rsi,user_key
        mov rdx,64
        syscall

cmp_key:
        ;to read user input length used rax that is stored in previous function by syscall
	dec rax ;this subsrtacts 1 because of new line can be count as space       
	cmp rax,org_key_len; to check if user input length macthes with org key length
        jne access_denied;jump if not equal 
        mov rsi,org_key
        mov rdi,user_key
        cmpsb ; cmpsb is used to compare string register
        jne access_denied
access_granted:
                mov rax,1
                mov rdi,1
                mov rsi,access_granted_msg
                mov rdx,access_granted_msg_len
                syscall
                jmp exit 
access_denied:
        mov rax,1
	mov rsi,access_denied_msg
	mov rdx,access_denied_msg_len
	syscall

exit:
	mov rax,60
	mov rdi,0
	syscall	

section .data

	access_granted_msg: db "Access granted!",10
	access_granted_msg_len: equ $-access_granted_msg ;for length of msg
	access_denied_msg: db "Access denied!",10
	access_denied_msg_len:equ $-access_denied_msg
	org_key: db "1234-657-143-875"
	org_key_len: equ $-org_key
section .bss
	user_key : resb 64 
	
