.intel_syntax noprefix

.text  ;//oznacza ze bedzi segment kodu

.globl main ;//globalna etykita

main:

mov eax,[esp+8]   ;//rabotajet kak wskaznik
//mov ebx,[eax+4]
mov ebx,[eax+12]
push ebx             ;//zapisywajet na os

mov eax,[esp+8]   ;//zawartosc komurki pod esp+4
push eax

mov eax, offset message  ;//perehodit w message
push eax
call printf          ;//wypisywajet
add esp,12
//puts("Hello world")  ;//puts(char *s) funkcja zwraza orgomenty

mov eax,0 ;//zwraca wynik
ret     ;//return

.data
message:
.asciz"Hello world %i %s "   ;//dane w formacie aski tych literel i na koncu 0
