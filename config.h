/* See LICENSE file for copyright and license details. */

#ifndef BSPWMBAR_CONFIG_H_
#define BSPWMBAR_CONFIG_H_

#define THERMAL_PATH "/sys/class/hwmon/hwmon1/temp1_input"

#define NAME_MAXSZ  32
#define TITLE_MAXSZ 50
#define WS_MAXSZ    5
#define BAR_HEIGHT  24

#define BGCOLOR    0
#define ALTFGCOLOR 1
#define ALTBGCOLOR 8
#define FGCOLOR    2
#define LOGOCOLOR  3

static const char *colors[] = {
	"#222222", /* black */
	"#7f7f7f", /* gray */
	"#e5e5e5", /* white */
	"#1793d1", /* logo color */

	"#449f3d", /* success color */
	"#2f8419", /* normal color */
	"#f5a70a", /* warning color */
	"#ed5456", /* critical color */

	"#555555", /* dark gray */
};

static const char *fontname = "sans-serif:size=10";

/* for modules on the right (float: right;) */
static Module modules[] = {
	/* function    argument        event handler */
	{ datetime,    "%H:%M",        NULL },
	{ thermal,     THERMAL_PATH,   NULL },
	{ filesystem,  "/",            NULL },
	{ volume,      NULL,           volume_ev },
	/*
	{ memory,      NULL,           NULL },
	{ loadavg,     NULL,           NULL },
	*/
};

#endif
