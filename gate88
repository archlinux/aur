#!/bin/bash

# create the ~/.gate88 directory if needed
if [ ! -d ~/.gate88 ]; then
  mkdir -p ~/.gate88/replays
  ln -s /usr/share/gate88/gate88		\
	/usr/share/gate88/music			\
	/usr/share/gate88/sound			\
  	~/.gate88

  cp	/etc/gate88/audio.conf			\
  	/etc/gate88/irc_client.conf		\
  	/etc/gate88/multiplayer.conf		\
  	/etc/gate88/practice.conf		\
  	/etc/gate88/video.conf			\
	/etc/gate88/server.conf			\
	~/.gate88

  ln -s /etc/gate88/colours.conf		\
	/etc/gate88/textcolours.conf		\
	/etc/gate88/debug.conf			\
	/etc/gate88/irc_connection.conf		\
	/etc/gate88/masterserver.conf		\
	~/.gate88
fi

export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/share/gate88/lib"
cd ~/.gate88 && ./gate88 "$@"
