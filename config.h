/* modifier 0 means no modifier */
static int surfuseragent    = 1;  /* Append Surf version to default WebKit user agent */
static char *fulluseragent  = ""; /* Or override the whole user agent string */
static char *scriptfile     = "~/.surf/script.js";
static char *styledir       = "~/.surf/styles/";
static char *cachedir       = "~/.surf/cache/";

static int kioskmode       = 0;     /* Ignore shortcuts */
static int showindicators  = 1;     /* Show indicators in window title */
static int runinfullscreen = 0;     /* Run in fullscreen mode by default */

static guint defaultfontsize = 12;   /* Default font size */
static gfloat zoomlevel     = 1.0;   /* Default zoom level */

/* Soup default features */
static char *cookiefile     = "~/.surf/cookies.txt";
static char *cookiepolicies = "Aa@"; /* A: accept all; a: accept nothing,
                                      * @: accept no third party */
static int strictssl       = 0; /* Refuse untrusted SSL connections */

/* Languages */
static int enablespellchecking         = 0;
static const char *spellinglanguages[] = { "en_US", NULL };
static const char *preferedlanguages[] = { NULL };

/* Webkit default features */
static int enablescrollbars      = 1;
static int enablecaretbrowsing   = 1;
static int enablecache           = 1;
static int enableplugins         = 1;
static int enablescripts         = 1;
static int enableinspector       = 1;
static int enablestyle           = 1;
static int loadimages            = 1;
static int hidebackground        = 0;
static int allowgeolocation      = 1;
static int enablednsprefetching  = 0;
static int enableframeflattening = 0;

static WebKitFindOptions findopts = WEBKIT_FIND_OPTIONS_CASE_INSENSITIVE |
                                    WEBKIT_FIND_OPTIONS_WRAP_AROUND;

#define SETPROP(p, q) { \
        .v = (const char *[]){ "/bin/sh", "-c", \
             "prop=\"`xprop -id $2 $0 " \
             "| sed \"s/^$0(STRING) = \\(\\\\\"\\?\\)\\(.*\\)\\1$/\\2/\" " \
             "| xargs -0 printf %b | dmenu`\" &&" \
             "xprop -id $2 -f $1 8s -set $1 \"$prop\"", \
             p, q, winid, NULL \
        } \
}

/* DOWNLOAD(URI, referer) */
#define DOWNLOAD(d, r) { \
        .v = (const char *[]){ "/bin/sh", "-c", \
             "st -e /bin/sh -c \"curl -L -J -O --user-agent '$1'" \
             " --referer '$2' -b $3 -c $3 '$0';" \
             " sleep 5;\"", \
             d, useragent, r, cookiefile, NULL \
        } \
}

/* PLUMB(URI) */
/* This called when some URI which does not begin with "about:",
 * "http://" or "https://" should be opened.
 */
#define PLUMB(u) {\
        .v = (const char *[]){ "/bin/sh", "-c", \
             "xdg-open \"$0\"", u, NULL \
        } \
}

/* VIDEOPLAY(URI) */
#define VIDEOPLAY(u) {\
        .v = (const char *[]){ "/bin/sh", "-c", \
             "mpv --really-quiet \"$0\"", u, NULL \
        } \
}

/* styles */
/*
 * The iteration will stop at the first match, beginning at the beginning of
 * the list.
 */
static SiteStyle styles[] = {
	/* regexp               file in $styledir */
	{ ".*",                 "default.css" },
};

#define MODKEY GDK_CONTROL_MASK

/* hotkeys */
/*
 * If you use anything else but MODKEY and GDK_SHIFT_MASK, don't forget to
 * edit the CLEANMASK() macro.
 */
static Key keys[] = {
	/* modifier              keyval          function    arg */
	{ MODKEY,                GDK_KEY_g,      spawn,      SETPROP("_SURF_URI", "_SURF_GO") },
	{ MODKEY,                GDK_KEY_f,      spawn,      SETPROP("_SURF_FIND", "_SURF_FIND") },
	{ MODKEY,                GDK_KEY_slash,  spawn,      SETPROP("_SURF_FIND", "_SURF_FIND") },

	{ 0,                     GDK_KEY_Escape, stop,       { 0 } },
	{ MODKEY,                GDK_KEY_c,      stop,       { 0 } },

	{ MODKEY|GDK_SHIFT_MASK, GDK_KEY_r,      reload,     { .b = 1 } },
	{ MODKEY,                GDK_KEY_r,      reload,     { .b = 0 } },

	{ MODKEY,                GDK_KEY_l,      navigate,   { .i = +1 } },
	{ MODKEY,                GDK_KEY_h,      navigate,   { .i = -1 } },

	                                                     /* in page % */
	{ MODKEY,                GDK_KEY_j,      scroll_v,   { .i = +10 } },
	{ MODKEY,                GDK_KEY_k,      scroll_v,   { .i = -10 } },
	{ MODKEY,                GDK_KEY_b,      scroll_v,   { .i = -50 } },
	{ MODKEY,                GDK_KEY_space,  scroll_v,   { .i = +50 } },
	{ MODKEY,                GDK_KEY_i,      scroll_h,   { .i = +10 } },
	{ MODKEY,                GDK_KEY_u,      scroll_h,   { .i = -10 } },

	{ MODKEY|GDK_SHIFT_MASK, GDK_KEY_j,      zoom,       { .i = -1 } },
	{ MODKEY|GDK_SHIFT_MASK, GDK_KEY_k,      zoom,       { .i = +1 } },
	{ MODKEY|GDK_SHIFT_MASK, GDK_KEY_q,      zoom,       { .i = 0  } },
	{ MODKEY,                GDK_KEY_minus,  zoom,       { .i = -1 } },
	{ MODKEY,                GDK_KEY_plus,   zoom,       { .i = +1 } },

	{ MODKEY,                GDK_KEY_p,      clipboard,  { .b = 1 } },
	{ MODKEY,                GDK_KEY_y,      clipboard,  { .b = 0 } },

	{ MODKEY,                GDK_KEY_n,      find,       { .i = +1 } },
	{ MODKEY|GDK_SHIFT_MASK, GDK_KEY_n,      find,       { .i = -1 } },

	{ MODKEY|GDK_SHIFT_MASK, GDK_KEY_p,      print,      { 0 } },

	{ MODKEY|GDK_SHIFT_MASK, GDK_KEY_a,      togglecookiepolicy, { 0 } },
	{ 0,                     GDK_KEY_F11,    togglefullscreen, { 0 } },
	{ MODKEY|GDK_SHIFT_MASK, GDK_KEY_o,      toggleinspector, { 0 } },
	{ MODKEY|GDK_SHIFT_MASK, GDK_KEY_m,      togglestyle, { 0 } },

	{ MODKEY|GDK_SHIFT_MASK, GDK_KEY_c,      toggle,     { .i = CaretBrowsing } },
	{ MODKEY|GDK_SHIFT_MASK, GDK_KEY_f,      toggle,     { .i = FrameFlattening } },
	{ MODKEY|GDK_SHIFT_MASK, GDK_KEY_g,      toggle,     { .i = Geolocation } },
	{ MODKEY|GDK_SHIFT_MASK, GDK_KEY_s,      toggle,     { .i = JavaScript } },
	{ MODKEY|GDK_SHIFT_MASK, GDK_KEY_i,      toggle,     { .i = LoadImages } },
	{ MODKEY|GDK_SHIFT_MASK, GDK_KEY_v,      toggle,     { .i = Plugins } },
	{ MODKEY|GDK_SHIFT_MASK, GDK_KEY_b,      toggle,     { .i = ScrollBars } },
};

/* button definitions */
/* target can be OnDoc, OnLink, OnImg, OnMedia, OnEdit, OnBar, OnSel, OnAny */
static Button buttons[] = {
	/* target       event mask      button  function        argument        stop event */
	{ OnLink,       0,              2,      clicknewwindow, { .b = 0 },     1 },
	{ OnLink,       MODKEY,         2,      clicknewwindow, { .b = 1 },     1 },
	{ OnLink,       MODKEY,         1,      clicknewwindow, { .b = 1 },     1 },
	{ OnAny,        0,              8,      clicknavigate,  { .i = -1 },    1 },
	{ OnAny,        0,              9,      clicknavigate,  { .i = +1 },    1 },
	{ OnMedia,      MODKEY,         1,      clickexternplayer, { 0 },       1 },
};
