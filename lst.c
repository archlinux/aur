/*
* lst - A shitty file manager
* Copyright (C) 2021 ItzAfroBoy
* 
* This program is free software: you can redistribute it and/or modify
* it under the terms of the GNU General Public License as published by
* the Free Software Foundation, either version 3 of the License, or
* (at your option) any later version.
* 
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
* GNU General Public License for more details.
* 
* You should have received a copy of the GNU General Public License
* along with this program.  If not, see <https://www.gnu.org/licenses/>.
*/

#define _DEFAULT_SOURCE
#define _BSD_SOURCE
#define _GNU_SOURCE

#include <sys/ioctl.h>
#include <sys/types.h>
#include <termios.h>
#include <signal.h>
#include <unistd.h>
#include <dirent.h>
#include <stdlib.h>
#include <string.h>
#include <fcntl.h>
#include <stdio.h>
#include <errno.h>

#include "lst.h"

#define FM_VERSION "1.0.0"

void die(const char *s)
{
	write(STDOUT_FILENO, "\e[2J\e[H", 7);
	perror(s);
	exit(1);
}

void showHelp() 
{
    write(STDOUT_FILENO, "\x1b[2J\x1b[H", 7);
    printf("lst [options] <path>\r\n");
    printf("a shitty text editor\r\n\r\n");
    printf("OPTIONS\r\n");
    printf("\t-h\t:: show help\r\n");
    printf("\t-v\t:: show version\r\n");
    printf("\t-t\t:: show tildes\r\n");
    printf("\t-n\t:: show numbers\r\n\r\n");
    exit(0);
}

void showVersion()
{
    write(STDOUT_FILENO, "\x1b[2J\x1b[H", 7);
    printf("lst version: %s\r\n", FM_VERSION);
    exit(0);
}

void handleSigWinCh(int signo)
{
	getWindowSize(&fmc.rows, &fmc.cols);
	fmc.rows -= 1;
	refreshScreen();
}

void enableRawMode()
{
	if (tcgetattr(STDIN_FILENO, &fmc.std) == -1)
		die("tcgetattr");

	atexit(disableRawMode);

	struct termios raw = fmc.std;
	raw.c_cflag |= ~(CS8);
	raw.c_oflag &= ~(OPOST);
	raw.c_lflag &= ~(ECHO | ICANON | IEXTEN | ISIG);
	raw.c_iflag &= ~(IXON | ICRNL | BRKINT | INPCK | ISTRIP);
	raw.c_cc[VMIN] = 0;
	raw.c_cc[VTIME] = 1;

	if (tcsetattr(STDIN_FILENO, TCSAFLUSH, &raw) == -1)
		die("tcsetattr");
}

void disableRawMode()
{
	if (tcsetattr(STDIN_FILENO, TCSAFLUSH, &fmc.std) == -1)
		die("tcsetattr");

	write(STDOUT_FILENO, "\r\e[?25h", 7);
}

int getWindowSize(int *rows, int *cols)
{
	struct winsize ws;

	if (ioctl(STDOUT_FILENO, TIOCGWINSZ, &ws) == -1 || ws.ws_col == 0)
	{
		if (write(STDOUT_FILENO, "\e[999C\e[999B", 12) != 12)
			return -1;

		return getCursorPos(rows, cols);
	}
	else
	{
		*cols = ws.ws_col;
		*rows = ws.ws_row;

		return 0;
	}
}

int getCursorPos(int *rows, int *cols)
{
	char buf[32];
	unsigned int i = 0;

	if (write(STDOUT_FILENO, "\e[6n", 4) != 4)
		return -1;

	while (i < sizeof(buf) - 1)
	{
		if (read(STDIN_FILENO, &buf[i], 1) != 1)
			break;
		if (buf[i] == 'R')
			break;
		i++;
	}

	buf[i] = '\0';
	if (buf[0] != '\e' || buf[1] != '[')
		return -1;
	if (sscanf(&buf[2], "%d;%d", rows, cols) != 2)
		return -1;

	return 0;
}

int readKey()
{
	int _r;
	char c;

	while ((_r = read(STDIN_FILENO, &c, 1)) != 1)
	{
		if (_r == -1 && errno != EAGAIN)
			die("read");
	}

	if (c == '\e')
	{
		char seq[3];
		if (read(STDIN_FILENO, &seq[0], 1) != 1)
			return '\e';
		if (read(STDIN_FILENO, &seq[1], 1) != 1)
			return '\e';

		if (seq[0] == '[')
		{
			if (seq[1] >= '0' && seq[1] <= '9')
			{
				if (read(STDIN_FILENO, &seq[2], 1) != 1)
					return '\e';
				if (seq[2] == '~')
				{
					switch (seq[1])
					{
					case '3':
						return DEL_KEY;
					case '5':
						return PAGE_UP;
					case '6':
						return PAGE_DOWN;
					}
				}
			}
			else
			{
				switch (seq[1])
				{
				case 'A':
					return ARROW_UP;
				case 'B':
					return ARROW_DOWN;
				case 'C':
					return ARROW_RIGHT;
				case 'D':
					return ARROW_LEFT;
				}
			}
		}

		return '\e';
	}
	else
	{
		return c;
	}
}

void processKey()
{
	int c = readKey();
	switch (c)
	{
	case '\r':
	case ARROW_RIGHT:
		changeDir(FORWARD);
		break;

	case BACKSPACE:
	case ARROW_LEFT:
		changeDir(BACK);
		break;

	case CTRL_KEY('q'):
		write(STDOUT_FILENO, "\e[2J\e[H", 7);
		exit(0);
		break;

	case ARROW_UP:
	case ARROW_DOWN:
		moveCursor(c);
		break;
	}
}

void moveCursor(int key)
{
	switch (key)
	{
	case ARROW_UP:
		if (fmc.cy != 0)
			fmc.cy--;
		else if (fmc.cy == 0)
			fmc.cy = fmc.numrows - 1;
		break;

	case ARROW_DOWN:
		if (fmc.cy < fmc.numrows - 1)
			fmc.cy++;
		else if (fmc.cy == fmc.numrows - 1)
			fmc.cy = 0;
		break;
	}
}

void scroll()
{
	if (fmc.cy < fmc.rowoff)
		fmc.rowoff = fmc.cy;
	if (fmc.cy >= fmc.rowoff + fmc.rows)
		fmc.rowoff = fmc.cy - fmc.rows + 1;
}

void wbWrite(struct wbuf *wb, const char *s, int len)
{
	char *new = realloc(wb->b, wb->len + len);
	if (new == NULL)
		return;

	memcpy(&new[wb->len], s, len);

	wb->b = new;
	wb->len += len;
}

void wbFree(struct wbuf *wb)
{
	free(wb->b);
}

void insertRow(char *s, size_t len)
{
	fmc.row = realloc(fmc.row, sizeof(fmrow) * (fmc.numrows + 1));
	int at = fmc.numrows;

	fmc.row[at].size = len;
	fmc.row[at].chars = malloc(len + 1);
	memcpy(fmc.row[at].chars, s, len);
	fmc.row[at].chars[len] = '\0';
	fmc.numrows++;
}

void drawRows(struct wbuf *wb)
{
	int y;
	for (y = 0; y < fmc.rows; y++)
	{
		int filerow = y + fmc.rowoff;
		char lineNo[7];
		int lineNoLen;

		if (fmc.numrows >= 0 && fmc.numrows < 10)
			lineNoLen = snprintf(lineNo, sizeof(lineNo), "%d ", filerow + 1);
		else if (fmc.numrows >= 10 && fmc.numrows < 100)
			lineNoLen = snprintf(lineNo, sizeof(lineNo), "%2d ", filerow + 1);
		else if (fmc.numrows >= 100 && fmc.numrows < 1000)
			lineNoLen = snprintf(lineNo, sizeof(lineNo), "%3d ", filerow + 1);
		else if (fmc.numrows >= 1000 && fmc.numrows < 10000)
			lineNoLen = snprintf(lineNo, sizeof(lineNo), "%4d ", filerow + 1);
		else if (fmc.numrows >= 10000 && fmc.numrows < 100000)
			lineNoLen = snprintf(lineNo, sizeof(lineNo), "%5d ", filerow + 1);

		if (filerow >= fmc.numrows)
		{
			if (fmc.exts.tildes == 1)
			{
				wbWrite(wb, "~", 1);
			}
		}
		else
		{
			if (fmc.exts.numbers == 1)
				wbWrite(wb, lineNo, lineNoLen);

			int len = fmc.row[filerow].size;
			if (len > fmc.cols)
				len = fmc.cols;

			if (fmc.cy == filerow)
				highlightLine(wb, filerow, len);
			else
				wbWrite(wb, fmc.row[filerow].chars, len);
		}

		wbWrite(wb, "\e[K\r\n", 5);
	}
}

void drawStatusBar(struct wbuf *wb)
{
	char status[80], rstatus[80];
	int len = snprintf(status, sizeof(status), "%.30s - %d dirs", fmc.dirname, fmc.numrows);
	int rlen = snprintf(rstatus, sizeof(rstatus), "%d/%d", fmc.cy + 1, fmc.numrows);

	if (len > fmc.cols)
		len = fmc.cols;

	wbWrite(wb, "\e[7m", 4);
	wbWrite(wb, status, len);

	while (len < fmc.cols)
	{
		if (fmc.cols - len == rlen)
		{
			wbWrite(wb, rstatus, rlen);
			break;
		}
		else
		{
			wbWrite(wb, " ", 1);
			len++;
		}
	}

	wbWrite(wb, "\e[m", 3);
}

void highlightLine(struct wbuf *wb, int pos, int len)
{
	wbWrite(wb, "\e[7m", 4);
	wbWrite(wb, fmc.row[pos].chars, len);
	wbWrite(wb, "\e[m", 3);
}

void changeDir(int op)
{
	char dirname[80];
	memset(dirname, 0, 80);

	if (op == FORWARD)
	{
		char *hl_dirname = fmc.row[fmc.cy].chars;
		char *_s;
		int _c = strcmp(fmc.dirname, "/");

		if (_c == 0)
			_s = "";
		else
			_s = "/";

		snprintf(dirname, sizeof(dirname), "%s%s%s", fmc.dirname, _s, hl_dirname);
	}
	else
	{
		char **tokens = malloc(sizeof(char *) * TOK_BUFSIZE);
		char *token;
		char dir[80];
		char dir2[80];
		int position = 0;

		memset(dir, 0, 80);
		memset(dir2, 0, 80);
		snprintf(dir, sizeof(dir), "%s", fmc.dirname);

		token = strtok(dir, "/");
		while (token != NULL)
		{
			tokens[position] = token;
			position++;
			token = strtok(NULL, "/");
		}

		tokens[position] = NULL;
		for (int i = 0; i < position - 1; i++)
		{
			strcat(dir2, "/");
			strcat(dir2, tokens[i]);
		}

		if (dir2[0] == 0)
			strcat(dir2, "/");

		snprintf(dirname, sizeof(dirname), "%s", dir2);
		free(tokens);
	}

	fmc.cy = 0;
	fmc.rowoff = 0;
	fmc.numrows = 0;
	fmc.row = NULL;

	openDir(dirname);
}

void openDir(char *dirname)
{
	free(fmc.dirname);

	fmc.dirname = strdup(dirname);
	DIR *dir = opendir(dirname);

	if (!dir)
	{
		FILE *fp = fopen(dirname, "r");
		if (!fp)
			die("fopen");
		openFile(dirname);
	}

	struct dirent *entry;
	while ((entry = readdir(dir)))
	{
		int _c = strcmp(entry->d_name, ".");
		int _cc = strcmp(entry->d_name, "..");

		if (_c != 0 && _cc != 0)
			insertRow(entry->d_name, strlen(entry->d_name));
	}
	closedir(dir);
}

void openFile(char *file)
{
	char *args[3];

	args[0] = "txt";
	args[1] = file;
	args[2] = '\0';

	disableRawMode();
	execvp(args[0], args);
	die("execvp");
}

void refreshScreen()
{
	struct wbuf wb = WBUF_INIT;

	scroll();
	wbWrite(&wb, "\e[?25l\e[H", 9);

	drawRows(&wb);
	drawStatusBar(&wb);

	char buf[32];
	snprintf(buf, sizeof(buf), "\e[%d;%dH", (fmc.cy - fmc.rowoff) + 1, 4);

	wbWrite(&wb, buf, strlen(buf));

	write(STDOUT_FILENO, wb.b, wb.len);
	wbFree(&wb);
}

void init()
{
	fmc.cy = 0;
	fmc.rowoff = 0;
	fmc.numrows = 0;
	fmc.row = NULL;
	fmc.dirname = NULL;
	fmc.exts.numbers = 0;
	fmc.exts.tildes = 0;

	if (getWindowSize(&fmc.rows, &fmc.cols) == -1)
		die("getWindowSize");

	fmc.rows -= 1;
	signal(SIGWINCH, handleSigWinCh);
}

int main(int argc, char **argv)
{
	int c;

	enableRawMode();
	init();

	while ((c = getopt(argc, argv, "nthv")) != -1)
	{
		switch (c)
		{
		case 'n':
			fmc.exts.numbers = 1;
			break;
		case 't':
			fmc.exts.tildes = 1;
			break;
		case 'h':
			showHelp();
			break;
		case 'v':
			showVersion();
		}
	}

	if (!argv[optind])
		openDir(get_current_dir_name());
	else
		openDir(argv[optind]);

	while (1)
	{
		refreshScreen();
		processKey();
	}

	return 0;
}
