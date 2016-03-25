#!/bin/sh

# try 3 times only
i=1
while [ $i -le 3 ]; do
	if curl --connect-timeout 2 -s www.google.com > /dev/null ; then
		break
	fi

	if curl --connect-timeout 2 -s www.baidu.com > /dev/null ; then
		break
	fi

	seconds=$((15 * $i))
	sleep $seconds

	let i=i+1
done

# starting the work even without network availability
cd /usr/lib/bing-wallpaper
./bing_wallpaper.sh
