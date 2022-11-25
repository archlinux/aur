mkdir -p ~/.opentitus
cd ~/.opentitus
cp -rn /usr/share/opentitus/* .
ln -fs titus{_`[ "$1" = moktar ] || [ "$1" = usrlevel ] && echo $1 || echo titus`,}.conf
sed -i "/levelcount /s/`[ -f titus/LEVELG.SQZ ] && echo 14/15/\;/level 15 /s/^#// || echo 15/14/\;/level 15 /{s/^#//\;s/^/#/}`;/finish /{s/^#//;`[ -f titus/LEVELA.SQZ ] || echo s/^/#/`}" titus_usrlevel.conf
opentitus
