/*
term-sudoku: play sudoku in the terminal
Copyright (C) 2021 eyeofcthulhu

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.
*/

#include <stdio.h>
#include <curses.h>
#include <signal.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <time.h>

#define LINE_LEN 9
#define SUDOKU_LEN 81
#define ATTEMPTS_DEFAULT 5
#define VISUAL_SLEEP 10000

struct cursor;

void generate_sudoku();
int fill_remaining(int start);
void remove_nums();
void write_log(char* to_log);
int solve(char* sudoku_str, int start);
void solve_count(char* sudoku_to_solve, int* count);
void draw();
int check_validity(char* combined_solution);
int savestate();
void finish(int sig);
void finish_with_err_msg(char* msg);
void read_sudoku(char* sudoku);
void move_cursor();
void draw_sudokus();
