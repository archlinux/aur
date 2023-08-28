#!/usr/bin/env sh
EXTRA_FLAGS="$@"

#Check if XDG_SESSION_TYPE is set
if [ -z "$XDG_SESSION_TYPE" ]
then
  echo "XDG_SESSION_TYPE is not set, cannot apply extra flags"
elif [ "$XDG_SESSION_TYPE" == "x11" ]
then
  EXTRA_FLAGS="--no-sandbox ${EXTRA_FLAGS}"
elif [ "$XDG_SESSION_TYPE" == "wayland" ]
then
  EXTRA_FLAGS="--enable-features=VaapiVideoDecoder,VaapiVideoEncoder,WebrtcPipewireCapturer,UseOzonePlatform --ozone-platform=wayland ${EXTRA_FLAGS}"
else
  echo "Unknown XDG_SESSION_TYPE: ${XDG_SESSION_TYPE}, cannot apply extra flags"
fi

echo "Passing extra electron flags: ${EXTRA_FLAGS}"
/opt/discord-development/DiscordDevelopment "${EXTRA_FLAGS}"
