#!/bin/bash
export GTK_PATH=/usr/lib32/gtk-2.0
export GDK_PIXBUF_MODULE=/usr/lib32/config/gdk/gdk-pixbuf.loaders
export PANGO_RC_FILE=/usr/lib32/config/pango/pangorc
export LD_LIBRARY_PATH="/usr/lib32:$LD_LIBRARY_PATH"
exec /usr/lib/foxitreader/FoxitReader "$@"
