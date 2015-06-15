#!/bin/bash

# Tunnel-configurer:
#  Client-server IP tunnel configuration via the same IP tunnel.
#
# Copyright (C) 2014 Natrio <natrio@list.ru>
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.

PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

[[ "$1" =~ ^(-tun|-h|-help|--help|)$ ]] || exec ifconfig "$@"

# config defaults
PORT=68
MTU=1500
TIMEOUT=10
CMD=tun-cat

usage() {
 [[ -n "$1" ]] && return 0
 echo "Tunnel-configurer version 1.6.1
 Client-server IP tunnel configuration via the same IP tunnel.

-- vtund.conf --
 # ifconfig replacement by wrapper
options {
 ...
 #ifconfig /sbin/ifconfig;
 ifconfig $HELPSTR;
 ...

 # Usual ifconfig example ($NAME doesn't break it):
 # On server
host0 {
 passwd K@bI\$D0x;
 up {
   ifconfig \"%d 10.10.0.1 pointopoint 10.10.8.8\";
 };
}

 # On client
host0 {
 passwd K@bI\$D0x;
 up {
   ifconfig \"%d 10.10.8.8 pointopoint 10.10.0.1\";
   ip \"route add 10.10.10.0/24 dev %d\";
   ip \"route add 10.10.0.0/24 dev %d\";
 };
}

 # And same one with parameters transmission:
 # Server example #1, without ${NAME}.conf and names
host1 {
 passwd K@bI\$D0x;
 up {
   ifconfig \"-tun %d local 10.10.0.1 send 10.10.10.5 10.10.10.0/24 10.10.0.0/24\";
 };
}

 # Server example #2, with ${NAME}.conf and client's domain name
host1 {
 passwd K@bI\$D0x;
 up {
   ifconfig \"-tun %d send host1.vpn\";
 };
}

 # Client example, getting all parameters from server
host1 {
 passwd K@bI\$D0x;
 up {
   ifconfig \"-tun %d get metric 100\";
 };
}

-- Common definion's file /etc/${NAME}.conf (useful for server) --
 # defaults
PORT=68
MTU=1500
TIMEOUT=10
 # the address of server for all hosts (example)
LOCAL=server.vpn
 # routes for sending to clients (example)
ROUTES='10.10.10.0/24 10.10.0.0/24'

-- Command-line description --
ifconfig wrapper:
 $NAME <'ifconfig' options>
Server:
 $NAME -tun <interface> send|-s <client_addr> [OPTIONS] [<client-side routes>]
Client:
 $NAME -tun <interface> get|-g|listen [OPTIONS] [<'ip route' options>][-6|v6 <options>]

Addresses of client and server may be specified by IP, by name, or by
 comma-separated list of IPv4,IPv6,names with v4,v6,no4,no6 modifiers.
 All names will be resolved on server side, and only first IPv4 and IPv6 will be used:

 10.1.0.1               -> 10.1.0.1
 10.1.0.1,fc00::1001:1  -> 10.1.0.1  fc00::1001:1
 host.vpn               -> 10.1.0.4  fc00::1001:4
 host.vpn,v4            -> 10.1.0.4
 host.vpn,v6            ->           fc00::1001:4

Routes may be specified by IPv4/mask, IPv6/mask,
 default (for IPv4), defaultv6 or default6 (for IPv6).

OPTIONS:
    port|-P <port>  : default=68
     mtu|-m <MTU>   : default=1500, 0=no change
forcemtu|+m <MTU>   : Don't get MTU from server (client only)
   local|-l <addr>|-: Force/skip local address (server only)
  noaddr|-a         : Don't modify any IPv4 addresses on interface
 no6addr|-A         : Don't modify any IPv6 addresses on interface
  nopeer|-p         : Don't set peer address (IPv4)
    peer|+p         : Add a route to peer instead of peer address (IPv4)
noroutes|-r         : server - Don't send any routes from config
                    : client - Don't get IPv4 routes from server
no6routes|-R        : Don't get IPv6 routes from server (client only)
 timeout|-t <sec>   : default=10, 0=endless
  nofork|-B  | nobg | nobackground

NOTE:
 By default, tun-cfg forks to background to prevent vtund from endless waiting
 for tun-cfg termination, if the connection fails during configuration progress.
"
 exit $URET
}

log() {
 echo $LPREF "$@" >&2
}

sec_up() {
 local garb
 IFS='. ' read "$1" garb < /proc/uptime
}

get46() {
 if [[ -z "$IPv4" && "$1" =~ ^[0-9.]+$ ]] ; then IPv4="$1"
 elif [[ -z "$IPv6" && "${1,,*}" =~ ^[0-9a-f.:]+$ ]] ; then IPv6="$1"
 else return 1
 fi
 return 0
}

get_addr() {
 local addr garb prev IFS skip i
 [[ -z "$3" ]] && return 1
 unset IPv4 IPv6
 IFS=' ,'
 for i in $3 ; do
  case "${i,,*}" in
  6|v6|ip6|ipv6|no4|'-4') skip=4 ;;
  4|v4|ip4|ipv4|no6|'-6') skip=6 ;;
  *)
   get46 "$i" && continue
   while IFS=' ' read addr garb ; do
    [[ "$addr" = "$prev" ]] && continue
    get46 "$addr"
    [[ -n "$IPv4" && -n "$IPv6" ]] && break
    prev="$addr"
   done < <(RESOLV_MULTI=on exec getent ahosts "$i")
   ;;
  esac
 done
 [[ -n "$skip" ]] && unset IPv"$skip"

 if [[ -z "$IPv4" && -z "$IPv6" ]] ; then
  log "Can't resolve '$3' to $1 address"
  exit 7
 fi
 export "$1=$IPv4" "$2=$IPv6"
}

set_addr() {
 if [[ -z "$NOADDR" && -n "$1" ]] ; then
  [[ -z "$NOPEER" && -n "$peer" ]] && PEER="peer $peer"
  log $RPREF "address $1" $PEER
  ip addr rep "$1" $PEER dev "$ifc" || exit 3
 fi
 shift
 if [[ -n "$PLUS" && -n "$peer" ]] ; then
  log $RPREF "peer route $peer" "$@"
  ip route rep "$peer" dev "$ifc" "$@" || exit 5
 fi
}

set_addr_v6() {
 if [[ -z "$NO6ADDR" && -n "$1" ]] ; then
  dis6="/proc/sys/net/ipv6/conf/$ifc/disable_ipv6"
  [[ -f "$dis6" ]] && echo 0 > "$dis6"
  log $RPREF "address $1"
  ip -6 addr rep "$1" dev "$ifc" || exit 3
  echo 0 > "$dis6"
 fi
 shift
 if [[ -n "$peer_6" ]] ; then
  log $RPREF "peer route $peer_6" "$@"
  ip -6 route rep "$peer_6" dev "$ifc" "$@"
 fi
}

addsend() {
 local D LOG send
 D="$1"
 shift
 case "$D" in
 A4)
  LOG="$1"
  [[ -n "$2" ]] && LOG="$LOG peer $2"
  send="$1:$2"
  ;;
 R4)
  LOG="route $1"
  send="$1"
  ;;
 MTU) LOG="mtu $1" ;;
 A6) LOG="address $1" ;;
 R6) LOG="route $1" ;;
 esac
 [[ -z "$send" ]] && send="$D:$1"
 log "-> $LOG"
 SEND[$((i++))]="$send"
}

main() {
 case "$ROLE" in
 send)
  unset SEND; i=0
  if [[ -n "$peer" ]] ; then
   set_addr "$LOCAL"
   addsend A4 "$peer" "$LOCAL"
  fi
  if [[ -n "$peer_6" ]] ; then
   set_addr_v6 "$LOCAL6"
   addsend A6 "$peer_6"
   [[ -n "$LOCAL6" ]] && addsend R6 "$LOCAL6"
  fi
  read MTU < "/sys/class/net/$ifc/mtu"
  addsend MTU "$MTU"
  for R in $ROUTES $* ; do
   [[ "${R,,*}" =~ ^defaultv?6$ ]] && R="::/0"
   if [[ "$R" =~ : ]] ; then
    [[ -n "$peer_6" ]] || continue
    addsend R6 "$R"
   else
    [[ -n "$peer" ]] || continue
    addsend R4 "$R"
   fi
  done

  if [[ -n "$peer" ]] ; then
   ping=ping; P="$peer"
  elif [[ -n "$peer_6" ]] ; then
   ping=ping6; P="$peer_6"
  fi
  sec_up START
  log "sending ->"
  while :; do
   "$CMD" send "$ifc" "$PORT" "${SEND[@]}" || exit 4
   "$ping" -q -c1 -W1 -I "$ifc" "$P" &> /dev/null && break
   sec_up SEC
   if ((TIMEOUT!=0)) && ((SEC > START+TIMEOUT)) ; then
    log "Time is out."
    exit 6
   fi
  done
  log "Confirmed, $P is UP."
  ;;
 
 get)
  if [[ "$*" =~ ^(.* |)(v6|-6)(| .*)$ ]] ; then
   ROPTSv4="${BASH_REMATCH[1]}"
   ROPTSv6="${BASH_REMATCH[3]}"
  else
   ROPTSv4="$*"
   ROPTSv6="$*"
  fi

  RPREF='<-'
  log "listening" $RPREF
  exec < <(exec "$CMD" listen "$ifc" "$PORT" "$TIMEOUT")

  FIRST=1
  while IFS='=,: ' read A B; do
   if [[ "$A" = A6 ]] ; then
    set_addr_v6 "$B"

   elif ((FIRST==1)) ; then
    peer="$B"
    set_addr "$A" $ROPTSv4

   elif [[ "$A" = MTU && -n "$B" && -z "$FORCEMTU" ]] ; then
    log $RPREF "mtu $B"
    ip link set "$ifc" mtu "$B"

   elif [[ "$A" = R6 && -n "$B" && -z "$NO6ROUTES" ]] ; then
    log $RPREF "route $B" $ROPTSv6
    ip -6 route rep "$B" dev "$ifc" $ROPTSv6

   elif [[ -n "$A" && -z "$B" && -z "$NOROUTES" ]] ; then
    log $RPREF "route $A" $ROPTSv4
    ip route rep "$A" dev "$ifc" $ROPTSv4 || exit 5
   fi
   FIRST=0
  done
  log "Completed."
  ;;
 esac
 }

FILE=`readlink -f $0`
FILENAME="${FILE##*/}"
DIR="${FILE%/*}"

CONFIG=/etc/${FILENAME}.conf
[[ -f "$CONFIG" ]] && . "$CONFIG"

[[ "$CMD" =~ ^/ ]] || CMD="$DIR/$CMD"

[[ -z "$HELPSTR" ]] && HELPSTR="$FILE"
NAME="${HELPSTR##*/}"

URET=0
[[ "$1" != '-tun' ]] && usage
URET=1
usage "$2"
ifc="$2"
shift 2

unset ROLE PLUS PEER NO6ADDR NOADDR NOPEER FORCEMTU NOBG NOROUTES NO6ROUTES RPREF
while (($#>0)) ; do
 case "$1" in
 -s|send)
  usage "$2"
  get_addr peer peer_6 "$2"
  ROLE="send"
  shift 2
  ;;

 -g|get|listen)
  ROLE="get"
  shift
  ;;

 -m|mtu)
  usage "$2"
  MTU="$2"
  shift 2
  ;;

 +m|forcemtu)
  usage "$2"
  MTU="$2"
  FORCEMTU=1
  shift 2
  ;;

 -P|port)
  usage "$2"
  PORT="$2"
  shift 2
  ;;

 -t|timeout)
  usage "$2"
  TIMEOUT="$2"
  shift 2
  ;;

 -B|nobg|nobackground|nofork)
  NOBG=1
  shift
  ;;

 -l|local)
  usage "$2"
  LOCAL="$2"
  [[ "$2" = '-' ]] && LOCAL=
  shift 2
  ;;

 -a|noaddr)
  NOADDR=1
  shift
  ;;

 -A|no6addr)
  NO6ADDR=1
  shift
  ;;

 +p|peer)
  NOPEER=1
  PLUS=1
  shift
  ;;

 -p|nopeer)
  NOPEER=1
  shift
  ;;

 -r|noroutes)
  ROUTES=
  NOROUTES=1
  shift
  ;;

 -R|no6routes)
  NO6ROUTES=1
  shift
  ;;

 *)
  break
  ;;
 esac
done
usage "$ROLE"

[[ -z "$TIMEOUT" ]] && TIMEOUT=0
LPREF="$FILENAME($ifc):"
fd2="/proc/$$/fd/2"
if [[ "$(readlink -e $fd2)" =~ ^(/dev/null)|($FILE)$ ]] ; then
 exec 2>&-
 exec 2> >(exec logger -t "${LPREF%:}" -p daemon.info)
 LPREF=
fi

[[ "$MTU" =~ ^(0|auto)$ ]] && MTU=
[[ -n "$MTU" ]] && mtu="mtu $MTU" || mtu=
log "Setting $ifc UP" $mtu
ip link set "$ifc" up $mtu || exit 2

if [[ "$ROLE" = send ]] ; then
 get_addr LOCAL LOCAL6 "$LOCAL"
 [[ -z "$LOCAL" ]] && NOADDR=1
 [[ -z "$LOCAL6" ]] && NO6ADDR=1
fi

if [[ -z "$NOADDR" ]] ; then
 log "flushing IPv4 address"
 ip -4 addr flush dev "$ifc" || exit 3
fi

if [[ -z "$NO6ADDR" ]] ; then
 log "flushing IPv6 address"
 ip -6 addr flush dev "$ifc" || exit 3
 ip -6 route flush dev "$ifc"
fi

if [[ -n "$NOBG" ]] ; then
 main "$@"
else
 main "$@" &
fi
