/* See LICENSE file for copyright and license details. */

/* appearance */
static const char *fonts[] = {
    "Monospace:size=8",
    "Inconsolata G:size=12",
    "VL Gothic:size=10.5",
    "WenQuanYi Micro Hei:size=10.5",
};
static const char font[]            = "-*-inconsolata g-*-*-*-*-12-*-*-*-*-*-*-*";
static const unsigned int borderpx  = 1;        /* border pixel of windows */
static const unsigned int snap      = 32;       /* snap pixel */
static const unsigned int systraypinning = 0;   /* 0: sloppy systray follows selected monitor, >0: pin systray to monitor X */
static const unsigned int systrayspacing = 1;   /* systray spacing */
static const Bool systraypinningfailfirst = True; /* True: if pinning fails, display systray on the first monitor, False: display systray on the last monitor*/
static const Bool showsystray       = True;     /* True means no systray */
static const int nmaster            = 2;        /* number of clients in master area */
static const Bool showbar           = True;     /* False means no bar */
static const Bool topbar            = True;     /* False means bottom bar */
static const char normbordercolor[] = "#080808";
static const char normbgcolor[]     = "#080808";
static const char normfgcolor[]     = "#ffffff";
static const char selbordercolor[]  = "#c6c6c6";
static const char selbgcolor[]      = "#c6c6c6";
static const char selfgcolor[]      = "#dc322f";
static const char *colors[][3] = {
	/*               fg           bg           border */
	[SchemeNorm] = { normfgcolor, normbgcolor, normbordercolor },
	[SchemeSel] =  { selfgcolor,  selbgcolor,  selbordercolor },
};

/* tagging */
static const char *tags[] = { "00", "01", "10", "11" };

static const Rule rules[] = {
	/* class             instance          title                        tags mask     iscentered   isfloating   monitor */
	/* monitor 0 */
	{ "Wine",               NULL,           NULL,                        1 << 1,       True,        True,         0 },
	{ "Remmina",            NULL,           NULL,                        1 << 1,       False,       True,         0 },
	{ "calibre-gui",        NULL,           NULL,                        1 << 1,       True,        True,         0 },
	{ "VirtualBox",         NULL,           NULL,                        1 << 1,       True,        True,         0 },
	{ "Chromium",           NULL,           NULL,                        1 << 1,       False,       False,        0 },
	{ "Google-chrome-beta", NULL,           NULL,                        1 << 1,       False,       False,        0 },
	{ NULL,                 "Browser",      NULL,                        1 << 1,       True,        True,         0 },
	{ NULL,                 "dwb",          NULL,                        1 << 1,       False,       False,        0 },
	{ "Firefox",            NULL,           NULL,                        1 << 1,       False,       False,        0 },
	{ "KeePass2",           NULL,           "Auto-Type Entry Selection", 1 << 1,       True,        True,         0 },
	{ "Gajim",              NULL,           NULL,                        1 << 2,       True,        True,         0 },
	{ "KeePass2",           NULL,           NULL,                        1 << 2,       True,        True,         0 },
	{ "Corebird",           NULL,           NULL,                        1 << 2,       True,        True,         0 },
	{ "Spotify",            NULL,           NULL,                        1 << 2,       True,        True,         0 },
	{ NULL,                 "libreoffice",  NULL,                        1 << 3,       False,       False,        0 },
	{ NULL,                 "abiword",      NULL,                        1 << 3,       False,       False,        0 },
	{ NULL,                 "gnumeric",     NULL,                        1 << 3,       False,       False,        0 },
	{ NULL,                 "Eclipse",      NULL,                        1 << 3,       False,       False,        0 },
	{ "Gimp",               NULL,           NULL,                        1 << 3,       False,       True,         0 },
	{ "PacketTracer6",      NULL,           NULL,                        1 << 3,       True,        True,         0 },
	{ "feh",                NULL,           NULL,                        0,            True,        True,        -1 },
	{ "Sxiv",               NULL,           NULL,                        0,            True,        True,        -1 },
	{ "mpv",                NULL,           NULL,                        0,            True,        True,        -1 },
	{ "Wine",               NULL,           NULL,                        0,            True,        True,        -1 },
	{ "XFontSel",           NULL,           NULL,                        0,            True,        True,        -1 },
	{ NULL,                 "xterm",        NULL,                        0,            True,        True,        -1 },
	{ "Zathura",            NULL,           NULL,                        0,            True,        True,        -1 },
	{ NULL,                 NULL,           "Save file",                 0,            True,        True,        -1 },
	{ NULL,                 NULL,           "Wicd Network Manager",      0,            True,        True,        -1 },
};

/* layout(s) */
static const float mfact      = 0.50;  /* factor of master area size [0.05..0.95] */
static const Bool resizehints = False; /* True means respect size hints in tiled resizals */

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[T]",      tile },        /* first entry is default */
	{ "[M]",      monocle },     /* maximized */
	{ "><>",      NULL },        /* floating */
};

/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char    *dmenucmd[]   = { "dmenu_run", "-m", dmenumon, "-fn", font, "-nb", normbgcolor, "-nf", normfgcolor, "-sb", selbgcolor, "-sf", selfgcolor, NULL };
static const char     *termcmd[]   = { "termite", NULL };
static const char *mostusedcmd[]   = { "mostused", NULL };
static const char     *lockcmd[]   = { "i3lock", "-c", "111111", "-e", "-f", NULL };
static const char *brightupcmd[]   = { "/usr/bin/light", "-A", "10", NULL };
static const char *brightdowncmd[] = { "/usr/bin/light", "-U", "10", NULL };

static Key keys[] = {
	/* modifier                     key         function        argument */
	{ MODKEY,                       XK_p,       spawn,          {.v = dmenucmd } },
	{ MODKEY,                       XK_v,       spawn,          {.v = mostusedcmd } },
	{ MODKEY|ShiftMask,             XK_Return,  spawn,          {.v = termcmd } },
	{ MODKEY|ShiftMask,             XK_l,       spawn,          {.v = lockcmd } },
	{ 0,                            0x1008ff02, spawn,          {.v = brightupcmd } },
	{ 0,                            0x1008ff03, spawn,          {.v = brightdowncmd } },
	{ MODKEY|ShiftMask,             XK_b,       togglebar,      {0} },
	{ MODKEY,                       XK_j,       focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_k,       focusstack,     {.i = -1 } },
	{ MODKEY,                       XK_h,       setmfact,       {.f = -0.05} },
	{ MODKEY,                       XK_l,       setmfact,       {.f = +0.05} },
	{ MODKEY,                       XK_Return,  zoom,           {0} },
	{ MODKEY,                       XK_Tab,     view,           {0} },
	{ MODKEY|ShiftMask,             XK_c,       killclient,     {0} },
	{ MODKEY,                       XK_a,       incnmaster,     {.i = +1 } },
	{ MODKEY,                       XK_z,       incnmaster,     {.i = -1 } },
	{ MODKEY,                       XK_t,       setlayout,      {.v = &layouts[0]} },
	{ MODKEY,                       XK_b,       setlayout,      {.v = &layouts[1]} },
	{ MODKEY,                       XK_m,       setlayout,      {.v = &layouts[2]} },
	{ MODKEY,                       XK_f,       setlayout,      {.v = &layouts[3]} },
	{ MODKEY,                       XK_space,   setlayout,      {0} },
	{ MODKEY|ShiftMask,             XK_space,   togglefloating, {0} },
	{ MODKEY,                       XK_0,       view,           {.ui = ~0 } },
	{ MODKEY|ShiftMask,             XK_0,       tag,            {.ui = ~0 } },
	{ MODKEY,                       XK_comma,   focusmon,       {.i = -1 } },
	{ MODKEY,                       XK_period,  focusmon,       {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_comma,   tagmon,         {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_period,  tagmon,         {.i = +1 } },
	TAGKEYS(                        XK_1,                       0)
	TAGKEYS(                        XK_2,                       1)
	TAGKEYS(                        XK_3,                       2)
	TAGKEYS(                        XK_4,                       3)
	TAGKEYS(                        XK_5,                       4)
	TAGKEYS(                        XK_6,                       5)
	TAGKEYS(                        XK_7,                       6)
	TAGKEYS(                        XK_8,                       7)
	TAGKEYS(                        XK_9,                       8)
	{ MODKEY|ShiftMask,             XK_q,       quit,           {0} },
};

/* button definitions */
/* click can be ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};

