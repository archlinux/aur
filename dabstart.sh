#!/bin/bash
trap killsubs SIGINT

MYPIPE=$(mktemp -u)
mkfifo $MYPIPE

killsubs() {
	echo killing $DABPID and $FFMPID
	kill $DABPID
	kill $FFMPID
	rm $MYPIPE
	cp /srv/http/data/webradiosimg/dablogo.jpg /srv/http/data/shm/webradio/DABslide.jpg
	echo NO INFO >/srv/http/data/shm/webradio/DABlabel.txt
}

# check if another radio is playing, in case give time to the rtsp server to stop it
if pidof -q dab-rtlsdr-3 ;then sleep 4;fi
dab-rtlsdr-3 -S $1 -C $2 -i /srv/http/data/shm/webradio > $MYPIPE &
DABPID=$!
ffmpeg -re -stream_loop -1 -ar 48000 -ac 2 -f s16le  -i $MYPIPE -vn -c:a aac -b:a 160k -metadata title="Dab radio" -f rtsp rtsp://localhost:$3/$4 >/dev/null 2>&1 &
#ffmpeg -re -stream_loop -1 -ar 48000 -ac 2 -f s16le  -i $MYPIPE -vn -c:a mp3 -f rtsp rtsp://localhost:$3/$4 >/dev/null 2>&1 &
FFMPID=$!
#echo starting DAB for service $1 with PID $DABPID and ffmpeg with PID $FFMPID to file $MYPIPE
wait $FFMPID
