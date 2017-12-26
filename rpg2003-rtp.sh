RTP=/usr/share/rtp/2003

if [ -z "$RPG2K3_RTP_PATH" ]; then
  RPG2K3_RTP_PATH=$RTP
else
  # add to end of path list
  RPG2K3_RTP_PATH=${RPG2K3_RTP_PATH}:$RTP
fi

export RPG2K3_RTP_PATH
