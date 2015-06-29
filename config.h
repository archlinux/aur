/* cnoor config file */

/* framebuffer depth */
typedef unsigned int fbval_t;

/* optimized version of fb_val() */
#define FB_VAL(r, g, b)	fb_val((r), (g), (b))

/* you can get it from http://tanzil.info/download */
#define QURAN_PATH	"user"
/* it should be a utf-8 file with one aya per line or NULL */
#define TRANS_PATH	"/usr/share/doc/cnoor/en.ahmedali"

/* fonts and colors */
#define COLOR_FG	0x000000
#define COLOR_BG	0xd5ddff
#define FONT_QURAN	"scheherazade 17"
#define FONT_TRANS	"DejaVu Sans 8"
#define FONT_NUM	"DejaVu Sans Mono 7"
#define FONT_JUZ	"DejaVu Sans Mono 7"
#define FONT_SAJDA	"DejaVu Sans Mono 7"
