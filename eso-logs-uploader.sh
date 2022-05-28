#!/bin/sh

# Set GTK_USE_PORTAL=1 if not defined.
# This makes electron use the XDG FileChooser portal
# instead of the GTK filepicker on every DE.
if [ -z "$GTK_USE_PORTAL" ]; then
    export GTK_USE_PORTAL=1
fi

exec electron /usr/share/eso-logs-uploader "$@"
