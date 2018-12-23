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
	{ "console",      "root", "tty",   0600, NULL,      NULL                           },
	{ "pty.*",        "root", "tty",   0660, NULL,      NULL                           },
	{ "ptmx",         "root", "tty",   0666, NULL,      NULL                           },
	{ "tty",          "root", "tty",   0666, NULL,      NULL                           },
	{ "tty[0-9]",     "root", "root",  0600, NULL,      NULL                           },
	{ "tty[0-9][0-9]","root", "tty",   0660, NULL,      NULL                           },
	{ "vcs[0-9]*",    "root", "tty",   0660, NULL,      NULL                           },
	{ "vcsa*[0-9]*",  "root", "tty",   0660, NULL,      NULL                           },
	// serial
	{ "ttyS[0-9]*",   "root", "tty",   0660, NULL,      NULL                           },
	{ "ttyUSB[0-9]*", "root", "tty",   0660, NULL,      NULL                           },
	{ "ttyACM[0-9]*", "root", "tty",   0660, NULL,      NULL                           },
	{ "ttyLTM[0-9]*", "root", "tty",   0660, NULL,      NULL                           },
	{ "ttySHSF[0-9]*","root", "tty",   0660, NULL,      NULL                           },
	{ "slamr",        "root", "tty",   0660, NULL,      NULL                           },
	{ "slusb",        "root", "tty",   0660, NULL,      NULL                           },
	{ "vport.*",      "root", "root",  0660, NULL,      NULL                           },
	{ "ircomm[0-9]*", "root", "uucp",  0660, NULL,      NULL                           },
	{ "noz[0-9]*",    "root", "uucp",  0660, NULL,      NULL                           },
	{ "rfcomm[0-9]*", "root", "uucp",  0660, NULL,      NULL                           },
	{ "mwave",        "root", "uucp",  0660, NULL,      NULL                           },
	{ "hvc.*",        "root", "uucp",  0660, NULL,      NULL                           },
	{ "hvi.*",        "root", "uucp",  0660, NULL,      NULL                           },
	{ "ppox[0-9]*",   "root", "uucp",  0660, NULL,      NULL                           },
	// mem
	{ "null",         "root", "root",  0666, NULL,      NULL                           },
	{ "zero",         "root", "root",  0666, NULL,      NULL                           },
	{ "full",         "root", "root",  0666, NULL,      NULL                           },
	{ "random",       "root", "root",  0666, NULL,      "@/etc/smdev/proceeddev"        },
	{ "urandom",      "root", "root",  0444, NULL,      "@/etc/smdev/proceeddev"        },
	{ "hwrandom",     "root", "root",  0660, NULL,      "@/etc/smdev/proceeddev"        },
	{ "hw_random",    "root", "root",  0660, "=hwrng",  "@/etc/smdev/proceeddev"        },
	{ "mem",          "root", "kmem",  0640, NULL,      "@/etc/smdev/proceeddev"        },
	{ "kmem",         "root", "kmem",  0640, NULL,      "@/etc/smdev/proceeddev"        },
	{ "port",         "root", "kmem",  0640, NULL,      "@/etc/smdev/proceeddev"        },
	{ "nvram",        "root", "kmem",  0640, NULL,      "@/etc/smdev/proceeddev"        },
	// input
	{ "input/.*",     "root", "input", 0660, "=input/", "@/etc/smdev/proceeddev"        },
	{ "ts[0-9]+",     "root", "root",  0640, "=input/", "@/etc/smdev/proceeddev"        },
	// graphics
	{ "video.*",      "root", "video", 0660, NULL,      "@/etc/smdev/proceeddev"        },
	{ "vbi[0-9]",     "root", "video", 0660, NULL,      "@/etc/smdev/proceeddev"        },
	{ "agpgart",      "root", "video", 0660, NULL,      "@/etc/smdev/proceeddev"        },
	{ "pmu",          "root", "video", 0660, NULL,      "@/etc/smdev/proceeddev"        },
	{ "fb[0-9]*",     "root", "video", 0660, NULL,      "@/etc/smdev/proceeddev"        },
	{ "nvidia",       "root", "video", 0660, NULL,      "@/etc/smdev/proceeddev"        },
	{ "nvidiactl",    "root", "video", 0660, NULL,      "@/etc/smdev/proceeddev"        },
	// dri
	{ "dri/.*",       "root", "video", 0660, "=dri/",   "@/etc/smdev/proceeddev"        },
	{ "card[0-9]*",   "root", "video", 0660, "=dri/",   "@/etc/smdev/proceeddev"        },
	// usb
	{ "bus/usb/.*"    "root", "usb",   0665, NULL,      "@/etc/smdev/proceeddev"        },
	// printer
	{ "partport[0-9]*","root","lp",    0660, NULL,      "@/etc/smdev/proceeddev"        },
	{ "partport_pc",  "root", "lp",    0660, NULL,      "@/etc/smdev/proceeddev"        },
	{ "lp[-9]*",      "root", "lp",    0660, NULL,      "@/etc/smdev/proceeddev"        },
	{ "irlpt[0-9]*",  "root"," lp",    0660, NULL,      "@/etc/smdev/proceeddev"        },
	// block
	{ "sd[a-z].*",    "root", "disk",  0660, NULL,      "@/etc/smdev/proceeddev"        },
	{ "hd[a-z].*",    "root", "disk",  0660, NULL,      "@/etc/smdev/proceeddev"        },
	{ "ram[0-9]*",    "root", "disk",  0660, NULL,      "@/etc/smdev/proceeddev"        },
	{ "loop[0-9]*",   "root", "disk",  0660, NULL,      "@/etc/smdev/proceeddev"        },
	{ "control",      "root", "disk",  0660, NULL,      "@/etc/smdev/proceeddev"        },
	{ "md.*",         "root", "disk",  0660, NULL,      "@/etc/smdev/proceeddev"        },
	{ "mtd.*",        "root", "disk",  0660, NULL,      "@/etc/smdev/proceeddev"        },
	{ "ndb.*",        "root", "disk",  0660, NULL,      "@/etc/smdev/proceeddev"        },
	{ "gnbd.*",       "root", "disk",  0660, NULL,      "@/etc/smdev/proceeddev"        },
	{ "btibm.*",      "root", "disk",  0660, NULL,      "@/etc/smdev/proceeddev"        },
	{ "dm-.*",        "root", "disk",  0660, NULL,      "@/etc/smdev/proceeddev"        },
	{ "vd.*",         "root", "disk",  0660, NULL,      "@/etc/smdev/proceeddev"        },
	{ "sg.*",         "root", "disk",  0660, NULL,      "@/etc/smdev/proceeddev"        },
	{ "sr[0-9]*",     "root", "cdrom", 0660, NULL,      "@/etc/smdev/proceeddev"        },//"@ln -sf $DEVNAME /dev/cdrom"
	{ "fd[0-9]*",     "root", "disk",  0660, NULL,      "@/etc/smdev/proceeddev"        },
	// tape
	{ "ht[0-9]*",     "root", "tape",  0660, NULL,      "@/etc/smdev/proceeddev"        },
	{ "nht[0-9]*",    "root", "tape",  0660, NULL,      "@/etc/smdev/proceeddev"        },
	{ "pt[0-9]*",     "root", "tape",  0660, NULL,      "@/etc/smdev/proceeddev"        },
	{ "npt[0-9]*",    "root", "tape",  0660, NULL,      "@/etc/smdev/proceeddev"        },
	{ "pht[0-9]*",    "root", "tape",  0660, NULL,      "@/etc/smdev/proceeddev"        },
	{ "st*[0-9]*",    "root", "tape",  0660, NULL,      "@/etc/smdev/proceeddev"        },
	{ "nst*[0-9]*",   "root", "tape",  0660, NULL,      "@/etc/smdev/proceeddev"        },
	//block-related
	{ "mapper/.*",    "root", "root",  0600, "=mapper/","@/etc/smdev/proceeddev"        },
	{ "scsi.*/.*",    "root", "disk",  0660, NULL,      "@/etc/smdev/proceeddev"        },
	{ "bdi.*/.*",     "root", "disk",  0660, NULL,      "@/etc/smdev/proceeddev"        },
	{ "sch[0-9]*",    "root", "disk",  0660, NULL,      "@/etc/smdev/proceeddev"        },
	{ "pg[0-9]*",     "root", "disk",  0660, NULL,      "@/etc/smdev/proceeddev"        },
	{ "qft[0-9]*",    "root", "disk",  0660, NULL,      "@/etc/smdev/proceeddev"        },
	{ "nqft[0-9]*",   "root", "disk",  0660, NULL,      "@/etc/smdev/proceeddev"        },
	{ "zqft[0-9]*",   "root", "disk",  0660, NULL,      "@/etc/smdev/proceeddev"        },
	{ "nzqft[0-9]*",  "root", "disk",  0660, NULL,      "@/etc/smdev/proceeddev"        },
	{ "rawqft[0-9]*", "root", "disk",  0660, NULL,      "@/etc/smdev/proceeddev"        },
	{ "nrawqft[0-9]*","root", "disk",  0660, NULL,      "@/etc/smdev/proceeddev"        },
	{ "raw[0-9]*",    "root", "disk",  0660, "=raw/",   "@/etc/smdev/proceeddev"        },
	{ "rawctl",       "root", "disk",  0660, "=raw/",   "@/etc/smdev/proceeddev"        },
	{ "aoe.*",        "root", "disk",  0660, "=etherd/","@/etc/smdev/proceeddev"        },
	{ "bsg/.*",       "root", "disk",  0660, "=bsg/",   "@/etc/smdev/proceeddev"        },
	// audio
	{ "snd/.*",       "root", "audio", 0660, "=snd/",   "@/etc/smdev/proceeddev"        },
	{ "midi.*",       "root", "audio", 0660, "=snd/",   "@/etc/smdev/proceeddev"        },
	{ "seq",          "root", "audio", 0660, "=snd/",   "@/etc/smdev/proceeddev"        },
	{ "timer",        "root", "audio", 0660, "=snd/",   "@/etc/smdev/proceeddev"        },
	{ "hpet",         "root", "audio", 0660, "=snd/",   "@/etc/smdev/proceeddev"        },
	{ "adsp",         "root", "audio", 0660, "=snd/",   "@/etc/smdev/proceeddev"        },
	{ "audio",        "root", "audio", 0660, "=snd/",   "@/etc/smdev/proceeddev"        },
	{ "dsp",          "root", "audio", 0660, "=snd/",   "@/etc/smdev/proceeddev"        },
	{ "mixer",        "root", "audio", 0660, "=snd/",   "@/etc/smdev/proceeddev"        },
	{ "sequencer.*",  "root", "audio", 0660, "=snd/",   "@/etc/smdev/proceeddev"        },
	{ "timer",        "root", "audio", 0660, "=snd/",   "@/etc/smdev/proceeddev"        },
	{ "pcm*",         "root", "audio", 0660, "=snd/",   "@/etc/smdev/proceeddev"        },
	// network
	{ "-net/.*",      "root", "root",  0600, NULL,      "@nameif"                      },
	{ "tun",          "root", "root",  0666, "=net/",   "@/etc/smdev/proceeddev"        },
	{ "tun[0-9]*",    "root", "root",  0600, "=net/",   "@/etc/smdev/proceeddev"        },
	{ "tap[0-9]*",    "root", "root",  0600, "=net/",   "@/etc/smdev/proceeddev"        },
	{ "rfkill",       "root", "rfkill",0640, NULL,      "@/etc/smdev/proceeddev"        },
	// cpu
	{ "cpu([0-9]+)",  "root", "root",  0444, "=cpu/%1/cpuid", "@/etc/smdev/proceeddev"        },
	{ "msr([0-9]+)",  "root", "root",  0600, "=cpu/%1/msr",   "@/etc/smdev/proceeddev"        },
	{ "microcode",    "root", "root",  0600, "=cpu/microcode","@/etc/smdev/proceeddev"        },
	// fuse
	{ "fuse",         "root", "root",  0666, NULL,      "@mount -t fusectl fusectl /sys/fs/fuse/connections"},
	// raid controllers
	{ "cciss.*",      "root", "disk",  0660, NULL,      "@/etc/smdev/proceeddev"        },
	{ "ida.*",        "root", "disk",  0660, NULL,      "@/etc/smdev/proceeddev"        },
	{ "rd.*",         "root", "disk",  0660, NULL,      "@/etc/smdev/proceeddev"        },
	// misc
	{ "ppp",          "root", "root",  0000, NULL,      "@/etc/smdev/proceeddev"        },
	{ "kvm",          "root", "kvm",   0660, NULL,      "@/etc/smdev/proceeddev"        },
	{ "rtc",          "root", "root",  0660, NULL,      "@/etc/smdev/proceeddev"        },
	{ "rtc[0-9]*",    "root", "root",  0664, NULL,      "@/etc/smdev/proceeddev"        },
	{ "mmtimer",      "root", "root",  0644, NULL,      "@/etc/smdev/proceeddev"        },
	{ "rflash[0-9]*", "root", "root",  0400, NULL,      "@/etc/smdev/proceeddev"        },
	{ "rrom[0-9]*",   "root", "root",  0400, NULL,      "@/etc/smdev/proceeddev"        },
	{ "auer[0-9]*",   "root", "root",  0660, "=usb/",   "@/etc/smdev/proceeddev"        },
	{ "sxctl",        "root", "root",  0660, "=specialix_sxctl/",   "@/etc/smdev/proceeddev"        },
	{ "rioctl",       "root", "root",  0660, "=specialix_rioctl/",  "@/etc/smdev/proceeddev"        },
	//arch
	{ "sgi_.*",       "root", "root",  0666, NULL,      "@/etc/smdev/proceeddev"        },
	{ "iseries/ibmsis.*","root","disk",0660, NULL,      "@/etc/smdev/proceeddev"        },
	{ "iseries/nvt.*","root", "disk",  0660, NULL,      "@/etc/smdev/proceeddev"        },
	{ "iseries/vt.*", "root", "disk",  0660, NULL,      "@/etc/smdev/proceeddev"        },
	{ "iseries/vtty.*","root","disk",  0660, NULL,      "@/etc/smdev/proceeddev"        },
	
	{ ".*",           "root", "root",  0660, NULL,      "@/etc/smdev/proceeddev"        },
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
