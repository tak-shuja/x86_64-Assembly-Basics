global _start

section .data
    prompt db "Enter a message: ", 0x00
    prompt_length equ $-prompt
    result db "You entered: ", 0x00
    result_length equ $-result


section .bss
    ; reserve 20 bytes for the buffer
    buffer resb 20

section .text
_start:
    ; perform the write syscall
    mov rax, 0x01
    mov rdi, 0x01
    mov rsi, prompt
    mov rdx, prompt_length
    syscall

    ; perform the read syscall
    mov rax, 0x00
    mov rdi, 0x01
    mov rsi, buffer
    mov rdx, 20
    syscall

    ; write You entered
    mov rax, 0x01
    mov rdi, 0x01
    mov rsi, result
    mov rdx, result_length
    syscall


    ; write the result
    mov rax, 0x01
    mov rdi, 0x01
    mov rsi, buffer
    mov rdx, 20
    syscall


    ; exit
    mov rax, 0x3c
    xor rdi, rdi
    syscall
