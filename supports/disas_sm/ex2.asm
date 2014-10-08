section .text
global _start
_start:

debut:
inc eax
jz zero ; saute si la nouvelle valeur d'eax est 0

paszero:
mov edi, 2
jmp debut

zero:
mov edi, 1
mov ebx, debut
mov word [ebx], 0x90
mov word [ebx+1], 0xc3
jmp debut


