#include <stdio.h> 
#include <stdlib.h>

void my_broken_function()
{
    int a = 10;
    int *p = NULL;
    printf("Value of a is %d\n", a);
    *p = 1;
}

int main() 
{
    printf("Welcome to the wonderful world of segfaults!\n");
    printf("Brace for impact! We are about to crash!\n");
    my_broken_function();
}
