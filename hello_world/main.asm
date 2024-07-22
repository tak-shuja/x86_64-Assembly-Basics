; Author: Shuja Ahmad Tak
; A simple hello world program
; written in x86_64 assembly



global _start

section .data
    msg db "Hello, World!", 0x0a, 0x00

section .text

_start:
    ; point two registers to the same address
    mov rax, msg
    mov rbx, rax

; start a loop to get the characters upto null terminator
_print_loop:
    ; compare each byte in rax with 0
    cmp byte[rax], 0x00
    ; if equal, jump to finished
    je _finished
    ; else increment the rax register
    inc rax
    ; repeat
    jmp _print_loop

_finished:
    ; subtract the value of rbx from rax
    ; it will give us the string length
    sub rax, rbx
    ; push the value of rax onto the stack
    push rax

; perform the write system call
_print:
    mov rax, 0x01
    mov rdi, 0x01
    mov rsi, msg
    pop rdx
    syscall

; perform the exit syscall
_exit:
    mov rax, 0x3c
    mov rdi, 0x00
    syscall