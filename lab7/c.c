#include <stdio.h>

int pb(int n, int i)
{
i++;
//printf("%i\n",i);
if(n==1) return i;
if(n%2==0) return pb(n/2,i);
if(n%2==1) return pb(3*n+1,i);
}

void zadanie()
{
extern unsigned char wynik[65536];
int i=0,o=0;
wynik[o]=pb(o+1,i);
for(o=0;o<65536;o++) wynik[o]=pb(o+1,i);
//for(o=0;o<65536;o++) printf("wynik %i ",wynik[o]);
printf("wynik %i",wynik[2]);

}
