#!/bin/sh

# Chrome options explained:
# --disable-web-security sounds scary, but it just disables the same origin policy restriction that stops us from making "cross site" requests.
# --enable-experimental-web-platform-features enables some CSS features that aren't enabled by default in the current stable branch of chrome at the time of writing this.
# --user-data-dir= creates a new chrome profile at the specified location, starting a new session like this is required for --disable-web-security and keeps it separate from your regular browsing (history, cache, etc).

installed="/usr/share/zenbooru"
data="${XDG_CONFIG_DIR:-$HOME/.config}/zenbooru"
nm="$data/NativeMessagingHosts"
id="$data/Default/File System/000/t/00/00000000"
[ -f "$id" ] || chromium --load-extension="$installed/anyOS" --allow-file-access-from-files --user-data-dir="$data" --app="file://$installed/index.html#setup"
id=$(cat "$id")
mkdir -p "$nm" &>/dev/null
echo '{"name":"org.gamemage.anyos","description":"anyOS Commands","path":"'"$installed/anyOS/commands.sh"'","type":"stdio","allowed_origins":["chrome-extension://'$id'/"]}' > "$nm/org.gamemage.anyos.json"
chromium --load-extension="$installed/anyOS" --enable-experimental-web-platform-features --disable-web-security --user-data-dir="$data" --app="file://$installed/index.html"