RTP=/usr/share/rtp/2000

if [ -z "$RPG2K_RTP_PATH" ]; then
  RPG2K_RTP_PATH=$RTP
else
  # add to end of path list
  RPG2K_RTP_PATH=${RPG2K_RTP_PATH}:$RTP
fi

export RPG2K_RTP_PATH
