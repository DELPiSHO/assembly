//nr-235381.s
//pszuca@mat.ug.edu.pl
//nie wiecej niz 25kilobajt a.out
//sdelat czto by wypolnilo tablicu kakim libo wyczislenijem
// An+1 n/2 jesli n parz to /2
//3*An+1 jesli n niparz
/*
0 -> 1  (1)
1 ->2,1,(2)
2->3,10,5,16,8,4,2,1(8)
3->4,2,1(3)
4->5,16,8,4,2,1(6)
5->6,3,10,5,16,8,4,2,1(9)
do (255) jesli wiecej (255) to (255)
hipoteza Collatza
*/
.intel_syntax noprefix
.text
.global zadanie

zadanie:
	mov ebx,offset wynik
	mov ecx,offset wynik_len
petla:
	mov [ebx],byte ptr 1
	inc ebx
	loop petla
	mov eax,0
ret
