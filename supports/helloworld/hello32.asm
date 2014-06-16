section .data

msg     db      "Hello, world! :)",0xa	;our dear string
len     equ     $ - msg                 ;length of our dear string

section .text
global _start

_start:
; write
mov     ecx, msg ;second argument: pointer to message to write
mov     ebx,1   ;first argument: file handle (stdout)
mov     eax,4   ;system call number (sys_write)
mov	edx, len
int     0x80	;call kernel

;exit
mov	ebx,0	;first syscall argument: exit code
mov     eax,1   ;system call number (sys_exit)
int     0x80	;call kernel



