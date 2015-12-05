#define PAGER			"pg"
#define EDITOR			"vi"
#define VISUAL			"vi"
#define SENDMAIL		"sendmail"
#define FOLDER			"/home/me/.mailx/"
#define RECORD			"+inbox"
#define FROM			"my@address"
#define DRAFT			"/tmp/draft.letter"
#define HOSTNAME		"localhost"

#define NHEAD			16
#define WIDTH			80
#define DIGITS			5
#define THREADED		1
#define TRIM_RE			1
#define COLORS			1
#define MAXMIME			128

static char *hdr_filt[] = {
	"Subject:", "From:", "To:", "Cc:", "Date:"};

static char *boxes[] = {FOLDER "inbox"};
