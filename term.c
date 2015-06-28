/* $Id$ */

/*
 * hed - Hexadecimal editor
 * Copyright (C) 2004  Petr Baudis <pasky@ucw.cz>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of version 2 of the GNU General Public License as
 * published by the Free Software Foundation.
 * 
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */

/*
 * `There's only stars, as I thought,' he said. Then he gave a low gasp, for
 * the stars went out. As if a dark veil had been withdrawn, the Mirror grew
 * grey, and then clear. There was sun shining, and the branches of trees were
 * waving and tossing in the wind.
 */

/* Feature macros needed for:
 *  - stpcpy
 *  - vasprintf
 */
#define _GNU_SOURCE

#include <config.h>

#include <curses.h>
#include <stdlib.h>

#include <hed.h>

#include <term/term.h>


static WINDOW *scr;
int color2attr[64];

#define DEFCOLOR(PN, FG, BG, ATTRS)				\
	[ ( COLOR_ ## PN ) - 1 ] = {				\
		.fg = ( COLOR_ ## FG ),				\
		.bg = ( COLOR_ ## BG ),				\
		.attrs = COLOR_PAIR( COLOR_ ## PN ) | (ATTRS ) }

static struct {
	short fg, bg;
	int attrs;
} colordefs[] = {
	//	pair number	fg	bg	attrs
	DEFCOLOR(NEUTRAL,	WHITE,	BLACK,	0),
	DEFCOLOR(OFFSET,	YELLOW,	BLACK,	A_BOLD),
	DEFCOLOR(STATUS,	WHITE,	BLACK,	0),
	DEFCOLOR(MODE,		WHITE,	BLACK,	A_BOLD),
	DEFCOLOR(MARK,		YELLOW,	BLACK,	A_BOLD),
	DEFCOLOR(ERROR,		RED,	BLACK,	A_BOLD),
	DEFCOLOR(DIRTY,		RED,	BLACK,	A_BOLD),

	DEFCOLOR(HEX,		WHITE,	BLACK,	0),
	DEFCOLOR(UNHEX,		WHITE,	BLUE,	0),
	DEFCOLOR(ASC,		GREEN,	BLACK,	A_BOLD),
	DEFCOLOR(UNASC,		GREEN,	BLUE,	A_BOLD),
	DEFCOLOR(CURHEX,	WHITE,	BLACK,	A_BOLD),
	DEFCOLOR(CURUNHEX,	WHITE,	BLUE,	A_BOLD),
	DEFCOLOR(CURASC,	YELLOW,	BLACK,	A_BOLD),
	DEFCOLOR(CURUNASC,	YELLOW,	BLUE,	A_BOLD),
};

#undef DEFCOLOR

#ifdef CONFIG_CUSTOM_COLORS

#include <string.h>
#include <ctype.h>
#include <config/config.h>

struct valdesc {
	const char *const name;
	const size_t len;
	const int val;
};

static int
parseval(char **pstr, const struct valdesc *vals, int nvals, bool mult)
{
	char *p, *q;
	size_t len;
	int i, ret = 0;

	while (**pstr) {
		for (p = *pstr; isspace(*p); ++p);
		for (q = p; *q && !isspace(*q); ++q);
		len = q - p;
		*pstr = q;

		for (i = 0; i < nvals; ++i) {
			if (vals[i].len != len)
				continue;
			if (strncasecmp(p, vals[i].name, len))
				continue;
			ret |= vals[i].val;
		}
		if (!mult)
			break;
	}
	return ret;
}

static inline int
parsecolor(char **pstr)
{
#define COLDESC(COL) {				\
		.name = #COL,			\
		.len = (sizeof(#COL)) - 1,	\
		.val = COLOR_ ## COL }
	static const struct valdesc colors[] = {
		COLDESC(BLACK),
		COLDESC(RED),
		COLDESC(GREEN),
		COLDESC(YELLOW),
		COLDESC(BLUE),
		COLDESC(MAGENTA),
		COLDESC(CYAN),
		COLDESC(WHITE),
	};
#undef COLDESC

	return parseval(pstr,
			colors, sizeof(colors) / sizeof(colors[0]),
			false);
}

static inline int
parseattrs(char **pstr)
{
#define ATTRDESC(ATTR) {			\
		.name = #ATTR,			\
		.len = (sizeof(#ATTR)) - 1,	\
		.val = A_ ## ATTR }
	static const struct valdesc attrs[] = {
		ATTRDESC(NORMAL),
		ATTRDESC(STANDOUT),
		ATTRDESC(UNDERLINE),
		ATTRDESC(REVERSE),
		ATTRDESC(BLINK),
		ATTRDESC(DIM),
		ATTRDESC(BOLD),
		ATTRDESC(PROTECT),
		ATTRDESC(INVIS),
		ATTRDESC(ALTCHARSET),
	};
#undef ATTRDESC

	return parseval(pstr,
			attrs, sizeof(attrs) / sizeof(attrs[0]),
			true);
}

static void
config_colors(void)
{
	static const char * const names[] = {
		"neutral", "offset", "status", "mode",
		"mark", "error", "dirty",
		"hex", "unhex", "asc", "unasc",
		"curhex", "curunhex", "curasc", "curunasc" };
	int i;

	for (i = 0; i < sizeof(names) / sizeof(names[0]); ++i) {
		char *spec, name[16];

		strcpy(stpcpy(name, "color_"), names[i]);
		if (! (spec = get_opt_str(name, NULL)) )
			continue;

		colordefs[i].fg = parsecolor(&spec);
		colordefs[i].bg = parsecolor(&spec);
		colordefs[i].attrs = parseattrs(&spec) | COLOR_PAIR(i + 1);
	}
}

#else

#define config_colors()	do { } while(0)

#endif	/* CONFIG_CUSTOM_COLORS */

/* Initialize the terminal. */
void
term_init(void)
{
	int i;

	scr = initscr();
	cbreak(); noecho(); nonl();
	intrflush(scr, FALSE);
	keypad(scr, TRUE);

	config_colors();
	start_color();
	for (i = 0; i < sizeof(colordefs) / sizeof(colordefs[0]); ++i) {
		init_pair(i + 1, colordefs[i].fg, colordefs[i].bg);
		color2attr[i+1] = colordefs[i].attrs;
	}

	refresh();
}

/* Deinitialize the terminal. */
void
term_done(void)
{
	endwin();
}

/* Redraw the terminal. */
void term_redraw(void)
{
	refresh();
}


/* Move the cursor around to the given position. */
void
term_goto_cursor(int x, int y)
{
	move(y, x);
}

/* Get window dimensions. */
int
term_get_max_x(void)
{
	int x, y;
	getmaxyx(stdscr, y, x);
	return x;
}

int
term_get_max_y(void)
{
	int x, y;
	getmaxyx(stdscr, y, x);
	return y;
}

/* Clear the given line. Can move cursor around. */
void
term_clear_line(int y)
{
	move(y, 0);
	clrtoeol();
}

/* Print formatted output to the terminal. */
int
term_printf(int x, int y, term_color color, const char *fmt, ...)
{
	va_list va;
	char *str;
	int len;

	va_start(va, fmt);
	len = vasprintf(&str, fmt, va);
	va_end(va);
	term_print_string(x, y, color, str);
	free(str);
	return len;
}

/* Get a character from the terminal. */
int
term_get_char(void)
{
	return getch();
}
