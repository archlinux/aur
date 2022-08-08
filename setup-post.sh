# more logging, other config changes and use pam
echo -e 'logfiles=1\nlogfullfiles=1\ngotoone=1\nnoremember=1\nnowebminup=1' >> "$archpkgdir"/etc/webmin/config
sed -i -e 's:miniserv.pid:webmin.pid:g' -e 's:WEBMIN_VAR:/run:g' -e 's:WEBMIN_KILLCMD:/usr/bin/kill:g' -e 's:WEBMIN_CONFIG:/etc/webmin:g' -e 's:WEBMIN_LIBDIR:/opt/webmin:g' "$archpkgdir"/opt/webmin/webmin-systemd
sed -i -e 's:^pidfile=.*$:pidfile=/run/webmin.pid:' "$archpkgdir"/etc/webmin/miniserv.conf
echo -e 'pam_only=1\npam_end=1\npam_conv=\nno_pam=0\nlogouttime=10' >> "$archpkgdir"/etc/webmin/miniserv.conf
