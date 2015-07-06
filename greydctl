#!/bin/sh
# Sample greyd control script for Arch Linux distro
# Ivan Agarkov <ivan.agarkov@gmail.com>, 2015

start() {
if [ ! -f /var/empty/greyd/greyd.pid ]; then
    greyd
    sleep 3
    iptables -t nat -A GREYD -p tcp --dport smtp -m set --match-set greyd-whitelist src -j ACCEPT
    iptables -t nat -A GREYD -p tcp --dport smtp -j DNAT --to-destination 127.0.0.1:8025
    iptables -t nat -I PREROUTING 1 -j GREYD
    sysctl net.ipv4.conf.all.route_localnet=1
else 
    echo "greyd is already running"
fi
if [ ! -f /var/empry/greyd/greylogd.pid ]; then
    rm -f /var/empry/greyd/greylogd.pid
    greylogd
    iptables -t nat -I GREYD 1 -p tcp --dport smtp -m set --match-set greyd-whitelist src -j NFLOG --nflog-group 155
    iptables -t filter -A GREYD -m conntrack --ctstate NEW \
    -p tcp --dport 25 -j NFLOG --nflog-group 255
    iptables -t filter -I OUTPUT 1 -j GREYD
else
    echo "greylogd not found"
fi
}

stop() {
if [ -f /var/empty/greyd/greyd.pid ]; then
    kill `cat /var/empty/greyd/greyd.pid` && ( iptables -t nat -F GREYD && iptables -t nat -D PREROUTING 1 )
    rm -f /var/empty/greyd/greyd.pid
else 
    echo "greyd not running"
fi
if [ -f /var/empty/greyd/greylogd.pid ]; then
    kill `cat /var/empty/greyd/greylogd.pid` && (iptables -t nat -F GREYD && iptables -t filter -F GREYD && iptables -t filter -D OUTPUT 1)
    rm -f /var/empty/greyd/greylogd.pid
else
    echo "greylogd not running"
fi
sysctl net.ipv4.conf.all.route_localnet=0
}

if [ "$EUID" -ne "0" ]; then
    echo "Only root can run this"
    exit 1
fi

case "$1" in
    start)
	start
	;;
    stop)
	stop
	;;
    restart)
	stop
	start
	;;
    *)
    echo "Usage: $0 {start|stop|restart}"
esac
