#include "main.h"

struct cursor{
	int y;
	int x;
};

int main(int argc, char **argv){
	init();

	erase();
	refresh();
	move(0, 0);

	//Read Sudoku from given file
	FILE* input_file = fopen(argv[1], "r");
	char* sudoku_str = malloc((SUDOKU_LEN) * sizeof(char));
	fscanf(input_file, "%s", sudoku_str);
	fclose(input_file);

	//Abort if Sudoku is wrong length
	if(strlen(sudoku_str) != SUDOKU_LEN)
		finish_with_msg("Wrong length in Sudoku file\n");

	char* user_nums = malloc((SUDOKU_LEN) * sizeof(char));
	for(int i = 0; i < SUDOKU_LEN; i++)
		user_nums[i] = '0';

	struct cursor cursor;
	cursor.x = 0;
	cursor.y = 0;

	draw_sudokus(user_nums, sudoku_str);
	
	move_cursor(cursor);

	refresh();

	while(true){
		char key_press = getch();

		//Move on vim keys and bind to field size
		switch(key_press){
			case 'h':
				cursor.x = cursor.x - 1 < 0 ? cursor.x : cursor.x - 1;
				break;
			case 'j':
				cursor.y = cursor.y + 1 < LINE_LEN ? cursor.y + 1 : cursor.y;
				break;
			case 'k':
				cursor.y = cursor.y - 1 < 0 ? cursor.y : cursor.y - 1;
				break;
			case 'l':
				cursor.x = cursor.x + 1 < LINE_LEN ? cursor.x + 1 : cursor.x;
				break;
			case 'x':
			case '0':
				user_nums[cursor.y * LINE_LEN + cursor.x] = '0';
				break;
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

	finish(0);
}

//ncurses init logic
void init(){
    //on interrupt (Ctrl+c) exit
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

    //getch() doesn't wait for input and just returns ERR if no key is pressed
	//nodelay(stdscr, true);

    //enable keypad (for arrow keys)
	keypad(stdscr, true);

    //color support

	start_color();
	init_pair(1, COLOR_WHITE, COLOR_BLACK);
	init_pair(2, COLOR_BLUE, COLOR_BLACK);
}

void finish(int sig){
	endwin();
	if(sig == SIGSEGV)
		printf("Segfault\n");
	exit(0);
}

void finish_with_msg(char* msg){
	endwin();
	printf("%s", msg);
	exit(0);
}

//Read Sudoku to screen
void read_sudoku(char* sudoku){
	//Offset for horizontal seperators
	int yoff = 0;
	for(int y = 0; y < LINE_LEN; y++){
		//On every third vertical line, add seperator
		if(y % 3 == 0){
			//Add 4 for horizontal seperators 
			for(int i = 0; i < LINE_LEN + 4; i++){
				move(y + yoff, i);
				addch('-');
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
				move(y + yoff, x + xoff++);
				addch('|');
			}
			move(y + yoff, x + xoff);
			//Get digit from input string
			char current_digit = sudoku[y * LINE_LEN + x];
			//Draw zeros empty
			if(current_digit == '0')
				continue;
			else
				addch(current_digit);
		}
		//Add vertical seperator add the end
		move(y + yoff, LINE_LEN + 3);
		addch('|');
	}
	//Add horizontal seperator add the end
	for(int i = 0; i < LINE_LEN + 4; i++){
		move(LINE_LEN + yoff, i);
		addch('-');
	}
}

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
