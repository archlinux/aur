#!/bin/sh
# Because electron doesn't auto-symlink for latest, simply use the latest here.
# sed finds the last match for an executable file (ends in *) and then removes the *
ELECTRON_PATH="`ls -1Ftr /usr/bin/electron* | sed -n '/.*\*$/h; ${x;p;}' | sed 's/.$//'`"

cd /usr/share/stream-overlay 
nohup ${ELECTRON_PATH} app 1>/tmp/stream-overlay.out 2>/tmp/stream-overlay.err &
