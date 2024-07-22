global _start

section .data  
    buffer db "Hello, World", 0x0a , 0x00

section .text
_start:
    ; point both rax and rbx to buffer
    mov rax, buffer
    mov rbx, rax

_print_loop:
    ; check for null terminator in rax
    cmp byte[rax], 0x00
    ; if found, jump to _finished
    je _finished
    ; else increment the value of rax by 1
    inc rax
    ; repeat
    jmp _print_loop

; once finished, print the buffer
_finished:
    ; subtract the value of rbx from rax
    ; it will give us the string length
    sub rax, rbx
    ; push the string length onto the stack
    push rax

; perform the write system call
; syscall(1, 1, buffer, buffer_len);
_write:
    mov rax, 0x01
    mov rdi, 0x01
    mov rsi, buffer
    pop rdx
    syscall

; perform the exit syscall
_exit:
    ; syscall(60, 0)
    mov rax, 0x3c
    xor rdi, rdi
    syscall