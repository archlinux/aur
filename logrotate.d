/var/log/thttpd/*log {
	missingok
	postrotate
	test -d /sys/fs/cgroup/systemd && {
		systemctl status thttpd.service | grep -q running &&
		systemctl restart thttpd.service >/dev/null 
	} || {
		rc.d list thttpd | grep -q STARTED &&
		/etc/rc.d/thttpd restart >/dev/null
	}
	endscript
}
