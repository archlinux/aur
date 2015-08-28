#include <stdlib.h>
#include <time.h>
#include <string.h>
#include <ncurses.h>
#include <unistd.h>
#include <pwd.h>

#define ROWS 30
#define COLS 120
#define STARTING_SIZE 3
#define MAX_SCORE_LENGTH 9
#define FRUIT_POINTS 7
#define DEFAULT_SPEED 28000
#define HARD_SPEED 22000
#define EASY_SPEED 30000
#define STORE -1
#define LEAVE_OR_LOSE 1
#define SNAKE_COLOR 2
#define FRUIT_COLOR 1
#define SNAKE_CHAR "O"
#define FRUIT_CHAR "*"
/* eigenvectors associated to snake movements */
#define RIGHT 10
#define LEFT -10
#define UP -1
#define DOWN 1

/* Coordinates of snake's head and tail */
struct point {
    int x;
    int y;
};

/* Program state struct */
#pragma pack(push, 1)
struct state {
    int size;
    int delay;
    struct point snake_head;
    struct point snake_tail;
    struct point fruit_coord;
};
#pragma pack(pop)

static void starting_questions(int argc, char *argv[]);
static void check_term_size(int rowtot, int coltot);
static void screen_init(int rowtot, int coltot);
static void screen_end(int rowtot, int coltot, int quit_value);
static void print_initial_snake(int x, int y);
static void fruit_gen(void);
static void grid_init(void);
static void change_directions(void);
static void eat_fruit(void);
static void snake_move(int *quit_value);
static void snake_grow(void);
static void main_cycle(int *quit_value);
static void colored_print(WINDOW *win, int x, int y, char *c, int color);
static void init_func(char *argv);
static void store_and_exit(void);
static void store_score(void);
static void print_score_list(void);
static void manage_memory_error(void);
static int *safe_realloc(int *ptr, size_t size);

/* Give default "new match" values to program state struct */
static struct state ps = {
    .delay = DEFAULT_SPEED,
    .size = STARTING_SIZE,
    .snake_head = {ROWS/2, COLS/2},
    .snake_tail = {ROWS/2, COLS/2 - (STARTING_SIZE - 1)},
    .fruit_coord = {-1, -1}
};
static WINDOW *field, *score;
static int *snake;

int main(int argc, char *argv[])
{
    int rowtot, coltot, quit_value = 0;

    starting_questions(argc, argv);
    srand(time(NULL));
    initscr();
    getmaxyx(stdscr, rowtot, coltot);
    check_term_size(rowtot, coltot);
    screen_init(rowtot, coltot);
    init_func(argv[1]);
    grid_init();
    wrefresh(field);
    while (!quit_value) {
        main_cycle(&quit_value);
    }
    screen_end(rowtot, coltot, quit_value);
    free(snake);
    return 0;
}

static void starting_questions(int argc, char *argv[])
{
    if ((argc == 1) || (((strcmp(argv[1],"-n")) != 0) && ((strcmp(argv[1],"-r")) != 0) && ((strcmp(argv[1],"-s")) != 0))) {
        printf("Helper message.\nStart this program with:\n\t'-n $level'\tif you want to play a new game, where '$level' is one between easy and hard.\n\t\t\tLeaving only '-n' will play default level;\n\t'-r'\t\tto resume your last saved game;\n\t'-s'\t\tto view your top scores.\n");
        exit(0);
    }
    if (((strcmp(argv[1],"-s")) == 0)) {
        print_score_list();
        exit(0);
    }
    if (argc == 3) {
        if ((((strcmp(argv[argc - 1],"easy")) != 0)) && (((strcmp(argv[argc - 1],"hard")) != 0))) {
            printf ("Level not recognized. Playing at default level.\n");
            sleep(1);
        } else {
            if (((strcmp(argv[2],"easy")) == 0)) {
                ps.delay = EASY_SPEED;
            } else {
                ps.delay = HARD_SPEED;
            }
        }
    }
}

static void check_term_size(int rowtot, int coltot)
{
    if ((rowtot < ROWS + 6) || (coltot < COLS + 2)) {
        clear();
        endwin();
        delwin(stdscr);
        printf("This screen has %d rows and %d columns. Enlarge it.\n", rowtot, coltot);
        printf("You need at least %d rows and %d columns.\n", ROWS + 6, COLS + 2);
        exit(1);
    }
}

static void screen_init(int rowtot, int coltot)
{
    start_color();
    init_pair(1, COLOR_RED, COLOR_BLACK);
    init_pair(2, COLOR_GREEN, COLOR_BLACK);
    init_pair(3, COLOR_YELLOW, COLOR_BLACK);
    init_pair(4, COLOR_CYAN, COLOR_BLACK);
    raw();
    noecho();
    /* print sub windows centered */
    field = subwin(stdscr, ROWS + 2, COLS + 2, (rowtot - 6 - ROWS) / 2, (coltot - COLS - 2) / 2);
    score = subwin(stdscr, 2 + 2, coltot, rowtot - 4, 0);
    keypad(field, TRUE);
    nodelay(field, TRUE);
    wattron(field, COLOR_PAIR(4));
    wattron(score, COLOR_PAIR(3));
    wborder(field, '|', '|', '-', '-', '+', '+', '+', '+');
    wborder(score, '|', '|', '-', '-', '+', '+', '+', '+');
    wattroff(field, COLOR_PAIR);
    mvwprintw(score, 2, 1, "q anytime to *rage* quit. Arrow keys to move. s to save current game and leave.");
    mvwprintw(score, 1, 1, "Points: ");
    if (ps.size != STARTING_SIZE) {
        wattron(score, A_BOLD);
    }
    mvwprintw(score, 1, strlen("Points: ") + 1, "%d", (ps.size - STARTING_SIZE) * FRUIT_POINTS);
    wattron(field, A_BOLD);
    wattron(score, A_BOLD);
    colored_print(field, -1, -1, "Snake", 4);
    mvwprintw(score, 0, 0, "Score");
    wrefresh(score);
}

static void screen_end(int rowtot, int coltot, int quit_value)
{
    char exitmsg[] = "Leaving...bye! See you later :)";

    wclear(field);
    wclear(score);
    delwin(field);
    delwin(score);
    attron(COLOR_PAIR(rand() % 4 + 1));
    attron(A_BOLD);
    if (quit_value == LEAVE_OR_LOSE) {
        if (ps.size != STARTING_SIZE) {
            store_score();
        }
        mvprintw(rowtot / 2, (coltot - strlen("You scored %d points!")) / 2, "You scored %d points!", (ps.size - STARTING_SIZE) * FRUIT_POINTS);
    } else {
        store_and_exit();
        mvprintw(rowtot / 2, (coltot - strlen(exitmsg)) / 2, "%s", exitmsg);
    }
    refresh();
    sleep(1);
    attroff(COLOR_PAIR);
    attroff(A_BOLD);
    endwin();
    delwin(stdscr);
}

static void print_initial_snake(int x, int y)
{
    int j;

    colored_print(field, x, y, SNAKE_CHAR, SNAKE_COLOR);
    for (j = 1; j < ps.size; j++) {
        x = ((x - (snake[j] % 10)) + ROWS) % ROWS;
        y = ((y - (snake[j] / 10)) + COLS) % COLS;
        colored_print(field, x, y, SNAKE_CHAR, SNAKE_COLOR);
    }
}

static void fruit_gen(void)
{
    int j, tot = ROWS * COLS;

    if ((tot) == ps.size) {
        return;
    }
    j = rand() % (tot);
    do {
        ps.fruit_coord.x = j / COLS;
        ps.fruit_coord.y = j - (ps.fruit_coord.x * COLS);
        j = (j + 1 + (tot)) % (tot);
    } while ((mvwinch(field,  ps.fruit_coord.x + 1,  ps.fruit_coord.y + 1) & A_CHARTEXT) == *SNAKE_CHAR);
    colored_print(field, ps.fruit_coord.x, ps.fruit_coord.y, FRUIT_CHAR, FRUIT_COLOR);
}

static void grid_init(void)
{
    print_initial_snake(ps.snake_head.x, ps.snake_head.y);
    if (ps.fruit_coord.x == -1) {
        fruit_gen();
    } else {
        colored_print(field, ps.fruit_coord.x, ps.fruit_coord.y, FRUIT_CHAR, FRUIT_COLOR);
    }
}

static void snake_move(int *quit_value)
{
    char c;

    ps.snake_head.x = ((ps.snake_head.x + snake[0] % 10) + ROWS) % ROWS;
    ps.snake_head.y = ((ps.snake_head.y + snake[0] / 10) + COLS) % COLS;
    c = mvwinch(field, ps.snake_head.x + 1, ps.snake_head.y + 1) & A_CHARTEXT;
    colored_print(field, ps.snake_head.x, ps.snake_head.y, SNAKE_CHAR, SNAKE_COLOR);
    if (c == *FRUIT_CHAR) {
        eat_fruit();
        mvwprintw(score, 1, strlen("Points: ") + 1, "%d", (ps.size - STARTING_SIZE) * FRUIT_POINTS);
        wrefresh(score);
    } else {
        mvwprintw(field, ps.snake_tail.x + 1,  ps.snake_tail.y + 1, " ");
        ps.snake_tail.x = ((ps.snake_tail.x + snake[ps.size - 1] % 10) + ROWS) % ROWS;
        ps.snake_tail.y = ((ps.snake_tail.y + snake[ps.size - 1] / 10) + COLS) % COLS;
        if (c == *SNAKE_CHAR) {
            *quit_value = 1;
            return;
        }
    }
}

static void change_directions(void)
{
    int i;

    for (i = ps.size - 1; i > 0; i--) {
        snake[i] = snake[i - 1];
    }
}

static void main_cycle(int *quit_value)
{
    wmove(field, ps.snake_head.x + 1, ps.snake_head.y + 1);
    switch (wgetch(field)) {
        case KEY_LEFT:
            if (snake[0] != RIGHT) {
                snake[0] = LEFT;
            }
            break;
        case KEY_RIGHT:
            if (snake[0] != LEFT) {
                snake[0] = RIGHT;
            }
            break;
        case KEY_UP:
            if (snake[0] != DOWN) {
                snake[0] = UP;
            }
            break;
        case KEY_DOWN:
            if (snake[0] != UP) {
                snake[0] = DOWN;
            }
            break;
        case 's':
            *quit_value = STORE;
            break;
        case 'q': /* q to exit */
            *quit_value = LEAVE_OR_LOSE;
            break;
    }
    snake_move(quit_value);
    change_directions();
    usleep(ps.delay);
}

static void eat_fruit(void)
{
    ps.size++;
    snake_grow();
    fruit_gen();
}

static void snake_grow(void)
{
    snake = safe_realloc(snake, ps.size * sizeof(int));
    snake[ps.size - 1] = snake[ps.size - 2];
}

static void colored_print(WINDOW *win, int x, int y, char *c, int color)
{
    wattron(win, COLOR_PAIR(color));
    mvwprintw(win, x + 1, y + 1, c);
    wattroff(win, COLOR_PAIR);
}

static void init_func(char *argv)
{
    char *path_resume_file = strcat(getpwuid(getuid())->pw_dir, "/.local/share/snake.txt");
    FILE *f = NULL;
    int i, resume = strcmp(argv, "-r");

    if ((resume == 0) && (f = fopen(path_resume_file, "r"))) {
        fread(&ps, sizeof(int), sizeof(struct state) / sizeof(int), f);
    }
    snake = safe_realloc(snake, sizeof(int) * ps.size);
    if (f) {
        fread(snake, sizeof(int), ps.size, f);
        fclose(f);
        remove(path_resume_file);
    } else {
        for (i = 0; i < ps.size; i++) {
            snake[i] = RIGHT;
        }
    }
}

static void store_and_exit(void)
{
    char *path_resume_file = strcat(getpwuid(getuid())->pw_dir, "/.local/share/snake.txt");
    FILE *f = fopen(path_resume_file, "w");

    fwrite(&ps, sizeof(int), sizeof(struct state) / sizeof(int), f);
    fwrite(snake, sizeof(int), ps.size, f);
    fclose(f);
}

static void store_score(void)
{
    char *path_score_file = strcat(getpwuid(getuid())->pw_dir, "/.local/share/snake_score.txt");
    FILE *f = NULL;
    int i = 0, points = (ps.size - STARTING_SIZE) * FRUIT_POINTS, old_points;
    long int len;

    if ((f = fopen(path_score_file, "r+"))) {
        while ((i < MAX_SCORE_LENGTH) && (!feof(f))) {
            len = ftell(f);
            fscanf(f, "%d\n", &old_points);
            i++;
            if (old_points < points) {
                fseek(f, len, SEEK_SET);
                fprintf(f, "%d\n", points);
                points = old_points;
            }
        }
        if (i < MAX_SCORE_LENGTH) {
            fprintf(f, "%d\n", points);
        }
    } else {
        f = fopen(path_score_file, "w");
        fprintf(f, "%d\n", points);
    }
    fclose(f);
}

static void print_score_list(void)
{
    char *path_score_file = strcat(getpwuid(getuid())->pw_dir, "/.local/share/snake_score.txt");
    FILE *f = NULL;
    int i, score;

    if ((f = fopen(path_score_file, "r"))) {
        printf("\t\tTop scores:\n");
        for (i = 0; (!feof(f) && (i < MAX_SCORE_LENGTH)); i++) {
            fscanf(f, "%d\n", &score);
            printf("\t\t%d) %d\n", i + 1, score);
        }
        fclose(f);
    } else {
        printf("No score list found.\n");
    }
}

static void manage_memory_error(void)
{
    free(snake);
    wclear(field);
    wclear(score);
    delwin(field);
    delwin(score);
    endwin();
    delwin(stdscr);
    printf("Memory allocation failed. Leaving.\n");
    exit(EXIT_FAILURE);
}

static int *safe_realloc(int *ptr, size_t size)
{
    if (!(ptr = realloc(ptr, size))) {
        manage_memory_error();
    }
    return ptr;
}