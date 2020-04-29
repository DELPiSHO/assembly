/*
 * Program sprawdzający wynik konkursu.
 * Proszę kompilować przez:
 *   gcc -m32 testuj.c nr_indeksu.s
 * lub np.
 *   gcc -m32 testuj.c nr_indeksu.c
 * 
 * Plik wynikowy "a.out" nie może mieć rozmiaru większego niż 25kB.
 */
#include <time.h>
#include <stdio.h>

#define ROZMIAR 65536

unsigned char wynik[ROZMIAR];

void zadanie();

/*
 * Wypełnienie tablicy "wynik" przypadkowymi wartościami.
 */
static void wypelnij() {
	struct timespec ts;
	clock_gettime(CLOCK_MONOTONIC, &ts);
	srand(ts.tv_nsec);
	int i;
	for (i = 0; i < ROZMIAR; i++) {
		wynik[i] = (unsigned char) rand();
	}
}

/*
 * Porównanie wartości w tablicy "wynik" z wzorcowym wynikiem.
 */
static int sprawdz() {
	int i;
	for (i = 0; i < ROZMIAR; i++) {
		int n = i+1;
		unsigned char m = 1;
		while (m < 255 && n != 1) {
			if (n % 2 == 0) {
				n = n/2;
			} else {
				n = 3*n+1;
			}
			m++;
		}
		if (wynik[i] != m) {
			return 0;
		}
	}
	return 1;
}

int main(int argc, char **argv) {
	// Wypełnienie tablicy przypadkowymi wartościami
	wypelnij();
	
	// Pomiar czasu
	struct timespec ts0;
	struct timespec ts1;
	if (clock_gettime(CLOCK_MONOTONIC, &ts0) != 0) {
		fprintf(stderr, "Błąd pomiaru czasu");
		return 1;
	}
	
	zadanie();
	
	// Pomiar czasu
	if (clock_gettime(CLOCK_MONOTONIC, &ts1) != 0) {
		fprintf(stderr, "Błąd pomiaru czasu");
		return 1;
	}
	
	// Kontrola wyniku
	if (sprawdz()) {
		// Wyprowadzenie czasu wykonania
		long long tick0 = ts0.tv_nsec/1000 + ts0.tv_sec*1000000;
		long long tick1 = ts1.tv_nsec/1000 + ts1.tv_sec*1000000;
		printf("%lli", tick1-tick0);
		return 0;
	} else {
		fprintf(stderr, "Błąd wykonanych obliczeń");
		return 1;
	}
}
