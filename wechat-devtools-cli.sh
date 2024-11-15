#!/bin/bash

XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-~/.config}

# Launch
exec /opt/wechat-devtools/bin/wechat-devtools-cli "$@"

