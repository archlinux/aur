#include <stdlib.h>
#include <time.h>
#include <string.h>
#include <ncurses.h>
#include <unistd.h>

#define N 20
#define BOMB_CHAR "*"
#define COVERED_CHAR "-"

/* Using this struct to lower number of vars passed to functions */
struct values {
    int a;
    int b;
};

/* program state struct */
struct program_state {
    int bombs;
    int victory;
    int correct;
    int quit;
};

static void screen_init(int a[][N], struct values dim, struct values *fixed_space);
static void grid_init(int a[][N],struct values fixed_space);
static void num_bombs(void);
static int main_cycle(int a[][N], int *i, int *k, struct values fixed_space);
static void cascadeuncover(int a[][N], int i, int k, struct values fixed_space);
static int checknear(int a[][N], int i, int k);
static void manage_space_press(int a[][N], int i, int k, struct values fixed_space);
static void manage_enter_press(int a[][N], int i, int k, char c);
static void victory_check(int a[][N], struct values dim);

/* Global variables */
static struct program_state ps = {
    .victory = 1,
    .correct = 1,
    .quit = 0,
};
static WINDOW *field, *score;

int main(void)
{
    int i = 0, k = 0;
    int a[N][N] = {{}};
    struct values dim; /* dim of the screen */
    struct values fixed_space; /* Values to fit terminal size */
    srand(time(NULL));
    num_bombs();
    initscr();
    getmaxyx(stdscr, dim.a, dim.b);
    /* check terminal size */
    if ((dim.a < N + 6) || (dim.b < N + 2)) {
        clear();
        endwin();
        printf("This screen has %d rows and %d columns. Enlarge it.\nYou need at least %d rows and %d columns.\n", dim.a, dim.b, N + 6, N + 2);
        return 1;
    }
    screen_init(a, dim, &fixed_space);
    grid_init(a, fixed_space);
    while ((ps.victory) && (ps.bombs > 0) && (!ps.quit))
        main_cycle(a, &i, &k, fixed_space);
    victory_check(a, dim);
    return 0;
}

static void screen_init(int a[][N], struct values dim, struct values *fixed_space)
{
    int rows, cols;
    start_color();
    init_pair(1, COLOR_RED, COLOR_BLACK);
    init_pair(2, COLOR_GREEN, COLOR_BLACK);
    init_pair(3, COLOR_YELLOW, COLOR_BLACK);
    init_pair(4, COLOR_BLUE, COLOR_BLACK);
    init_pair(5, COLOR_MAGENTA, COLOR_BLACK);
    init_pair(6, COLOR_CYAN, COLOR_BLACK);
    raw();
    noecho();
    /* Magic numbers explanation:
     * (dim.a - 6) : 6 -> 4 lines of borders + 2 lines of score WIN
     * (dim.b - 2) : only 2 lines of borders
     * rows and cols -> + 3 : real dimensions of the field subwin,
     * calculated as N - 1 spaces between N elements of the int (both vertical
     * and horizontal, multiplied fixed_space (either vertical or horizontal)
     * + 3: 2 for the borders and 1 for the first elem
     Graphicallly explained: |O O O O O| -> 5 elements, with a total number
     of 4 spaces between them, plus 2 for the borders, plus 1 for the first elem. */
    fixed_space->a = (dim.a - 6) / N;
    fixed_space->b = (dim.b - 2) / N;
    rows = ((N - 1) * fixed_space->a) + 3;
    cols = ((N - 1) * fixed_space->b) + 3;
    /* create sub windows centered */
    field = subwin(stdscr, rows, cols, (dim.a - 4 - rows) / 2, (dim.b - cols) / 2);
    score = subwin(stdscr, 2 + 2, dim.b, dim.a - 4, 0);
    keypad(field, TRUE);
    wborder(field, '|', '|', '-', '-', '+', '+', '+', '+');
    wborder(score, '|', '|', '-', '-', '+', '+', '+', '+');
    mvwprintw(score, 2, 1, "Enter to put a bomb (*). Space to uncover. q anytime to *rage* quit.");
    mvwprintw(score, 1, 1, "Still %d bombs.", ps.bombs);
    wrefresh(score);
}

static void grid_init(int a[][N], struct values fixed_space)
{
    int i, k, row, col;
    /* Generates random bombs */
    for (i = 0; i < ps.bombs; i++) {
        do {
            row = rand()%N;
            col = rand()%N;
        } while (a[row][col] == -1);
        a[row][col] = -1;
    }
    wattron(field, COLOR_PAIR(2));
    for (i = 0; i < N; i++) {
        for (k = 0; k < N; k++) {
            mvwprintw(field, (i * fixed_space.a) + 1, (k * fixed_space.b) + 1, COVERED_CHAR);
            if (a[i][k] != -1)
                a[i][k] = checknear(a, i, k);
        }
    }
     wattroff(field, COLOR_PAIR);
}

static void num_bombs(void)
{
    printf("Select level.\n1 for easy, 2 for medium, 3 for hard, 4 for...good luck!.\n");
    scanf("%d", &ps.bombs);
    switch (ps.bombs) {
        case 1:
            ps.bombs = 25;
            break;
        case 2:
            ps.bombs = 40;
            break;
        case 3:
            ps.bombs = 65;
            break;
        case 4:
            ps.bombs = 80;
            break;
        default:
            return num_bombs();
    }
}

static int main_cycle(int a[][N], int *i, int *k, struct values fixed_space)
{
    char c = mvwinch(field, (*i * fixed_space.a) + 1, (*k * fixed_space.b) + 1) & A_CHARTEXT;
    wmove(field, (*i * fixed_space.a) + 1, (*k * fixed_space.b) + 1);
    switch (wgetch(field)) {
        case KEY_LEFT:
            (*k)--;
            if (*k < 0)
                *k = N - 1;
            break;
        case KEY_RIGHT:
            (*k)++;
            if (*k > N - 1)
                *k = 0;
            break;
        case KEY_UP:
            (*i)--;
            if (*i < 0)
                *i = N - 1;
            break;
        case KEY_DOWN:
            (*i)++;
            if (*i > N - 1)
                *i = 0;
            break;
        case 32: /* space to uncover */
            if (c == *COVERED_CHAR)
                manage_space_press(a, *i, *k, fixed_space);
            break;
        case 10: /* Enter to  identify a bomb */
            if (c == *COVERED_CHAR || c == *BOMB_CHAR)
                manage_enter_press(a, *i, *k, c);
            break;
        case 'q': /* q to exit */
            ps.quit = 1;
            break;
    }
    return 1;
}

static void cascadeuncover(int a[][N], int i, int k, struct values fixed_space)
{
    int m, n;
    char c = mvwinch(field, (i * fixed_space.a) + 1, (k * fixed_space.b) + 1) & A_CHARTEXT;
    if ((i >= 0) && (i < N) && (k >= 0) && (k < N) && (c == *COVERED_CHAR)) {
        wmove(field, (i * fixed_space.a) + 1, (k * fixed_space.b) + 1);
        if (a[i][k] != 0) {
            if (a[i][k] >= 4)
                wattron(field, COLOR_PAIR(1));
            else
                wattron(field, COLOR_PAIR(a[i][k] + 3));
            wprintw(field, "%d", a[i][k]);
            wattroff(field, COLOR_PAIR);
        } else {
            wattron(field, A_BOLD);
            wattron(field, COLOR_PAIR(3));
            wprintw(field, "%d", a[i][k]);
            wattroff(field, COLOR_PAIR);
            wattroff(field, A_BOLD);
            for (m = -1; m < 2; m++) {
                for (n = -1; n < 2; n++)
                    cascadeuncover(a, i + m, k + n, fixed_space);
            }
        }
    }
}

static int checknear(int a[][N], int i, int k)
{
    int m, n, sum = 0;
    for (m = -1; m < 2; m++) {
        if ((i + m >= 0) && (i + m < N)) {
            for (n = -1; n < 2; n++) {
                if ((k + n >= 0) && (k + n < N) && (a[i + m][k + n] == -1))
                    sum++;
            }
        }
    }
    return sum;
}

static void manage_space_press(int a[][N], int i, int k, struct values fixed_space)
{
    if (a[i][k] == -1)
        ps.victory = 0;
    else
        cascadeuncover(a, i, k, fixed_space);
}

static void manage_enter_press(int a[][N], int i, int k, char c)
{
    if (c == *BOMB_CHAR) {
        wattron(field, COLOR_PAIR(2));
        c = *COVERED_CHAR;
        ps.bombs++;
        if (a[i][k] != -1)
            ps.correct++;
    } else {
        wattron(field, COLOR_PAIR(1));
        c = *BOMB_CHAR;
        ps.bombs--;
        if (a[i][k] != -1)
            ps.correct--;
    }
    wprintw(field, "%c", c);
    mvwprintw(score, 1, 1, "Still %d bombs.", ps.bombs);
    wattroff(field, COLOR_PAIR);
    wrefresh(score);
}

static void victory_check(int a[][N], struct values dim)
{
    char winmesg[] = "YOU WIN! It was just luck...";
    char losemesg[] = "You're a **cking loser. :P";
    char exitmsg[] = "Leaving...bye! See you later :)";
    wclear(field);
    wclear(score);
    delwin(field);
    delwin(score);
    attron(A_BOLD);
    attron(COLOR_PAIR(rand() % 6 + 1));
    if (!ps.quit) {
        if ((ps.victory) && (ps.correct == 1))
            mvprintw(dim.a / 2, (dim.b - strlen(winmesg)) / 2, "%s", winmesg);
        else
            mvprintw(dim.a / 2, (dim.b - strlen(losemesg)) / 2, "%s", losemesg);
    } else {
         mvprintw(dim.a / 2, (dim.b - strlen(exitmsg)) / 2, "%s", exitmsg);
    }
    refresh();
    sleep(1);
    attroff(A_BOLD);
    attroff(COLOR_PAIR);
    endwin();
    delwin(stdscr);
}