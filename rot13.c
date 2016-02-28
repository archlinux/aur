/**
 * @author Michael Duell <michael.duell@rub.de>
 *
 * Released under the WTFPL.
 *
 *            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
 *  TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
 * 
 *  0. You just DO WHAT THE FUCK YOU WANT TO.
 **/

#include <stdlib.h>
#include <stdio.h>
#include <string.h>

#define ALPHABET_SIZE 26
#define LOWER_CASE_BIT 32
#define ROTATION 13
#define OFFSET 'a'

int islower_ascii(unsigned cnum) {
    return cnum >= OFFSET;
}

char transpose(char c){
    unsigned cnum = (unsigned)c;
    unsigned offset = (unsigned)OFFSET;
    
    if ((cnum | LOWER_CASE_BIT) - OFFSET < ALPHABET_SIZE) {
        if (!islower_ascii(cnum)) {
            offset -= LOWER_CASE_BIT;
        }
        cnum -= offset;
        cnum += ROTATION;
        cnum %= ALPHABET_SIZE;
        cnum += offset;
    }

    return (char)cnum;
}

int main(int argc, char **argv)
{
    char c;
    
    if (argc > 1) {
        for (int i = 1; i < argc; i++) {
            for (int j = 0; j < strlen(argv[i]); j++) {
                putchar(transpose(argv[i][j]));
            }
            putchar(' ');
        }
        putchar('\n');
    } else {
        while ((c = getchar()) != EOF) {
            putchar(transpose(c));
        }
    }
    
    return EXIT_SUCCESS;
}
