#!/bin/bash
XDG_DATA_HOME=${XDG_CONFIG_HOME:-~/.local/share}

if [ -f /usr/bin/xray ]; then
    cp /usr/bin/xray ${XDG_DATA_HOME}/v2rayN/bin/xray
fi

if [ -f /usr/bin/sing-box ]; then
    cp /usr/bin/sing-box ${XDG_DATA_HOME}/v2rayN/bin/sing_box
fi

exec /opt/v2rayN/v2rayN "$@"
