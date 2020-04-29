.intel_syntax noprefix
.text
.globl main
main:
mov ecx,[esp+4]
cmp ecx,1
je blad

mov ecx,[esp+8]
mov ebx,[ecx+4]
spraw:
mov al,[ebx]
cmp al,0
je ok
cmp al,'0'
jl blad
cmp al,'9'
jg blad
inc ebx
jmp spraw
ok:
					;////
mov eax,[ecx+4]  ;//dac znacienie	;////
push eax				;////wczytanie z klawiatury 
call atoi				;////
add esp,4				;////
xor ecx,ecx				;////kosowanie
xor ebx,ebx
push eax   ;//stawit na stos
call f     ;//wyzwat funkc f

add esp,4   ;//dodajom na stos 4 (miesto bolsze)
push eax    ;///tak nado

mov eax,offset message    ;//wozmiot znaczienije posle message


push eax	;//piered printf posle pusz budet eax
call printf	;//wypiszet eax
add esp,8	;//dobawili 2 jaczejki
mov eax,0	;//prinilo znaczienije 0
ret 		;//wypiszit eax posledniee s nim diejstwije



f:
mov eax,[esp+4]		;//wyzywaet to czto na stossamoje nizkoje

cmp eax,0		;//SRAVNIWAJET to czto eax s 0
jne if2			;//jesli 2 czisla nie rawny to pierejti na metku if2:
mov eax,1		;///no jesli rawny to w eax priniat znaczenieje 1 
ret			;///wypisat znaczienije eax;

if2:
cmp eax,1		;//srawniwajet eax s 0 
jne if3			;//esli nie = to na f3
mov eax,0		;//jesli rawno to eax zapiszet 0 ;  
ret			;//wypiszit poslidnij 0;

if3:
cmp eax,2		;//eax <>= s 2
jne if4			;//jesli nie = to if4
mov eax,1		;//jesli = to 1
ret			;//wypisat 1
//if(n==0) return 1;
//if(n==1) return 0;
//if(n==2) return 1;

if4:

dec eax			;//eax -1
push eax		;//zapisywajem w stos eax
call f			;//wyzywa
add esp,4		;//wydelili 1jaczejku na stos dla 32bit

mov ecx,eax		;//registr ecx wpisali znacz eax nie s stosi

mov eax,[esp+4]		;//eax wozmiot znaczienije iz bliz jacz s stosi

//if(n>=3) return f(n-1);

dec eax			;//ponizim eax na 1
dec eax			;//ponizim eax na 1
push ecx		;//ecx na stos
push eax		;//eax na stos
call f			;//wyzywajem funkc F
add esp,4		;//dodajom jaczejku na stos dla 32bit
pop ecx			;//bieriom ecx iz rejestra
mov ebx,eax		;//ebx pinim znacz eax

mov eax,[esp+4]		;//vozmiot znaczienie to czto posledniee na stos

//if(n>=3) return 2*f(n-2);

dec eax			;//poniz na 1 eax
dec eax			;//poniz na 1 eax
dec eax			;//poniz na 1 eax
push ecx		;//zapiszet na stos ecx
push ebx		;//ebx
push eax		;//eax
call f			;//f
add esp,4		;//stos = jacz
pop ebx			;//bier ebx izz rejestr
pop ecx			;//ecx prim znacz ecx iz rejestr
//shl eax
//mov ebx,eax
mov edx,ebx
shl ebx			;//*2 ebx	//zamutili umnozienie na 3 
add ebx,edx		;		//
shl eax			;//*2 eax

//neg eax
add ecx,ebx		;// ecx+ebx
sub ecx,eax		;//ecx+eax
mov eax, ecx		;//eax primit znacz ecx
ret			;//i wypiszit jego
//if(n>=3) return 2*f(n-3);

//-----//


//if(n>=3) return f(n-1);
//-----//

blad:
  mov eax, offset message_blad
  push eax
  call printf
  add esp,4
	ret

.data
message:
.asciz "Wynik=%i\n"
message_blad:
.asciz "Blad"

