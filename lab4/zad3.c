.intel_syntax noprefix 
.text 
.globl main 
main: 



mov eax,[esp+8] 
mov ebx,[eax+4] 
push ebx 
//%s 

call atoi 

add esp,4 

inc eax 

push eax 

mov eax,offset message 
push eax 
call printf 
add esp,8 





mov eax,0; 
ret; 
.data 
message: 
.asciz "wynik = %i\n"

