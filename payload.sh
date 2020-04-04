#!/usr/bin/env bash
# Sudo payload for Mugen

# Workaround for letting karaokemugen to access display
export XAUTHORITY="/tmp/mugenXauthority"
export HOME="/opt/karaokemugen"
touch $XAUTHORITY
xauth add $XAUTHPAYLOAD
# Workaround for letting karaokemugen to access audio
mkdir -p ~/.config/pulse/
tee ~/.config/pulse/client.conf > /dev/null <<EOT
autospawn = no
default-server = unix:/tmp/pulseaudio
EOT

electron /opt/karaokemugen/resources/app.asar "$@"
exit 0