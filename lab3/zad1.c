#include<stdio.h>

int main(void){

short int x = 0x70E0;
short int y;

asm volatile(
	".intel_syntax noprefix;"

"mov ax,%1;"
"mov cx,16;"
"mov bx,0;"

"petla:"

"shl ax;"
"jnc przeskocz;"
"inc bx;"

"przeskocz:"
"dec cx;"
"jnz petla;"
"mov %0,bx;"

".att_syntax prefix"
:"=r"(y)
:"r"(x)
:"ax","bx","cx"
);
printf("%hd \n",y);
return 0;
}
