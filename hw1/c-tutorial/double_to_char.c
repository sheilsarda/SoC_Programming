#include <stdio.h>
#include <stdlib.h>

int main()
{
    double a[] = {3.14, 2.71};

    unsigned char *to_print = (unsigned char*)a;
    for (int i = 0; i < 8; ++i)
    {	
	    printf("%x\n", *to_print);
	    to_print = to_print + sizeof(char);
    }
}
