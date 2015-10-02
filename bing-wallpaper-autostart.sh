#!/bin/sh

while true; do
	if curl --connect-timeout 2 -s www.google.com > /dev/null ; then
		break
	fi

	if curl --connect-timeout 2 -s www.baidu.com > /dev/null ; then
		break
	fi

	sleep 5
done

cd /usr/lib/bing-wallpaper
./bing_wallpaper.sh
