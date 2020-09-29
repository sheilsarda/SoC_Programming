#include "stdio.h"
#include "stdlib.h"

int main(int argc, char** argv) {
    unsigned char a[3] = {0xFF, 0x01, 73};
    unsigned char sum;
    unsigned int intsum;

    signed char sa[3] = {127, 1, 33};
    signed char ssum;
    signed int sintsum;

    fprintf(stdout, "Unsigned:\n");
    for (int i = 0; i < 3; i++)
        for (int j = 0; j < 3; j++) {
            sum = a[i] + a[j];
            intsum = a[i] + a[j];
            fprintf(stdout, "in decimal: %d+%d=%d (intsum=%d)\t", a[i], a[j], sum, 
			    intsum);
	    fprintf(stdout, "in hexadecimal: %x+%x=%x (intsum=%x)\n", a[i], a[j], sum,
                            intsum);
	}

    fprintf(stdout, "Signed:\n");
    for (int i = 0; i < 3; i++)
	for (int j = 0; j < 3; j++) {
	      ssum = sa[i] + sa[j];
	      sintsum = sa[i] + sa[j];
	      fprintf(stdout, "in decimal: %d+%d=%d (intsum=%d)\t", sa[i], sa[j], ssum,
	            sintsum);
	      fprintf(stdout, "in hexadecimal: %x+%x=%x (intsum=%x)\n", sa[i], sa[j],
	            ssum, sintsum);
        }
}
