#include "main.h"

struct cursor{
	int y;
	int x;
};

int main(int argc, char **argv){
	//--- USER INIT LOGIC ---

	//Read Sudoku from given file
	FILE* input_file = fopen(argv[1], "r");
	if(input_file == NULL)
		finish_with_err_msg("Error accessing file\n");
	char* sudoku_str = malloc((SUDOKU_LEN) * sizeof(char));
	fscanf(input_file, "%s", sudoku_str);
	fclose(input_file);

	//Abort if Sudoku is wrong length
	if(strlen(sudoku_str) != SUDOKU_LEN)
		finish_with_err_msg("Wrong length in Sudoku file\n");

	char* user_nums = malloc((SUDOKU_LEN) * sizeof(char));
	for(int i = 0; i < SUDOKU_LEN; i++)
		user_nums[i] = '0';

	struct cursor cursor;
	cursor.x = 0;
	cursor.y = 0;

	//--- CURSES INIT LOGIC ---

    //on interrupt (Ctrl+c) exit (call finish)
	signal(SIGINT, finish);
	signal(SIGSEGV, finish);

    //init
	initscr();

    //return key doesn't become newline
	nonl();

    //cursor
	curs_set(2);

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

	draw_sudokus(user_nums, sudoku_str);
	
	move_cursor(cursor);

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
			//delete a character
			case 'x':
			case '0':
				user_nums[cursor.y * LINE_LEN + cursor.x] = '0';
				break;
			case 'q':
				finish(0);
			//Input numbers into the user sudoku field
			default:
				//Check if the key is a number (not zero) in aasci chars
				if(key_press >= 0x31 && key_press <= 0x39)
					user_nums[cursor.y * LINE_LEN + cursor.x] = key_press;
				break;
		}

		erase();

		draw_sudokus(user_nums, sudoku_str);

		move_cursor(cursor);
	}
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
			for(int i = 0; i < LINE_LEN + 4; i++){
				mvaddch(y + yoff, i, '-');
			}	
			//Increment offset
			yoff++;
		}
		//Offset for vertical seperators
		int xoff = 0;
		for(int x = 0; x < LINE_LEN; x++){
			//On every third character, add a pipe
			if(x % 3 == 0){
				//Move and increment
				mvaddch(y + yoff, x + xoff++, '|');
			}
			move(y + yoff, x + xoff);
			//Get digit from input string
			char current_digit = sudoku[y * LINE_LEN + x];
			//Draw zeros empty
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
void move_cursor(struct cursor cursor){
	move(cursor.y + (cursor.y / 3) + 1, cursor.x + (cursor.x / 3) + 1);
}

//Draw user numbers and the given sudoku in different colors
//Draw the user numbers under the given sudoku so the latter can't be overwritten
void draw_sudokus(char* user_nums, char* sudoku_str){
	attron(COLOR_PAIR(2));
	read_sudoku(user_nums);

	attron(COLOR_PAIR(1));
	read_sudoku(sudoku_str);
}
