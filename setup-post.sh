# more logging, other config changes and use pam
sed -i -e 's:^theme=.*$:theme=authentic-theme:' "$archpkgdir"/etc/usermin/config
echo -e 'logfiles=1\nlogfullfiles=1\ngotoone=1\nnoremember=1\nshowlogin=1' >> "$archpkgdir"/etc/usermin/config
sed -i -e 's:^pidfile=.*$:pidfile=/run/usermin.pid:' -e 's:^preroot=.*$:preroot=authentic-theme:' "$archpkgdir"/etc/usermin/miniserv.conf
echo -e 'syslog=1\npam_only=1\npam_end=1\npam_conv=\nno_pam=0\nlogouttime=10\nuser_mapping_reverse=1' >> "$archpkgdir"/etc/usermin/miniserv.conf
