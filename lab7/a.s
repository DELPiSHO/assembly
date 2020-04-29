.intel_syntax noprefix
.text
.global main

main:
	call  zadanie
	mov eax,0
	ret

.bss
.globl wynik, wynik_len
wynik:
	.skip 65536
	.equ wynik_len, $-wynik
