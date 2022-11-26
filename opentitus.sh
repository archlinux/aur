mkdir -p ~/.opentitus
cd ~/.opentitus
cp -rn /usr/share/opentitus/* .
ln -fs titus{_`[ "$1" = moktar ] || [ "$1" = usrlevel ] && echo $1 || echo titus`,}.conf
sed -i "/^levelcount /s/`[ -f titus/LEVELG.SQZ ] && echo 14/15/\;/level 15 /s/^#// || echo 15/14/\;/level 15 /{s/^#//\;s/^/#/}`;/^finish /s/`[ -f titus/LEVELA.SQZ ] && echo TITRE/LEVELA/\;/^finishformat /s/2/0 || echo LEVELA/TITRE/\;/^finishformat /s/0/2`/" titus_usrlevel.conf
opentitus
