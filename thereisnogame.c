#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <termios.h>
#include <sys/select.h>
#include <time.h>

#define W 10
#define H 20

static struct termios old;

void cleanup() {
    tcsetattr(STDIN_FILENO, TCSANOW, &old);
    printf("\033[?25h\033[0m\n");
}

void rawmode() {
    struct termios t;
    tcgetattr(STDIN_FILENO, &old);
    t = old;
    t.c_lflag &= ~(ICANON | ECHO);
    t.c_cc[VMIN] = 0;
    t.c_cc[VTIME] = 0;
    tcsetattr(STDIN_FILENO, TCSANOW, &t);
    atexit(cleanup);
}

int keypressed() {
    fd_set set;
    struct timeval tv = {0,0};

    FD_ZERO(&set);
    FD_SET(STDIN_FILENO, &set);

    return select(STDIN_FILENO+1, &set, NULL, NULL, &tv) > 0;
}

char getkey() {
    char c;
    read(STDIN_FILENO, &c, 1);
    return c;
}


const int pieces[7][4][4][4] = {
    {
        {{1,1,1,1},{0,0,0,0},{0,0,0,0},{0,0,0,0}},
        {{1,0,0,0},{1,0,0,0},{1,0,0,0},{1,0,0,0}},
        {{1,1,1,1},{0,0,0,0},{0,0,0,0},{0,0,0,0}},
        {{1,0,0,0},{1,0,0,0},{1,0,0,0},{1,0,0,0}}
    },
    {
        {{1,1,0,0},{1,1,0,0},{0,0,0,0},{0,0,0,0}},
        {{1,1,0,0},{1,1,0,0},{0,0,0,0},{0,0,0,0}},
        {{1,1,0,0},{1,1,0,0},{0,0,0,0},{0,0,0,0}},
        {{1,1,0,0},{1,1,0,0},{0,0,0,0},{0,0,0,0}}
    },
    {
        {{0,1,0,0},{1,1,1,0},{0,0,0,0},{0,0,0,0}},
        {{1,0,0,0},{1,1,0,0},{1,0,0,0},{0,0,0,0}},
        {{1,1,1,0},{0,1,0,0},{0,0,0,0},{0,0,0,0}},
        {{0,1,0,0},{1,1,0,0},{0,1,0,0},{0,0,0,0}}
    },
    {
        {{1,1,1,0},{1,0,0,0},{0,0,0,0},{0,0,0,0}},
        {{1,1,0,0},{0,1,0,0},{0,1,0,0},{0,0,0,0}},
        {{0,0,1,0},{1,1,1,0},{0,0,0,0},{0,0,0,0}},
        {{1,0,0,0},{1,0,0,0},{1,1,0,0},{0,0,0,0}}
    },
    {
        {{1,1,1,0},{0,0,1,0},{0,0,0,0},{0,0,0,0}},
        {{0,1,0,0},{0,1,0,0},{1,1,0,0},{0,0,0,0}},
        {{1,0,0,0},{1,1,1,0},{0,0,0,0},{0,0,0,0}},
        {{1,1,0,0},{1,0,0,0},{1,0,0,0},{0,0,0,0}}
    },
    {
        {{1,1,0,0},{0,1,1,0},{0,0,0,0},{0,0,0,0}},
        {{0,1,0,0},{1,1,0,0},{1,0,0,0},{0,0,0,0}},
        {{1,1,0,0},{0,1,1,0},{0,0,0,0},{0,0,0,0}},
        {{0,1,0,0},{1,1,0,0},{1,0,0,0},{0,0,0,0}}
    },
    {
        {{0,1,1,0},{1,1,0,0},{0,0,0,0},{0,0,0,0}},
        {{1,0,0,0},{1,1,0,0},{0,1,0,0},{0,0,0,0}},
        {{0,1,1,0},{1,1,0,0},{0,0,0,0},{0,0,0,0}},
        {{1,0,0,0},{1,1,0,0},{0,1,0,0},{0,0,0,0}}
    }
};


int board[H][W];

int px,py,ptype,prot;

int collide(int x,int y,int r) {
    for(int i=0;i<4;i++)
        for(int j=0;j<4;j++)
            if(pieces[ptype][r][i][j]) {
                int xx=x+j, yy=y+i;
                if(xx<0||xx>=W||yy>=H) return 1;
                if(yy>=0 && board[yy][xx]) return 1;
            }
    return 0;
}

void spawn() {
    ptype=rand()%7;
    prot=0;
    px=3;
    py=-1;
}

void place() {
    for(int i=0;i<4;i++)
        for(int j=0;j<4;j++)
            if(pieces[ptype][prot][i][j]) {
                if(py+i>=0)
                    board[py+i][px+j]=1;
            }
}

void clear_lines() {
    for(int y=H-1;y>=0;y--) {
        int full=1;
        for(int x=0;x<W;x++)
            if(!board[y][x]) full=0;

        if(full) {
            for(int yy=y;yy>0;yy--)
                for(int x=0;x<W;x++)
                    board[yy][x]=board[yy-1][x];
            y++;
        }
    }
}

void draw() {
    printf("\033[H");

    for(int y=0;y<H;y++) {
        printf("|");
        for(int x=0;x<W;x++) {
            int block=board[y][x];

            for(int i=0;i<4;i++)
                for(int j=0;j<4;j++)
                    if(py+i==y && px+j==x &&
                       pieces[ptype][prot][i][j])
                        block=1;

            printf(block?"[]":"  ");
        }
        printf("|\n");
    }

    for(int i=0;i<W+2;i++) printf("--");
    printf("\nwasd controls, q quits\n");
}


void tetris() {
    rawmode();
    printf("\033[2J\033[?25l");

    srand(time(NULL));

    spawn();

    long tick=0;

    while(1) {
        if(keypressed()) {
            char c=getkey();

            if(c=='q') break;
            if(c=='a' && !collide(px-1,py,prot)) px--;
            if(c=='d' && !collide(px+1,py,prot)) px++;

            if(c=='s' && !collide(px,py+1,prot))
                py++;

            if(c=='w') {
                int r=(prot+1)%4;
                if(!collide(px,py,r))
                    prot=r;
            }
        }

        if(++tick%20==0) {
            if(!collide(px,py+1,prot))
                py++;
            else {
                place();
                clear_lines();
                spawn();

                if(collide(px,py,prot))
                    break;
            }
        }

        draw();
        usleep(50000);
    }

    printf("\033[2J\033[Hgame over\n");
}


int main() {

    const char *msgs[]={
        "such a waste of space.",
        "nope still nothing",
        "go away. theres nothing to see.",
        "i said \"go away\".",
        "you want something?",
        "fine. you won. this isnt nothing.",
        "meow :3",
        "why continue? there is no game",
        "actually yes there is a game."
    };

    FILE *f=fopen("/tmp/thereisnogame_state","r");

    int n=0;
    if(f) {
        fscanf(f,"%d",&n);
        fclose(f);
    }

    if(n<9) {
        printf("%s\n",msgs[n]);

        f=fopen("/tmp/thereisnogame_state","w");
        fprintf(f,"%d",n+1);
        fclose(f);

        return 0;
    }

    tetris();

    return 0;
}
