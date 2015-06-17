#!/bin/bash

WorkingDirectory=/usr/share/webapps/pump.io
cd $WorkingDirectory
# depending on parameter -- startup, shutdown, restart 
# of the instance and listener or usage display 

case "$1" in
    start)
        # Oracle listener and instance startup
	node ./bin/pump -c /etc/webapps/pump.io/pump.io.json start &
        ;;
    stop)
 	# Oracle listener and instance shutdown
	node ./bin/pump -c /etc/webapps/pump.io/pump.io.json stop
        ;;
    restart)
        $0 stop
        $0 start
        ;;
    *)
        echo "Usage: $0 start|stop|restart"
        exit 1
esac
exit 0