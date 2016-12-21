/* See LICENSE file for copyright and license details. */
/* Default settings; can be overriden by command line. */

static int topbar           = 1;    /* -b:  whether bar is at top or bottom of screen */
static int min              = 0;    /* -l:  lower bound */
static int max              = 100;  /* -u:  upper bound */
static int initval          = 0;    /* -x:  initial value */
static int labelval         = 1;    /* -lv: whether to display value label */
static int labelexts        = 1;    /* -le: whether to display extent labels */
static int step             = 1;    /* -s:  minimum adjustment */
static int jump             = 10;   /* -j:  large adjustment */
static const char *prompt   = NULL; /* -p:  prompt to the left of slider */
static const char *special  = NULL; /* -z:  special text */
static const char *fonts[]  = {     /* -f:  font set */
	"monospace:size=10"
};

static const char *colors[SchemeLast][2] = {
	/*                 fg         bg */
	[SchemePrompt] = { "#eeeeee", "#005577" },
	[SchemeSlider] = { "#eeeeee", "#222222" }, /* fg: extent labels, bg: slider beyond value */
	[SchemeValue]  = { "#eeeeee", "#005577" }, /* fg: value label, bg: slider up to value */
};
