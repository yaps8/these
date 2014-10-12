section .text
global _start

_start:
A:
cmp ebx, 0
jne E

B:
mov edi, 0

C:
inc edi

D:
ret

E:
mov edi, 1
cmp ebx, 1
je F

F:
add edi, 2
jmp D
