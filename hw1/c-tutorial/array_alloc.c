#include <stdio.h>
#include <stdlib.h>

int main()
{
	int local_arr[8];
	for(int i = 0; i < 8; i++)
	{
		local_arr[i] = (8-i)*10;
	}

	int *ptr1 = &local_arr[3];
	int *ptr2 = &local_arr[7];

	// print array using ptrs
	for(int i = 7; i >= 0; i--)
	{
		printf("%d\n", *(ptr2 - i));
	}

	printf("------\n");

	int **ptr3 = &ptr2;
	for(int i = 7; i >= 0; i--)
	{
		printf("%d\n", *(*ptr3 - i));
	}
	
}


