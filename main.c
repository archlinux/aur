#include "main.h"
#include <curses.h>

struct cursor{
	int y;
	int x;
};

char* filename;
char* user_nums;
char* sudoku_str;
struct cursor cursor;
char* statusbar;

int main(int argc, char **argv){
	//--- USER INIT LOGIC ---
	filename = argv[1];

	//Read Sudoku from given file
	FILE* input_file = fopen(argv[1], "r");
	if(input_file == NULL)
		finish_with_err_msg("Error accessing file\n");

	sudoku_str = malloc((SUDOKU_LEN) * sizeof(char));
	user_nums = malloc((SUDOKU_LEN) * sizeof(char));

	fscanf(input_file, "%s\n%s", sudoku_str, user_nums);
	fclose(input_file);

	//Abort if Sudoku is wrong length
	if((strlen(sudoku_str) + strlen(user_nums)) != (SUDOKU_LEN * 2))
		finish_with_err_msg("Wrong length in Sudoku file\n");

	cursor.x = 0;
	cursor.y = 0;

	statusbar = "File opened";

	//--- CURSES INIT LOGIC ---

    //on interrupt and segfault (Ctrl+c) exit (call finish)
	signal(SIGINT, finish);
	signal(SIGSEGV, finish);

    //init
	initscr();

    //return key doesn't become newline
	nonl();

    //cursor
	curs_set(1);

    //allows Ctrl+c to quit the program
	cbreak();

    //don't echo the the getch() chars onto the screen
	noecho();

    //enable keypad (for arrow keys)
	keypad(stdscr, true);

    //color support
	if(!has_colors())
		finish_with_err_msg("Your terminal doesn't support color\n");
	start_color();
	init_pair(1, COLOR_WHITE, COLOR_BLACK);
	init_pair(2, COLOR_BLUE, COLOR_BLACK);

	draw();

	//Main loop: wait for keypress, then process it
	while(true){
		char key_press = getch();

		//Move on vim keys and bind to field size
		switch(key_press){
			case 'h':
				cursor.x = cursor.x - 1 < 0 ? cursor.x : cursor.x - 1;
				break;
			case 'j':
				cursor.y = cursor.y + 1 >= LINE_LEN ? cursor.y : cursor.y + 1 ;
				break;
			case 'k':
				cursor.y = cursor.y - 1 < 0 ? cursor.y : cursor.y - 1;
				break;
			case 'l':
				cursor.x = cursor.x + 1 >= LINE_LEN ? cursor.x : cursor.x + 1 ;
				break;
			case 's':
				savestate();
				statusbar = "Saved";
				break;
			case 'q':
				finish(0);
			//Input numbers into the user sudoku field
			default:
				//Check if the key is a number (not zero) in aasci chars or 'x' and if the cursor is not an a field filled by the puzzle

				//Check if the field is empty in the puzzle
				if(sudoku_str[cursor.y * LINE_LEN + cursor.x] == '0'){
					//check for numbers
					if(key_press >= 0x30 && key_press <= 0x39 && user_nums[cursor.y * LINE_LEN + cursor.x] != key_press){ 
						user_nums[cursor.y * LINE_LEN + cursor.x] = key_press;
						statusbar = "*Not saved";
					}
					//check for x
					else if(key_press == 'x' && user_nums[cursor.y * LINE_LEN + cursor.x] != '0'){
						user_nums[cursor.y * LINE_LEN + cursor.x] = '0';
						statusbar = "*Not saved";
					}
				}
				break;
		}

		draw();

		move_cursor(cursor);
	}
}

void draw(){
	erase();
	draw_sudokus(user_nums, sudoku_str);
	mvaddstr(LINE_LEN + 4, 0, statusbar);
	move_cursor(cursor);
}

//Write changed values back to file
int savestate(){
	FILE* savestate = fopen(filename, "w");

	if(savestate == NULL){
		finish_with_err_msg("Error accessing file\n");
		return 1;
	}

	fprintf(savestate, "%s\n%s", sudoku_str, user_nums);
	fclose(savestate);
	return 0;
}

void finish(int sig){
	endwin();
	if(sig == SIGSEGV){
		printf("Segfault\n");
		exit(1);
	}
	exit(0);
}

void finish_with_err_msg(char* msg){
	endwin();
	printf("%s", msg);
	exit(1);
}

//Read Sudoku to screen
void read_sudoku(char* sudoku){
	//Offset for horizontal seperators
	int yoff = 0;
	for(int y = 0; y < LINE_LEN; y++){
		//On every third vertical line, add seperator
		if(y % 3 == 0){
			//Add 4 horizontal seperators 
			for(int i = 0; i < LINE_LEN + 4; i++)
				mvaddch(y + yoff, i, '-');
			//Increment offset
			yoff++;
		}
		//Offset for vertical seperators
		int xoff = 0;
		for(int x = 0; x < LINE_LEN; x++){
			//On every third character, add a pipe
			if(x % 3 == 0){
				//Move, print and increment
				mvaddch(y + yoff, x + xoff++, '|');
			}
			move(y + yoff, x + xoff);
			//Get digit from input string
			char current_digit = sudoku[y * LINE_LEN + x];
			//Draw everything except zeros
			if(current_digit != '0')
				addch(current_digit);
		}
		//Add vertical seperator add the end
		mvaddch(y + yoff, LINE_LEN + 3, '|');
	}
	//Add horizontal seperator add the end
	for(int i = 0; i < LINE_LEN + 4; i++){
		mvaddch(LINE_LEN + yoff, i, '-');
	}
}

//Move cursor but don't get into the seperators
void move_cursor(){
	move(cursor.y + (cursor.y / 3) + 1, cursor.x + (cursor.x / 3) + 1);
}

//Draw user numbers and the given sudoku in different colors
//Draw the user numbers under the given sudoku so the latter can't be overwritten
void draw_sudokus(){
	attron(COLOR_PAIR(2));
	read_sudoku(user_nums);

	attron(COLOR_PAIR(1));
	read_sudoku(sudoku_str);
}
