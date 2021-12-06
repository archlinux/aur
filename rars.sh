!/bin/sh
exec /usr/bin/java \
    -Dawt.useSystemAAFontSettings=on \
    -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel \
    -jar /usr/share/java/rars/rars.jar "$@"
