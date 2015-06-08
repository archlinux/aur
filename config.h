/* See LICENSE file for copyright and license details. */
struct rule {
	const char *devregex;
	const char *user;
	const char *group;
	int mode;
	const char *path;
	const char *cmd;
} rules[] = {
	{ "null",         "root", "root",      0666, NULL,      NULL                           },
	{ "zero",         "root", "root",      0666, NULL,      NULL                           },
	{ "full",         "root", "root",      0666, NULL,      NULL                           },
	{ "random",       "root", "root",      0666, NULL,      NULL                           },
	{ "urandom",      "root", "root",      0444, NULL,      NULL                           },
	{ "hwrandom",     "root", "root",      0660, NULL,      NULL                           },
	{ "mem",          "root", "root",      0640, NULL,      NULL                           },
	{ "kmem",         "root", "root",      0640, NULL,      NULL                           },
	{ "port",         "root", "root",      0640, NULL,      NULL                           },
	{ "console",      "root", "tty",       0600, NULL,      NULL                           },
	{ "ptmx",         "root", "tty",       0666, NULL,      NULL                           },
	{ "tty",          "root", "tty",       0666, NULL,      NULL                           },
	{ "tty[0-9]",     "root", "root",      0600, NULL,      NULL                           },
	{ "tty[0-9][0-9]","root", "tty",       0660, NULL,      NULL                           },
	{ "ttyS[0-9]*",   "root", "tty",       0660, NULL,      NULL,                          },
	{ "pty.*",        "root", "tty",       0660, NULL,      NULL                           },
	{ "vcs[0-9]*",    "root", "tty",       0660, NULL,      NULL                           },
	{ "vcsa*[0-9]*",  "root", "tty",       0660, NULL,      NULL                           },
	{ "sd[a-z].*",    "root", "disk",      0660, NULL,      NULL                           },
	{ "sr[0-9]*",     "root", "cdrom",     0660, NULL,      "@ln -sf $DEVNAME /dev/cdrom"  },
	{ "ts[0-9]+",     "root", "root",      0640, "=input/", NULL                           },
	{ "input/.*",     "root", "root",      0640, "=input/", NULL                           },
	{ "dri/.*",       "root", "video",     0660, "=dri/",   NULL                           },
	{ "snd/.*",       "root", "audio",     0660, "=snd/",   NULL                           },
	{ "midi.*",       "root", "audio",     0660, "=snd/",   NULL                           },
	{ "seq",          "root", "audio",     0660, "=snd/",   NULL                           },
	{ "timer",        "root", "audio",     0660, "=snd/",   NULL                           },
	{ "rtc[0-9]*",    "root", "root",      0664, NULL,      NULL                           },
	{ "vbi[0-9]",     "root", "video",     0660, NULL,      NULL                           },
	{ "video[0-9]",   "root", "video",     0660, NULL,      NULL                           },
	{ "vboxuser",     "root", "vboxuser",  0660, NULL,      NULL                           },
	{ "fuse",         "root", "root",      0666, NULL,      NULL                           },
	{ ".*",           "root", "root",      0660, NULL,      NULL                           },
};

/* Fill into this table if you want to rename the network interface
 * identified by `mac' to `name'.  By default no such renaming takes
 * place.
 */
struct mac2name {
	unsigned char mac[6];
	const char *name;
} mac2names[] = {
	{ .mac = { 0 }, .name = NULL }
};
