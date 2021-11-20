#include <termios.h>

#define WBUF_INIT {NULL, 0}
#define CTRL_KEY(k) ((k)&0x1f)
#define TOK_BUFSIZE 64
#define FORWARD 1
#define BACK 2

enum keys {
	BACKSPACE = 127,
	ARROW_LEFT = 1000,
	ARROW_RIGHT,
	ARROW_UP,
	ARROW_DOWN,
	DEL_KEY,
	PAGE_UP,
	PAGE_DOWN
};

typedef struct fmrow
{
	int size;
	char *chars;
} fmrow;

struct wbuf
{
	char *b;
	int len;
};

struct extentions
{
	int numbers;
	int tildes;
};


struct fmConfig
{
	int rows;
	int cols;
	int cy;
	int rowoff;
	int numrows;
	char *dirname;
	struct termios std;
	struct extentions exts;
	fmrow *row;
} fmc;

void showHelp(void);
void showVersion(void);

void enableRawMode(void);
void disableRawMode(void);

void handleSigWinCh(int signo);

void init(void);
void scroll(void);
void refreshScreen(void);
void die(const char *s);

void changeDir(int op);
void openDir(char *dirname);
void openFile(char *dirname);

int readKey(void);
void processKey(void);
void moveCursor(int key);

void insertRow(char *s, size_t len);

void drawRows(struct wbuf *wb);
void drawStatusBar(struct wbuf *wb);
void highlightLine(struct wbuf *wb, int pos, int len);

int getCursorPos(int *rows, int *cols);
int getWindowSize(int *rows, int *cols);

void wbWrite(struct wbuf *wb, const char *s, int len);
void wbFree(struct wbuf *wb);
