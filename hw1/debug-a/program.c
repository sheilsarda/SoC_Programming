#include <stdio.h>
#include <stdlib.h>

int len(char* s) {
    int l = 0;
    
    while (*s){ 
	l++;
	s++;
    }
    
    return l;
}

int rot13(int l) {
    if (l >= 'A' && l <= 'Z') l = (l - 'A' + 13) % 26 + 'A';
    if (l >= 'a' && l <= 'z') l = (l - 'a' + 13) % 26 + 'a';
    return l;
}

char* msg = "Jryy Qbar!!!\n";

int main() {
    int i = 0;
    printf("The secret message is: ");
    while (i < len(msg)) printf("%c", rot13(msg[i++]));

    return 0;
}
