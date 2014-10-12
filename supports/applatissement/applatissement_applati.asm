section .text
global _start

_start:
mov eax, A
S:
jmp eax

A:
cmp ebx, 0
jne A2
A1:
mov eax, B
jmp S
A2:
mov eax, E
jmp S

B:
mov edi, 0
mov eax, C
jmp S

C:
inc edi
mov eax, D
jmp S

D:
ret

E:
mov edi, 1
cmp ebx, 1
jne E2
E1:
mov eax, F
jmp S
E2:
mov eax, C
jmp S

F:
add edi, 2
mov eax, D
jmp S
