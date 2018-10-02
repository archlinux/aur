 #!/bin/bash
 mkdir -p $HOME/.config/ts3audiobot
 cd $HOME/.config/ts3audiobot
 mono "/opt/ts3audiobot/TS3AudioBot.exe" "$@" --config "ts3audiobot.toml"
