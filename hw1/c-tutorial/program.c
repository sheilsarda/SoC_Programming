#include <stdio.h>
#include <stdlib.h>

int main()
{
	int x = 20;
	int *y;
	int *z;

	y = malloc(sizeof(int));
	y = 5;
	z = malloc(sizeof(int));
	z = 50;

	y = malloc(sizeof(int));
	y = 6;

	z = malloc(sizeof(int));
	z = 7;

	return 0;
}




