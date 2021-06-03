/* See LICENSE file for copyright and license details. */
struct rule {
	const char *devregex;
	const char *user;
	const char *group;
	int mode;
	const char *path;
	const char *cmd;
} rules[] = {
	//tty
	{ "console",       "root", "tty",   0600, NULL,      NULL                           },
	{ "pty.*",         "root", "tty",   0660, NULL,      NULL                           },
	{ "ptmx",          "root", "tty",   0666, NULL,      NULL                           },
	{ "tty",           "root", "tty",   0666, NULL,      NULL                           },
	{ "tty[0-9]",      "root", "tty",   0600, NULL,      NULL                           },
	{ "tty[0-9][0-9]", "root", "tty",   0660, NULL,      NULL                           },
	{ "vcs*[0-9].*",    "root", "tty",   0660, NULL,      NULL                           },
	// serial
	{ "tty.*",         "root", "uucp",  0660, NULL,      NULL                           },
	{ "slamr",         "root", "tty",   0660, NULL,      NULL                           },
	{ "slusb",         "root", "tty",   0660, NULL,      NULL                           },
	{ "vport.*",       "root", "root",  0660, NULL,      NULL                           },
	{ "ircomm[0-9].*", "root", "uucp",  0660, NULL,      NULL                           },
	{ "noz[0-9].*",    "root", "uucp",  0660, NULL,      NULL                           },
	{ "rfcomm[0-9].*", "root", "uucp",  0660, NULL,      NULL                           },
	{ "mwave",         "root", "uucp",  0660, NULL,      NULL                           },
	{ "hvc.*",         "root", "uucp",  0660, NULL,      NULL                           },
	{ "hvi.*",         "root", "uucp",  0660, NULL,      NULL                           },
	{ "ppox[0-9].*",   "root", "uucp",  0660, NULL,      NULL                           },
	// mem
	{ "null",          "root", "root",  0666, NULL,      NULL                           },
	{ "zero",          "root", "root",  0666, NULL,      NULL                           },
	{ "full",          "root", "root",  0666, NULL,      NULL                           },
	{ "random",        "root", "root",  0666, NULL,      "@/etc/smdev/processdev"        },
	{ "urandom",       "root", "root",  0444, NULL,      "@/etc/smdev/processdev"        },
	{ "hwrandom",      "root", "root",  0660, NULL,      "@/etc/smdev/processdev"        },
	{ "hw_random",     "root", "root",  0660, "=hwrng",  "@/etc/smdev/processdev"        },
	{ "mem",           "root", "kmem",  0640, NULL,      "@/etc/smdev/processdev"        },
	{ "kmem",          "root", "kmem",  0640, NULL,      "@/etc/smdev/processdev"        },
	{ "port",          "root", "kmem",  0640, NULL,      "@/etc/smdev/processdev"        },
	{ "nvram",         "root", "kmem",  0640, NULL,      "@/etc/smdev/processdev"        },
	// input
	{ "input/.*",      "root", "input", 0660, "=input/", "@/etc/smdev/processdev"        },
	{ "ts[0-9].+",     "root", "root",  0640, "=input/", "@/etc/smdev/processdev"        },
	// graphics
	{ "video.*",       "root", "video", 0660, NULL,      "@/etc/smdev/processdev"        },
	{ "vchiq",         "root", "video", 0660, NULL,      "@/etc/smdev/processdev"        },
	{ "vbi[0-9]",      "root", "video", 0660, NULL,      "@/etc/smdev/processdev"        },
	{ "cec[0-9]",      "root", "video", 0660, NULL,      "@/etc/smdev/processdev"        },
	{ "agpgart",       "root", "video", 0660, NULL,      "@/etc/smdev/processdev"        },
	{ "pmu",           "root", "video", 0660, NULL,      "@/etc/smdev/processdev"        },
	{ "fb[0-9].*",     "root", "video", 0660, NULL,      "@/etc/smdev/processdev"        },
	{ "nvidia",        "root", "video", 0660, NULL,      "@/etc/smdev/processdev"        },
	{ "nvidiactl",     "root", "video", 0660, NULL,      "@/etc/smdev/processdev"        },
	// dri
	{ "dri/.*",        "root", "video", 0660, "=dri/",   "@/etc/smdev/processdev"        },
	{ "card[0-9].*",   "root", "video", 0660, "=dri/",   "@/etc/smdev/processdev"        },
	// usb
	{ "bus/usb/.*",    "root",  "usb",   0664, NULL,      "@/etc/smdev/processdev"        },
	// printer
	{ "partport[0-9].*","root", "lp",    0660, NULL,      "@/etc/smdev/processdev"        },
	{ "partport_pc",    "root", "lp",    0660, NULL,      "@/etc/smdev/processdev"        },
	{ "usb/lp[0-9].*",  "root", "lp",    0660, "=usb/",   "@/etc/smdev/processdev"        },
	{ "lp[0-9]*",       "root", "lp",    0660, NULL,      "@/etc/smdev/processdev"        },
	{ "irlpt[0-9].*",   "root"," lp",    0660, NULL,      "@/etc/smdev/processdev"        },
	// block
	{ "sd[a-z].*",      "root", "disk",  0660, NULL,      "@/etc/smdev/processdev"        },
	{ "hd[a-z].*",      "root", "disk",  0660, NULL,      "@/etc/smdev/processdev"        },
	{ "ram[0-9].*",     "root", "disk",  0660, NULL,      "@/etc/smdev/processdev"        },
	{ "loop[0-9].*",    "root", "disk",  0660, NULL,      "@/etc/smdev/processdev"        },
	{ "control",        "root", "disk",  0660, NULL,      "@/etc/smdev/processdev"        },
	{ "mmcblk[0-9].*",  "root", "disk",  0660, NULL,      "@/etc/smdev/processdev"        },
	{ "md.*",           "root", "disk",  0660, NULL,      "@/etc/smdev/processdev"        },
	{ "mtd.*",          "root", "disk",  0660, NULL,      "@/etc/smdev/processdev"        },
	{ "ndb.*",          "root", "disk",  0660, NULL,      "@/etc/smdev/processdev"        },
	{ "gnbd.*",         "root", "disk",  0660, NULL,      "@/etc/smdev/processdev"        },
	{ "btibm.*",        "root", "disk",  0660, NULL,      "@/etc/smdev/processdev"        },
	{ "dm-.*",          "root", "disk",  0660, NULL,      "@/etc/smdev/processdev"        },
	{ "vd.*",           "root", "disk",  0660, NULL,      "@/etc/smdev/processdev"        },
	{ "sg.*",           "root", "disk",  0660, NULL,      "@/etc/smdev/processdev"        },
	{ "sr[0-9].*",      "root", "cdrom", 0660, NULL,      "@/etc/smdev/processdev"        },//"@ln -sf $DEVNAME /dev/cdrom"
	{ "fd[0-9].*",      "root", "disk",  0660, NULL,      "@/etc/smdev/processdev"        },
	// tape
	{ "ht[0-9].*",      "root", "tape",  0660, NULL,      "@/etc/smdev/processdev"        },
	{ "nht[0-9].*",     "root", "tape",  0660, NULL,      "@/etc/smdev/processdev"        },
	{ "pt[0-9].*",      "root", "tape",  0660, NULL,      "@/etc/smdev/processdev"        },
	{ "npt[0-9].*",     "root", "tape",  0660, NULL,      "@/etc/smdev/processdev"        },
	{ "pht[0-9].*",     "root", "tape",  0660, NULL,      "@/etc/smdev/processdev"        },
	{ "st*[0-9].*",     "root", "tape",  0660, NULL,      "@/etc/smdev/processdev"        },
	{ "nst*[0-9].*",    "root", "tape",  0660, NULL,      "@/etc/smdev/processdev"        },
	//block-related
	{ "btrfs-control",  "root", "root",  0600, NULL,      "@/etc/smdev/processdev"        },
	{ "loop-control",   "root", "disk",  0660, NULL,      "@/etc/smdev/processdev"        },
	{ "mapper/.*",      "root", "root",  0600, "=mapper/","@/etc/smdev/processdev"        },
	{ "scsi.*/.*",      "root", "disk",  0660, NULL,      "@/etc/smdev/processdev"        },
	{ "bdi.*/.*",       "root", "disk",  0660, NULL,      "@/etc/smdev/processdev"        },
	{ "sch[0-9].*",     "root", "disk",  0660, NULL,      "@/etc/smdev/processdev"        },
	{ "pg[0-9].*",      "root", "disk",  0660, NULL,      "@/etc/smdev/processdev"        },
	{ "qft[0-9].*",     "root", "disk",  0660, NULL,      "@/etc/smdev/processdev"        },
	{ "nqft[0-9].*",    "root", "disk",  0660, NULL,      "@/etc/smdev/processdev"        },
	{ "zqft[0-9].*",    "root", "disk",  0660, NULL,      "@/etc/smdev/processdev"        },
	{ "nzqft[0-9].*",   "root", "disk",  0660, NULL,      "@/etc/smdev/processdev"        },
	{ "rawqft[0-9].*",  "root", "disk",  0660, NULL,      "@/etc/smdev/processdev"        },
	{ "nrawqft[0-9].*", "root", "disk",  0660, NULL,      "@/etc/smdev/processdev"        },
	{ "raw[0-9].*",     "root", "disk",  0660, "=raw/",   "@/etc/smdev/processdev"        },
	{ "rawctl",         "root", "disk",  0660, "=raw/",   "@/etc/smdev/processdev"        },
	{ "aoe.*",          "root", "disk",  0660, "=etherd/","@/etc/smdev/processdev"        },
	{ "bsg/.*",         "root", "disk",  0660, "=bsg/",   "@/etc/smdev/processdev"        },
	// audio
	{ "snd/.*",         "root", "audio", 0660, "=snd/",   "@/etc/smdev/processdev"        },
	{ "midi.*",         "root", "audio", 0660, "=snd/",   "@/etc/smdev/processdev"        },
	{ "seq",            "root", "audio", 0660, "=snd/",   "@/etc/smdev/processdev"        },
	{ "timer",          "root", "audio", 0660, "=snd/",   "@/etc/smdev/processdev"        },
	{ "hpet",           "root", "audio", 0660, "=snd/",   "@/etc/smdev/processdev"        },
	{ "adsp",           "root", "audio", 0660, "=snd/",   "@/etc/smdev/processdev"        },
	{ "audio",          "root", "audio", 0660, "=snd/",   "@/etc/smdev/processdev"        },
	{ "dsp",            "root", "audio", 0660, "=snd/",   "@/etc/smdev/processdev"        },
	{ "mixer",          "root", "audio", 0660, "=snd/",   "@/etc/smdev/processdev"        },
	{ "sequencer.*",    "root", "audio", 0660, "=snd/",   "@/etc/smdev/processdev"        },
	{ "timer",          "root", "audio", 0660, "=snd/",   "@/etc/smdev/processdev"        },
	{ "pcm.*",          "root", "audio", 0660, "=snd/",   "@/etc/smdev/processdev"        },
	// network
	{ "-net/.*",        "root", "network",  0660, NULL,      "@nameif"                      },
	{ "tun",            "root", "network",  0666, "=net/",   "@/etc/smdev/processdev"        },
	{ "tun[0-9].*",     "root", "network",  0660, "=net/",   "@/etc/smdev/processdev"        },
	{ "tap[0-9].*",     "root", "network",  0660, "=net/",   "@/etc/smdev/processdev"        },
	{ "rfkill",         "root", "rfkill",   0640, NULL,      "@/etc/smdev/processdev"        },
	// cpu
	{ "cpu([0-9].+)",   "root", "root",  0444, "=cpu/%1/cpuid", "@/etc/smdev/processdev"        },
	{ "msr([0-9].+)",   "root", "root",  0600, "=cpu/%1/msr",   "@/etc/smdev/processdev"        },
	{ "microcode",      "root", "root",  0600, "=cpu/microcode","@/etc/smdev/processdev"        },
	// fuse
	{ "fuse",           "root", "root",  0666, NULL,      "@mount -t fusectl fusectl /sys/fs/fuse/connections"},
	// raid controllers
	{ "cciss.*",        "root", "disk",  0660, NULL,      "@/etc/smdev/processdev"        },
	{ "ida.*",          "root", "disk",  0660, NULL,      "@/etc/smdev/processdev"        },
	{ "rd.*",           "root", "disk",  0660, NULL,      "@/etc/smdev/processdev"        },
	// misc
	{ "ppp",            "root", "root",  0000, NULL,      "@/etc/smdev/processdev"        },
	{ "kvm",            "root", "kvm",   0660, NULL,      "@/etc/smdev/processdev"        },
	{ "vhost-net",      "root", "kvm",   0666, NULL,      "@/etc/smdev/processdev"        },
	{ "vhost-vsock",    "root", "kvm",   0666, NULL,      "@/etc/smdev/processdev"        },
	{ "rtc",            "root", "root",  0660, NULL,      "@/etc/smdev/processdev"        },
	{ "rtc[0-9]*",      "root", "root",  0664, NULL,      "@/etc/smdev/processdev"        },
	{ "mmtimer",        "root", "root",  0644, NULL,      "@/etc/smdev/processdev"        },
	{ "rflash[0-9]*",   "root", "root",  0400, NULL,      "@/etc/smdev/processdev"        },
	{ "rrom[0-9]*",     "root", "root",  0400, NULL,      "@/etc/smdev/processdev"        },
	{ "auer[0-9]*",     "root", "root",  0660, "=usb/",   "@/etc/smdev/processdev"        },
	{ "sxctl",          "root", "root",  0660, "=specialix_sxctl/",   "@/etc/smdev/processdev"        },
	{ "rioctl",         "root", "root",  0660, "=specialix_rioctl/",  "@/etc/smdev/processdev"        },
	//arch
	{ "sgi_.*",         "root", "root",  0666, NULL,      "@/etc/smdev/processdev"        },
	{ "iseries/ibmsis.*","root","disk",  0660, NULL,      "@/etc/smdev/processdev"        },
	{ "iseries/nvt.*",  "root", "disk",  0660, NULL,      "@/etc/smdev/processdev"        },
	{ "iseries/vt.*",   "root", "disk",  0660, NULL,      "@/etc/smdev/processdev"        },
	{ "iseries/vtty.*", "root", "disk",  0660, NULL,      "@/etc/smdev/processdev"        },
	
	{ ".*",             "root", "root",  0660, NULL,      "@/etc/smdev/processdev"        },
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
