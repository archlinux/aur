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
#include <sys/types.h>
#include <pwd.h>
#include <dirent.h>

#define LINE_LEN 9
#define SUDOKU_LEN 81
#define ATTEMPTS_DEFAULT 5
#define VISUAL_SLEEP 10000
#define STR_LEN 80

struct cursor;
struct sudoku_cell_props;

//Sudoku generating and other sudoku-related things
struct sudoku_cell_props get_cell_props(int cell, char* sudoku_str);
void generate_sudoku();
int fill_remaining(int start);
void remove_nums();
int solve(char* sudoku_str);
void solve_count(char* sudoku_to_solve, int* count);
int solve_user_nums();
void generate_visually(char* sudoku_to_display);
int check_validity(char* combined_solution);

//Draw
void draw();
void read_sudoku(char* sudoku, int color_mode);
void move_cursor();
void draw_sudokus();
void read_notes();

//Utility
int savestate();
void finish(int sig);
void finish_with_err_msg(char* msg);
char* listfiles(char* dir);
