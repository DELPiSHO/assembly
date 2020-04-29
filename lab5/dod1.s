.intel_syntax noprefix
.text
.globl main

main:

mov eax,[esp+8]
mov ebx[eax+4]
push ebx

call atoi
add esp,4
inc eax

push eax

mov eax,off message
push eax
call printf

add esp,8


mov eax,0;
ret
.data
message:
.asciz "wynik = %i \n"
