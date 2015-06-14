#
# Regular cron jobs for the openssh-known-hosts package
#
0 *	* * *	root	[ -x /usr/bin/update-openssh-known-hosts ] && { sleep `od -An -N1 -tu1 /dev/urandom`; /usr/bin/update-openssh-known-hosts; }
