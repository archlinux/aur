 #!/bin/bash
 mkdir -p $HOME/.config/ts3audiobot
 cd $HOME/.config/ts3audiobot
 /usr/lib/ts3audiobot/TS3AudioBot --config "ts3audiobot.toml" "$@"
