#include<stdio.h>

int main(void){
short int x = 0x3FF9;
short int y = 0;
asm volatile(
".intel_syntax noprefix;"
"mov ax,%1;"
"mov cx,16;"
"mov bx,0;"
"mov dx,0;"

	"petla:"     //pierejdiott

"shl ax;"     //mnozy na 2
"jnc przeskocz;"  //jesli 0 to pierejdit srazu k przeskocz

"inc bx;"       //uwieliczit na 1
"jc petla;"     //kogda 1 to pireskoczit w petla

	"przeskocz:"

"cmp bx,dx;" //sprawdznenie
"jle wyjscie;"  //sprawnienije prodolzaetsia

"mov dx,bx;"  //dx primit znaczienie bx

	"wyjscie:"
"mov bx,0;"   /// bx primit znaczienije 0


"dec cx;"    //umienszit na 1
"jnz petla;" ///pryjdzie do petla


"mov %0,dx;"


".att_syntax prefix;"
:"=r"(y)
:"r"(x)
:"ax","cx","bx","dx"
);
printf("ilosc jedynek stojac razem %hd\n",y);

return 0;
}




