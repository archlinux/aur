/* modifier 0 means no modifier */
static char *useragent      = "Mozilla/5.0 (X11; U; Unix; en-US) "
	"AppleWebKit/601.1 (KHTML, like Gecko) Version/8.0 Safari/601.1"
	"Surf/"VERSION;
static char *scriptfile     = "~/.surf/script.js";
static char *styledir       = "~/.surf/styles/";
static char *cachefolder    = "~/.surf/surf2cache/";

static Bool kioskmode       = FALSE; /* Ignore shortcuts */
static Bool showindicators  = TRUE;  /* Show indicators in window title */
static Bool runinfullscreen = FALSE; /* Run in fullscreen mode by default */

static guint defaultfontsize = 12;   /* Default font size */
static gfloat zoomlevel = 1.0;       /* Default zoom level */

/* Soup default features */
static char *cookiefile     = "~/.surf/surf2cookies.txt";
static char *cookiepolicies = "Aa@"; /* A: accept all; a: accept nothing,
                                        @: accept no third party */
static Bool strictssl       = FALSE; /* Refuse untrusted SSL connections */

/* Webkit default features */
static Bool enablescrollbars      = TRUE;
static Bool enablespatialbrowsing = TRUE;
static Bool enablediskcache       = TRUE;
static Bool enableplugins         = TRUE;
static Bool enablescripts         = TRUE;
static Bool enableinspector       = TRUE;
static Bool enablestyles          = TRUE;
static Bool loadimages            = TRUE;
static Bool hidebackground        = FALSE;
static Bool allowgeolocation      = TRUE;
static WebKitFindOptions findopts = WEBKIT_FIND_OPTIONS_CASE_INSENSITIVE |
                                    WEBKIT_FIND_OPTIONS_WRAP_AROUND;

#define SETPROP(p, q) { \
	.v = (char *[]){ "/bin/sh", "-c", \
		"prop=\"`xprop -id $2 $0 | cut -d '\"' -f 2 | xargs -0 printf %b | dmenu`\" &&" \
		"xprop -id $2 -f $1 8s -set $1 \"$prop\"", \
		p, q, winid, NULL \
	} \
}

/* DOWNLOAD(URI, referer) */
#define DOWNLOAD(d, r) { \
	.v = (char *[]){ "/bin/sh", "-c", \
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
	.v = (char *[]){ "/bin/sh", "-c", \
		"xdg-open \"$0\"", u, NULL \
	} \
}

/* styles */
/*
 * The iteration will stop at the first match, beginning at the beginning of
 * the list.
 */
static SiteStyle styles[] = {
	/* regexp		file in $styledir */
	{ ".*",			"default.css" },
};

#define MODKEY GDK_CONTROL_MASK

/* hotkeys */
/*
 * If you use anything else but MODKEY and GDK_SHIFT_MASK, don't forget to
 * edit the CLEANMASK() macro.
 */
static Key keys[] = {
    /* modifier	            keyval      function    arg             Focus */
    { MODKEY|GDK_SHIFT_MASK,GDK_KEY_r,      reload,     { .b = TRUE } },
    { MODKEY,               GDK_KEY_r,      reload,     { .b = FALSE } },
    { MODKEY|GDK_SHIFT_MASK,GDK_KEY_p,      print,      { 0 } },

    { MODKEY,               GDK_KEY_p,      clipboard,  { .b = TRUE } },
    { MODKEY,               GDK_KEY_y,      clipboard,  { .b = FALSE } },

    { MODKEY|GDK_SHIFT_MASK,GDK_KEY_j,      zoom,       { .i = -1 } },
    { MODKEY|GDK_SHIFT_MASK,GDK_KEY_k,      zoom,       { .i = +1 } },
    { MODKEY|GDK_SHIFT_MASK,GDK_KEY_q,      zoom,       { .i = 0  } },
    { MODKEY,               GDK_KEY_minus,  zoom,       { .i = -1 } },
    { MODKEY,               GDK_KEY_plus,   zoom,       { .i = +1 } },

    { MODKEY,               GDK_KEY_l,      navigate,   { .i = +1 } },
    { MODKEY,               GDK_KEY_h,      navigate,   { .i = -1 } },

    { MODKEY,               GDK_KEY_j,      scroll_v,   { .i = +10 } },
    { MODKEY,               GDK_KEY_k,      scroll_v,   { .i = -10 } },
    { MODKEY,               GDK_KEY_b,      scroll_v,   { .i = -50 } },
    { MODKEY,               GDK_KEY_space,  scroll_v,   { .i = +50 } },
    { MODKEY,               GDK_KEY_i,      scroll_h,   { .i = +10 } },
    { MODKEY,               GDK_KEY_u,      scroll_h,   { .i = -10 } },

    { 0,                    GDK_KEY_F11,    fullscreen, { 0 } },
    { 0,                    GDK_KEY_Escape, stop,       { 0 } },
    { MODKEY|GDK_SHIFT_MASK,GDK_KEY_o,      inspector,  { 0 } },

    { MODKEY,               GDK_KEY_g,      spawn,      SETPROP("_SURF_URI", "_SURF_GO") },
    { MODKEY,               GDK_KEY_f,      spawn,      SETPROP("_SURF_FIND", "_SURF_FIND") },
    { MODKEY,               GDK_KEY_slash,  spawn,      SETPROP("_SURF_FIND", "_SURF_FIND") },

    { MODKEY,               GDK_KEY_n,      find,       { .b = TRUE } },
    { MODKEY|GDK_SHIFT_MASK,GDK_KEY_n,      find,       { .b = FALSE } },

    { MODKEY|GDK_SHIFT_MASK,GDK_KEY_c,      toggle,     { .v = "enable-caret-browsing" } },
    { MODKEY|GDK_SHIFT_MASK,GDK_KEY_i,      toggle,     { .v = "auto-load-images" } },
    { MODKEY|GDK_SHIFT_MASK,GDK_KEY_s,      toggle,     { .v = "enable-javascript" } },
    { MODKEY|GDK_SHIFT_MASK,GDK_KEY_v,      toggle,     { .v = "enable-plugins" } },
    { MODKEY|GDK_SHIFT_MASK,GDK_KEY_a,      togglecookiepolicy, { 0 } },
    { MODKEY|GDK_SHIFT_MASK,GDK_KEY_m,      togglestyle, { 0 } },
    { MODKEY|GDK_SHIFT_MASK,GDK_KEY_b,      togglescrollbars, { 0 } },
    { MODKEY|GDK_SHIFT_MASK,GDK_KEY_g,      togglegeolocation, { 0 } },
};

/* button definitions */
/* where can be OnDoc, OnLink, OnImg, OnMedia, OnSel, OnEdit, OnAny */
static Button buttons[] = {
    /* where                event mask  button  function        argument */
    { OnLink,               0,          2,      linkopenembed,  { 0 } },
    { OnLink,               MODKEY,     2,      linkopen,       { 0 } },
    { OnLink,               MODKEY,     1,      linkopen,       { 0 } },
    { OnAny,                0,          8,      navigate,       { .i = -1 } },
    { OnAny,                0,          9,      navigate,       { .i = +1 } },
};
