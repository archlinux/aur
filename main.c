#include "main.h"

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

	//Read Sudoku to screen
	read_sudoku(sudoku_str);

	refresh();

	while(true)
		sleep(1);

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

    //disable curosr
	curs_set(0);

    //allows Ctrl+c to quit the program
	cbreak();

    //don't echo the the getch() chars onto the screen
	noecho();

    //getch() doesn't wait for input and just returns ERR if no key is pressed
	nodelay(stdscr, true);

    //enable keypad (for arrow keys)
	keypad(stdscr, true);

    //color support

	start_color();
	init_pair(1, COLOR_WHITE, COLOR_BLACK);

	//grey color
	init_color(COLOR_BLUE, 200, 200, 200);	
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
