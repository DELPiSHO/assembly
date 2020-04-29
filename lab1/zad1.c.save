#include<stdio.h>


int main(void){
short int x;
short int y;
 x = 1;
 y = 2;

asm volatile(

".intel_syntax noprefix;" //dal intelowoj skladni

//"mov ax,0;" //postawic 0
//"mov %0,ax;" //w miejsce

"mov ax,%1;"
"shl ax;"
"shl ax;"
"mov bx,ax;"
"shl ax;"
"shl ax;"
"add ax,bx;"
//"mov %0,ax;"
//"add ax,5;" //dodawali 5
//"add ax,ax;"
//"shl ax;"
"mov %0,ax;"
// xor ax,ax szybki wyzerowanie

".att_syntax prefix;" //zaczoc skladniu att

:"=r"(y) //miesto gdzie zamieniamy
:"r"(x) // to co chcemy wstawic
:"ax","bx"

);
printf("x = %hd,y = %hd \n",x,y);
return 0;
}


