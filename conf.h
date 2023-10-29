#define FOLDER			"/home/me/.mailx/"
#define SPOOL			(FOLDER "inbox")
#define LOG(msg)

struct account {
	char *server;		/* server address */
	char *port;		/* server port */
	char *user;		/* username */
	char *pass;		/* password */
	char *uidl;		/* path of uidl file; disables uidl if NULL */
	char *cert;		/* path of server certificate pem file */
	int del;		/* delete messages after retrieving */
	int nopipe;		/* no outstanding commands */
	int stls;		/* enable starttls */
	int maxsize;		/* maximum message size to fetch */
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
