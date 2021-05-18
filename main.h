#include <stdio.h>
#include <curses.h>
#include <signal.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>

#define LINE_LEN 9
#define SUDOKU_LEN 81

struct cursor;

void draw();
void check_validity();
int savestate();
void finish(int sig);
void finish_with_err_msg(char* msg);
void read_sudoku(char* sudoku);
void move_cursor();
void draw_sudokus();
