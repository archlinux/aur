/* See LICENSE file for copyright and license details. */
#define CWD   "cwd: "
#define CURSR " > "
#define EMPTY "   "

int dirorder    = 1; /* Set to 1 to sort by directory first */
int mtimeorder  = 0; /* Set to 1 to sort by time modified */
int icaseorder  = 1; /* Set to 1 to sort by ignoring case */
int idletimeout = 0; /* Screensaver timeout in seconds, 0 to disable */
int showhidden  = 0; /* Set to 1 to show hidden files by default */
int usecolor    = 1; /* Set to 1 to enable color attributes */
char *idlecmd   = "rain"; /* The screensaver program */

/* See curs_attr(3) for valid video attributes */
#define CURSR_ATTR A_NORMAL
#define DIR_ATTR   A_NORMAL | COLOR_PAIR(4)
#define LINK_ATTR  A_NORMAL | COLOR_PAIR(6)
#define SOCK_ATTR  A_NORMAL | COLOR_PAIR(1)
#define FIFO_ATTR  A_NORMAL | COLOR_PAIR(5)
#define EXEC_ATTR  A_NORMAL | COLOR_PAIR(2)

/* Colors to use with COLOR_PAIR(n) as attributes */
struct cpair pairs[] = {
	{ .fg = 0, .bg = 0 },
	/* pairs start at 1 */
	{ COLOR_RED,     -1 },
	{ COLOR_GREEN,   -1 },
	{ COLOR_YELLOW,  -1 },
	{ COLOR_BLUE,    -1 },
	{ COLOR_MAGENTA, -1 },
	{ COLOR_CYAN,    -1 },
};

struct assoc assocs[] = {
	{ .regex = "\\.(avi|mp4|mkv|mov|ogm|3gp|dv|wav|aiff|pcm|mp3|ogg|flac|ape|aac|m4a|wma|opus|pls|m3u|mod|it|s3m|xm|flv)$", .file = "mpv", .argv = { "mpv", "--really-quiet", "--load-scripts=no", "{}", NULL } },
	{ .regex = "\\.(png|jpg|jpeg|gif|bmp|tiff|tga)$", .file = "sxiv", .argv = { "sxiv", "{}", NULL} },
	{ .regex = "\\.(html|htm|svg)$", .file = "firefox", .argv = { "firefox", "{}", NULL } },
	{ .regex = "\\.pdf$", .file = "mupdf", .argv = { "mupdf", "{}", NULL} },
	{ .regex = "\\.sh$", .file = "sh", .argv = { "sh", "{}", NULL} },
	{ .regex = ".", .file = "less", .argv = { "less", "{}", NULL } },
};

struct key bindings[] = {
	/* Quit */
	{ 'q',            SEL_QUIT },
	/* Back */
	{ KEY_BACKSPACE,  SEL_BACK },
	{ KEY_LEFT,       SEL_BACK },
	{ 'h',            SEL_BACK },
	{ CONTROL('H'),   SEL_BACK },
	/* Inside */
	{ KEY_ENTER,      SEL_GOIN },
	{ '\r',           SEL_GOIN },
	{ KEY_RIGHT,      SEL_GOIN },
	{ 'l',            SEL_GOIN },
	/* Filter */
	{ '/',            SEL_FLTR },
	{ '&',            SEL_FLTR },
	/* Next */
	{ 'j',            SEL_NEXT },
	{ KEY_DOWN,       SEL_NEXT },
	{ CONTROL('N'),   SEL_NEXT },
	/* Previous */
	{ 'k',            SEL_PREV },
	{ KEY_UP,         SEL_PREV },
	{ CONTROL('P'),   SEL_PREV },
	/* Page down */
	{ KEY_NPAGE,      SEL_PGDN },
	{ CONTROL('D'),   SEL_PGDN },
	/* Page up */
	{ KEY_PPAGE,      SEL_PGUP },
	{ CONTROL('U'),   SEL_PGUP },
	/* Home */
	{ KEY_HOME,       SEL_HOME },
	{ META('<'),      SEL_HOME },
	{ '^',            SEL_HOME },
	/* End */
	{ KEY_END,        SEL_END },
	{ META('>'),      SEL_END },
	{ '$',            SEL_END },
	/* Change dir */
	{ 'c',            SEL_CD },
	{ '~',            SEL_CDHOME },
	/* Toggle hide .dot files */
	{ '.',            SEL_TOGGLEDOT },
	/* Toggle sort by directory first */
	{ 'd',            SEL_DSORT },
	/* Toggle sort by time */
	{ 't',            SEL_MTIME },
	/* Toggle case sensitivity */
	{ 'i',            SEL_ICASE },
	{ CONTROL('L'),   SEL_REDRAW },
	/* Run command */
	{ 'z',            SEL_RUN, "top" },
	{ '!',            SEL_RUN, "sh", "SHELL" },
	/* Run command with argument */
	{ 'e',            SEL_RUNARG, "vi", "EDITOR" },
	{ 'p',            SEL_RUNARG, "less", "PAGER" },
};
