static const Rule rules[] = {
	/* ACTION    SUBSYSTEM      other env variables   command to run */
	{  "add",    NULL,          "DEVNAME",            "/usr/bin/smdev"          },
	{  "remove", NULL,          "DEVNAME",            "/usr/bin/smdev"          },
	{  "add",    NULL,          "MODALIAS",           "/usr/bin/modprobe_env"   },
	{  "add",    NULL,          NULL,                 "/usr/bin/libudev-helper" },
	{  "remove", NULL,          NULL,                 "/usr/bin/libudev-helper" },
	{  "bind",   NULL,          NULL,                 "/usr/bin/libudev-helper" },
	{  "change", NULL,          NULL,                 "/usr/bin/libudev-helper" },
};
