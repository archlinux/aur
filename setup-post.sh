# more logging, other config changes and use pam
echo -e 'logfiles=1\nlogfullfiles=1\ngotoone=1\nnoremember=1' >> "$archpkgdir"/etc/webmin/config
sed -i -e 's:/var/webmin/miniserv.pid:/run/webmin.pid:g' "$archpkgdir"/opt/webmin/webmin-systemd
sed -i -e 's:^pidfile=.*$:pidfile=/run/webmin.pid:' "$archpkgdir"/etc/webmin/miniserv.conf
echo -e 'pam_only=1\npam_end=1\npam_conv=\nno_pam=0\nlogouttime=10' >> "$archpkgdir"/etc/webmin/miniserv.conf
