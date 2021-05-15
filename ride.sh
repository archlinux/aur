#!/bin/sh

CONFIG_DIR="$HOME/.config/Ride-4.4"

if [ ! -d "$CONFIG_DIR" ]; then
    mkdir "$CONFIG_DIR"
    cat <<EOF >"$CONFIG_DIR/connections.json"
[{"type":"start","subtype":"raw","exe":"/usr/bin/dyalog","name":"local"}]
EOF
fi

/usr/share/ride/Ride-4.4
