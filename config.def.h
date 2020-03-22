/* See LICENSE file for copyright and license details. */
/* appearance */
static const unsigned int borderpx = 2;		  /* border pixel of windows */
static const unsigned int gappx     = 6;        /* gaps between windows */
static const unsigned int snap = 32;		  /* snap pixel */
static const unsigned int systraypinning = 0; /* 0: sloppy systray follows selected monitor, >0: pin systray to monitor X */
static const unsigned int systrayspacing = 2; /* systray spacing */
static const int systraypinningfailfirst = 1; /* 1: if pinning fails, display systray on the first monitor, False: display systray on the last monitor*/
static const int showsystray = 1;			  /* 0 means no systray */
static const int showbar = 1;				  /* 0 means no bar */
static const int topbar = 1;				  /* 0 means bottom bar */
static const char *fonts[] = {"Mononoki Nerd Font:size=9",
							  "Noto Sans Mono:size=9:antialias=true:autohint=true",
							  "Symbola:size=9:antialias=true:autohint=true",
							  "Monospace:size=9:antialias=true:autohint=true"};
static const char dmenufont[] = "Mononoki Nerd Font:size=9";
static const char col_gray1[] = "#282a36";
static const char col_gray2[] = "#282a36"; /* border color unfocused windows */
static const char col_gray3[] = "#96b5b4";
static const char col_gray4[] = "#d7d7d7";
static const char col_cyan[] = "#924441"; /* border color focused windows and tags */
static const char *colors[][3] = {
	/*               fg         bg         border   */
	[SchemeNorm] = {col_gray3, col_gray1, col_gray2},
	[SchemeSel] = {col_gray4, col_cyan, col_cyan},
	[SchemeTabActive] = {col_gray2, col_gray3, col_gray2},
	[SchemeTabInactive] = {col_gray1, col_gray3, col_gray1}};

/* tagging */
static const char *tags[] = { "", "", "", "", "", "", "", "", "" };

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class      instance    title       tags mask     isfloating   monitor */
	{"Gimp", NULL, NULL, 0, 1, -1},
	{"Firefox", NULL, NULL, 1 << 8, 0, -1},
};

/* layout(s) */
static const float mfact = 0.55;  /* factor of master area size [0.05..0.95] */
static const int nmaster = 1;	  /* number of clients in master area */
static const int resizehints = 1; /* 1 means respect size hints in tiled resizals */

/* Bartabgroups properties */
#define BARTAB_BORDERS 1	   // 0 = off, 1 = on
#define BARTAB_BOTTOMBORDER 1  // 0 = off, 1 = on
#define BARTAB_TAGSINDICATOR 1 // 0 = off, 1 = on if >1 client/view tag, 2 = always on
#define BARTAB_TAGSPX 5		   // # pixels for tag grid boxes
#define BARTAB_TAGSROWS 3	   // # rows in tag grid (9 tags, e.g. 3x3)
static void (*bartabmonfns[])(Monitor *) = {monocle /* , customlayoutfn */};
static void (*bartabfloatfns[])(Monitor *) = {NULL /* , customlayoutfn */};

#include "fibonacci.c"
#include "layouts.c"
static const Layout layouts[] = {
	/* symbol     arrange function */
	{"[]=", tile}, /* first entry is default */
	{"><>", NULL}, /* no layout function means floating behavior */
	{"[M]", monocle},
	{"[@]", spiral},
	{"HHH", grid},
    {NULL, NULL},
};

/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY, TAG)                                          \
	{MODKEY, KEY, view, {.ui = 1 << TAG}},                         \
		{MODKEY | ControlMask, KEY, toggleview, {.ui = 1 << TAG}}, \
		{MODKEY | ShiftMask, KEY, tag, {.ui = 1 << TAG}},          \
		{MODKEY | ControlMask | ShiftMask, KEY, toggletag, {.ui = 1 << TAG}},

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd)                                           \
	{                                                        \
		.v = (const char *[]) { "/bin/sh", "-c", cmd, NULL } \
	}

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = {"dmenu_run", "-m", dmenumon, "-fn", dmenufont, "-nb", col_gray1, "-nf", col_gray3, "-sb", col_cyan, "-sf", col_gray4, NULL};
static const char *termcmd[] = {"st", NULL};

static Key keys[] = {
	/* modifier                     key        function        argument */
	{MODKEY,                        XK_r,      spawn,          {.v = dmenucmd}},
	{MODKEY,                        XK_Return, spawn,          {.v = termcmd}},
	{MODKEY,                        XK_b,      togglebar,      {0}},
	{MODKEY | ShiftMask,            XK_j,      rotatestack,    {.i = +1}},
	{MODKEY | ShiftMask,            XK_k,      rotatestack,    {.i = -1}},
	{MODKEY,                        XK_j,      focusstack,     {.i = +1}},
	{MODKEY,                        XK_k,      focusstack,     {.i = -1}},
	{MODKEY,                        XK_i,      incnmaster,     {.i = +1}},
	{MODKEY,                        XK_d,      incnmaster,     {.i = -1}},
	{MODKEY,                        XK_h,      setmfact,       {.f = -0.05}},
	{MODKEY,                        XK_l,      setmfact,       {.f = +0.05}},
	{MODKEY | ShiftMask,            XK_h,      setcfact,       {.f = +0.25}},
	{MODKEY | ShiftMask,            XK_l,      setcfact,       {.f = -0.25}},
	{MODKEY | ShiftMask,            XK_o,      setcfact,       {.f = 0.00}},
	//{MODKEY,                        XK_Return, zoom,           {0}},
	{MODKEY,                        XK_Tab,    view,           {0}},
	{MODKEY | ShiftMask,            XK_q,      killclient,     {0}},

	{MODKEY,                        XK_t,      setlayout,      {.v = &layouts[0]}},
	{MODKEY,                        XK_f,      setlayout,      {.v = &layouts[1]}},
	{MODKEY,                        XK_m,      setlayout,      {.v = &layouts[2]}},
	{MODKEY,                        XK_s,      setlayout,      {.v = &layouts[3]}},
	{MODKEY,                        XK_g,      setlayout,      {.v = &layouts[4]}},
	{MODKEY,                        XK_Tab,    cyclelayout,    {.i = -1}},
	{MODKEY | ShiftMask,            XK_Tab,    cyclelayout,    {.i = +1}},
	{MODKEY,                        XK_space,  togglefloating, {0}},

	{MODKEY,                        XK_0,      view,           {.ui = ~0}},
	{MODKEY | ShiftMask,            XK_0,      tag,            {.ui = ~0}},

	{MODKEY,                        XK_comma,  focusmon,       {.i = -1}},
	{MODKEY,                        XK_period, focusmon,       {.i = +1}},
	{MODKEY | ShiftMask,            XK_comma,  tagmon,         {.i = -1}},
	{MODKEY | ShiftMask,            XK_period, tagmon,         {.i = +1}},

	TAGKEYS(XK_1, 0)
	TAGKEYS(XK_2, 1)
	TAGKEYS(XK_3, 2)
	TAGKEYS(XK_4, 3)
	TAGKEYS(XK_5, 4)
	TAGKEYS(XK_6, 5)
	TAGKEYS(XK_7, 6)
	TAGKEYS(XK_8, 7)
	TAGKEYS(XK_9, 8)
    {MODKEY | ShiftMask,            XK_e,      quit,           {0}},
	{MODKEY | ShiftMask,            XK_r,      quit,           {1}},
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ClkLtSymbol, 0, Button1, setlayout, {0}},
	{ClkLtSymbol, 0, Button3, setlayout, {.v = &layouts[2]}},
	{ClkWinTitle, 0, Button2, zoom, {0}},
	{ClkStatusText, 0, Button2, spawn, {.v = termcmd}},
	{ClkClientWin, MODKEY, Button1, movemouse, {0}},
	{ClkClientWin, MODKEY, Button2, togglefloating, {0}},
	{ClkClientWin, MODKEY, Button3, resizemouse, {0}},
	{ClkTagBar, 0, Button1, view, {0}},
	{ClkTagBar, 0, Button3, toggleview, {0}},
	{ClkTagBar, MODKEY, Button1, tag, {0}},
	{ClkTagBar, MODKEY, Button3, toggletag, {0}},
};
