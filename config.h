/* See LICENSE file for copyright and license details. */

#ifndef BSPWMBAR_CONFIG_H_
#define BSPWMBAR_CONFIG_H_

#include "bspwmbar.h"

/* intel */
#define THERMAL_PATH "/sys/class/thermal/thermal_zone0/temp"
/* k10temp */
/* #define THERMAL_PATH "/sys/class/hwmon/hwmon1/temp1_input" */

/* max length of monitor output name and bspwm desktop name */
#define NAME_MAXSZ  32
/* max length of active window title */
#define TITLE_MAXSZ 50
/* set window height */
#define BAR_HEIGHT  24
/* set tray icon size */
#define TRAY_ICONSZ 16

/* set font pattern for find fonts, see fonts-conf(5) */
const char *fontname = "sans-serif:size=10";

/* set strings for uses on render bspwm desktop */
#define WS_ACTIVE   ""
#define WS_INACTIVE ""

/*
 * color map for bspwmbar
 */
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

/*
 * color settings by index of color map
 */
#define BGCOLOR    0
#define ALTFGCOLOR 1
#define ALTBGCOLOR 8
#define FGCOLOR    2
#define LOGOCOLOR  3

/*
 * function       description
 *
 * logo           render the given string
 * desktops       bspwm desktop states
 * windowtitle    active window title
 * datetime       the current time in the given format
 * thermal        temperature of given sensor file
 * volume         playback volume
 * memgraph       memory usage
 * cpugraph       cpu usage per core
 * systray        systray icons
 */
/* for modules on the left (float: left;) */
const Module left_modules[] = {
	/* function    argument        event handler */
	/* float: left; */
	{ logo,        "",           NULL },
	{ desktops,    NULL,           NULL },
	{ windowtitle, "…",           NULL },
};

/* for modules on the right (float: right;) */
const Module right_modules[] = {
	/* float: right; */
	{ datetime,    "%H:%M",        NULL },
	{ thermal,     THERMAL_PATH,   NULL },
	{ filesystem,  "/",            NULL },
	{ volume,      NULL,           volume_ev },
	{ memgraph,    NULL,           NULL },
	{ cpugraph,    NULL,           NULL },
	{ systray,     NULL,           NULL },
};

#endif
