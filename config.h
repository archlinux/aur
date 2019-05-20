/* See LICENSE file for copyright and license details. */

#ifndef BSPWMBAR_CONFIG_H_
#define BSPWMBAR_CONFIG_H_

#include "bspwmbar.h"

/* intel */
#define THERMAL_PATH "/sys/class/thermal/thermal_zone0/temp"
/* k10temp */
/* #define THERMAL_PATH "/sys/class/hwmon/hwmon1/temp1_input" */

#define FONT_MAXSZ  3
#define NAME_MAXSZ  32
#define TITLE_MAXSZ 50
#define WS_MAXSZ    5
#define BAR_HEIGHT  24
#define TRAY_ICONSZ 16
#define BGCOLOR    0
#define ALTFGCOLOR 1
#define ALTBGCOLOR 8
#define FGCOLOR    2
#define LOGOCOLOR  3

const char *workspace_chars[] = { "", "" };

const char *colors[] = {
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

const char *fontname = "sans-serif:size=10";

/*
 * function       description
 *
 * logo           render the given string
 * workspace      bspwm workspaces
 * windowtitle    active window title
 * datetime       the current time in the given format
 * thermal        temperature of given sensor file
 * volume         playback volume
 * memgraph       memory usage
 * cpugraph       cpu usage per core
 * systray        systray icons
 */
/* for modules on the right (float: right;) */
const Module modules[] = {
	/* function    argument        event handler */
	/* float: left; */
	{ logo,        "",           NULL },
	{ workspace,   NULL,           NULL },
	{ windowtitle, "…",           NULL },

	/* float: right; */
	{ float_right, NULL,           NULL },
	{ datetime,    "%H:%M",        NULL },
	{ thermal,     THERMAL_PATH,   NULL },
	{ filesystem,  "/",            NULL },
	{ volume,      NULL,           volume_ev },
	{ memgraph,    NULL,           NULL },
	{ cpugraph,    NULL,           NULL },
	{ systray,     NULL,           NULL },
};

#endif
