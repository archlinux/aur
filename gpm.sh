case $( /usr/bin/tty ) in
    /dev/tty[0-9]*) [ -n "$(pidof -s gpm)" ] && /usr/bin/disable-paste ;;
esac
