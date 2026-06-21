#!/bin/sh
### Extracted (and slightly modified) from the postinst.sh script included with the official package ###

name=@PKGNAME@

# os.tmpdir from node.js
for OS_TMPDIR in "$TMPDIR" "$TMP" "$TEMP" /tmp
do
  test -n "$OS_TMPDIR" && break
done

# kill any currently running Discord
if pgrep --quiet -f "/usr/share/${name}/resources/app.asar"; then
  pkill -f "/usr/share/${name}/resources/app.asar"
  sleep 1
  pkill -f -9 "/usr/share/${name}/resources/app.asar"
fi

# This is probably just paranoia, but some people claim that clearing out
# cache and/or the sock file fixes bugs for them, so here we go
for DIR in /home/* ; do
  rm -rf "$DIR/.config/${name}/Cache"
  rm -rf "$DIR/.config/${name}/GPUCache"
done
rm -f "$OS_TMPDIR/${name}.sock"
