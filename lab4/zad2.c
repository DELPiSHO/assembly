#include<stdio.h>

int main(){

char *x ="ABc Xy2 Abc";
short int y;
        asm volatile(
        ".intel_syntax noprefix;"
                "push eax;"
                "push cx;"

                "mov eax,%1;" //w rejestrze eax adres x
                "xor bx,bx;"//zerujemy bx

                "petla:"
                "mov cl,[eax];"//lodujemy do cl zawartosc pamienci [eax]
                "cmp cl,0;"
                "jz koniec;"

                "cmp cl,'A';"
                "jl ifLess;"

                "cmp cl,'Z';"
                "jg ifG;"

                "inc eax;"
                "inc bx;"
                "jmp petla;"

                "ifLess:"
                "ifG:"
                "inc eax;"
                "jmp petla;"
                "koniec:"

                "pop cx;"  //odwrotna kolejnosc
                "pop eax;"

                "mov %0,bx;"

        ".att_syntax prefix;"
        :"=r"(y)   //%0
        :"r"(x)    //%1
        : "bx"     //"eax","bx","cl"
        );

        printf("x = %s, y = %hd\n", x, y);
        //A = 65;
        //Z = 90;
return 0;
}
