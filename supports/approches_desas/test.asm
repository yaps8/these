section .text
global _start
_start:

;; protection : .text -> RWX
;mov dword eax, 0x7d ;mprotect
;mov dword ebx, injects ; addr
;and	dword ebx, 0xfffff000 ; ?
;mov dword ecx, 0x2000 ; size
;mov dword edx, 0x07 ; PROT_READ | PROT_WRITE | PROT_EXEC
;int	byte  0x80
;;PROT_READ  = 0x1 =   00000001
;;PROT_WRITE = 0x2 =   00000010
;;PROT_EXEC  = 0x4 =   00000100

mov dword eax, adr
mov word [eax+1], 2
mov word [eax+5], 2

adr:
mov edi, 1
mov ebx, 1
ret
