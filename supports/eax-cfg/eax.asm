section .text
global _start

_start:
call f
jmp fin

f:
mov eax, 0
jmp l
mov eax, 3
l:
cmp eax, 0
je l2
mov eax, 1
ret

l2:
mov eax, 2
ret

fin:
mov	ebx,0	;first syscall argument: exit code
mov     eax,1   ;system call number (sys_exit)
int     0x80	;call kernel



