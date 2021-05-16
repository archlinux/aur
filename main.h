#include <stdio.h>
#include <curses.h>
#include <signal.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>

#define LINE_LEN 9
#define SUDOKU_LEN 81

void init();
void finish(int sig);
void finish_with_msg(char* msg);
void read_sudoku(char* sudoku);
