global _start

section .data
    buffer db "Hello, World!", 0x0a, 0x00
    buffer_length equ $-buffer


section .text
_start:
    ; perform the write syscall
    ; syscall(1, 1, buffer, buffer_length);
    mov rax, 0x01
    mov rdi, 0x01
    mov rsi, buffer
    mov rdx, buffer_length
    syscall


    ; perform the exit syscall
    ; syscall(60, 0);
    mov rax, 0x3c
    xor rdi, rdi
    syscall
