#include "main.h"

int main(int argc, char **argv){
	init();
	sleep(5);
	finish();
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
