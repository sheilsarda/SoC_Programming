#include <stdio.h>
#include <stdlib.h>

void temp(int i) {
    int a[2];
    int b[3];
    int *c;
    int *d;
    c = (int *)malloc(sizeof(int) * 4);
    d = (int *)malloc(sizeof(int) * 5);

    // print addresses for arrays here....

    printf("Address for a-d:\n");
    printf("%x\n", &a[0]);
    printf("%x\n", &b[0]);

    printf("%x\n", c);
    printf("%x\n", d);

    return;
}

int main()
{
	temp(1);
	return 0;
}
