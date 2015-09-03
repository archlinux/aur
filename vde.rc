#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions
. /etc/conf.d/vde

case "$1" in
  start)
    # bring up all defined profiles
    for i in $VDE_CONFIG; do
      [ -e /etc/vde/$i ] && . /etc/vde/$i
      stat_busy "Starting vde_switch $i"
      # get options from profile
      [ -n "$VDE_NUMPORTS" ] && OPTIONS="-n $VDE_NUMPORTS"
      [ "$VDE_HUB" = "yes" ] && OPTIONS="$OPTIONS -x"
      [ "$VDE_FSTP" = "yes" ] && OPTIONS="$OPTIONS -F"
      [ -n "$VDE_MAC" ] && OPTIONS="$OPTIONS --macaddr $VDE_MAC"
      [ -n "$VDE_PRIORITY" ] && OPTIONS="$OPTIONS --priority $VDE_PRIORITY"
      [ -n "$VDE_HASH" ] && OPTIONS="$OPTIONS --hashsize $VDE_HASH"
      [ -n "$VDE_SOCK" ] && OPTIONS="$OPTIONS -s $VDE_SOCK"
      [ -n "$VDE_SOCK_MODE" ] && OPTIONS="$OPTIONS -m $VDE_SOCK_MODE"
      [ -n "$VDE_SOCK_GROUP" ] && OPTIONS="$OPTIONS -g $VDE_SOCK_GROUP"
      [ -n "$VDE_MANAGEMENT_SOCK" ] && OPTIONS="$OPTIONS -M $VDE_MANAGEMENT_SOCK"
      [ -n "$VDE_MANAGEMENT_SOCK_MODE" ] && OPTIONS="$OPTIONS --mgmtmode $VDE_MANAGEMENT_SOCK_MODE"
      [ -n "$VDE_TAP" ] && OPTIONS="$OPTIONS -t $VDE_TAP"
      [ -n "$VDE_OPTIONS" ] && OPTIONS="$OPTIONS $VDE_OPTIONS"
      vde_switch $OPTIONS -p /var/run/vde-$i.pid -daemon &>/dev/null
      [ -n "$VDE_SOCK" -a -n "$VDE_SOCK_GROUP" ] && chgrp "$VDE_SOCK_GROUP" "$VDE_SOCK"
      if [ $? -gt 0 ]; then
        stat_fail
      else
        stat_done
      fi
      if [ "$SLIRP" = "yes" ]; then
        stat_busy "Starting slirpvde for $i"
        [ "$SLIRP_DHCP" = "yes" ] && SP_OPTIONS="-D"
        [ -n "$SLIRP_NETWORK" ] && SP_OPTIONS="$SP_OPTIONS -n $SLIRP_NETWORK"
        [ -n "$SLIRP_OPTIONS" ] && SP_OPTIONS="$SP_OPTIONS $SLIRP_OPTIONS"
        [ -n "$VDE_SOCK" ] && SP_OPTIONS="$SP_OPTIONS -s $VDE_SOCK"
        [ -n "$VDE_SOCK_MODE" ] && SP_OPTIONS="$SP_OPTIONS -m $VDE_SOCK_MODE"
        [ -n "$VDE_SOCK_GROUP" ] && SP_OPTIONS="$SP_OPTIONS -g $VDE_SOCK_GROUP"
        slirpvde $SP_OPTIONS -p /var/run/slirpvde-$i.pid -daemon &>/dev/null
        if [ $? -gt 0 ]; then
          stat_fail
        else
          stat_done
        fi
        unset OPTIONS
        unset SP_OPTIONS
      fi
    done
    for i in $VDE_CONNECTION; do
      # connect specified vde_switches
      if [ "$(grep ^vde_plug /etc/vde/$i)" ]; then
        stat_busy "Connecting VDE switches $i together..."
        while read j; do
          switch="$(echo $j | grep ^vde_plug)"
          [ -n "$switch" ] && (dpipe $switch &)
        done </etc/vde/$i
        if [ $? -gt 0 ]; then
          stat_fail
        else
          stat_done
        fi
      fi
    done
    add_daemon vde
    ;;
  stop)
    # kill vde_plug if switches are connected
    [ -n "$VDE_CONNECTION" ] && killall vde_plug >/dev/null 2>&1
    for i in $VDE_CONFIG; do
      [ -e /etc/vde/$i ] && . /etc/vde/$i
      if [ "$SLIRP" = "yes" ]; then
        stat_busy "Stopping slirpvde for $i"
        kill $(cat /var/run/slirpvde-$i.pid) &> /dev/null
        if [ $? -gt 0 ]; then
          stat_fail
        else
          stat_done
        fi
        rm /var/run/slirpvde-$i.pid &> /dev/null
      fi
      stat_busy "Stopping vde_switch $i"
      kill $(cat /var/run/vde-$i.pid) &> /dev/null
        if [ $? -gt 0 ]; then
          stat_fail
        else
          stat_done
        fi
      rm /var/run/vde-$i.pid &> /dev/null
      stat_busy "Removing $i vde sockets"
      rm -rf $VDE_SOCK $VDE_MANAGEMENT_SOCK
      if [ $? -gt 0 ]; then
        stat_fail
      else
        stat_done
      fi
    done
      unset OPTIONS
      unset SP_OPTIONS
      [ -e /var/run/vde/gmon.out ] && rm /var/run/vde/gmon.out
      rm_daemon vde 
    ;;
  restart)
    $0 stop
    sleep 3
    $0 start
    ;;
    *)
    echo "usage: $0 {start|stop|restart}"
esac
exit 0
