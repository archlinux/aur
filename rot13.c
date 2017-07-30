/**
 * @author Michael Duell <michael.duell@rub.de>
 *
 * Released under the MIT license.
 *
 * Copyright (c) 2017 Michael Duell <michael.duell@rub.de>
 * 
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
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
