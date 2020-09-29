#include <stdlib.h>
#include <stdio.h>

struct s2 {
    float a;
    int b;
};

struct s1 {
    int c;
    struct s2 **d;
};

int main()
{
	struct s1 x[5];

	int b_addr = &((*(x->d))->b);

	printf("Address of b: %x\n", b_addr);
}
