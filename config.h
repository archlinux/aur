#define MAXMAILS		(1 << 12)
#define MAXSIZE			(1 << 21)
#define FOLDER			"/home/me/.mailx/"
#define SPOOL			(FOLDER "inbox")
#define DPRINT(msg, len)

struct account {
	char *server;		/* server address */
	char *port;		/* server port */
	char *user;		/* username */
	char *pass;		/* password */
	char *uidl;		/* path of uidl file; disables uidl if NULL */
	char *cert;		/* path of server certificate pem file */
	int del;		/* delete messages after retrieving */
	int nopipe;		/* no outstanding commands */
} accounts [] = {
	{"server", "port", "username", "password"},
};

struct filter {
	char *hdr;		/* header name */
	char *val;		/* pattern to match */
	char *dst;		/* destination mbox file */
} filters[] = {
	{"HDR:", "KEY", FOLDER "dst"},
};
