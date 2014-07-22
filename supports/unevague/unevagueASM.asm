section .text
global _start
_start:

; protection : .text -> RWX
mov dword eax, 0x7d ;mprotect
mov dword ebx, injects ; addr
and	dword ebx, 0xfffff000 ; ?
mov dword ecx, 0x2000 ; size
mov dword edx, 0x07 ; PROT_READ | PROT_WRITE | PROT_EXEC
int	byte  0x80
;PROT_READ  = 0x1 =   00000001
;PROT_WRITE = 0x2 =   00000010
;PROT_EXEC  = 0x4 =   00000100

mov edi, 0

injects:
mov eax, 0x8048091   ;(injection into 'injection2' label)
mov word [eax], 0xeb    ;(0x2ceb=jmp (+2c))
mov word [eax+1], 0x07    ;(0x2ceb=jmp (+2c))
; into 'injection1' label

injection2:
jmp edi3

edi1:
mov edi,1
jmp fin

edi2:
mov edi,2
jmp fin

edi3:
mov edi,3
jmp fin

fin:
; prints the content of edi
add edi, 0x30
push 0x00
push 0x0a
push edi
mov	eax, 0x04 ; write
mov ebx, 0x01 ; stdout (?)
mov ecx, esp ; message
mov edx, 12  ; size
int 80h

; exits
mov ebx, 0
mov eax, 1 
int 80h
