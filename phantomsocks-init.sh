#!/usr/bin/env sh

CONFIGFILE="config.json"
CONFIGDIR="${XDG_DATA_HOME:-"$HOME/.config"}/phantomsocks"

getInterfaces() {
    family=$1
    i=0 && while true; do
    interfaces=$(ip -j -"$family" r | jq -r '.[]|select(.dst=="default").dev')
        if [ -n "$interfaces" ]; then
            echo "$interfaces"
            break
        fi
        if [ "$i" -ge 5 ]; then
            echo "!!! no v$family ifaces" 1>&2
            return 1
        else
            i=$((i + 1))
            printf '.' 1>&2
            sleep 2
        fi
    done && i=0
}

getInterface() {
    family=$1
    address=:: && [ "$family" = 4 ] && address=1
    i=0 && while true; do
        interface=$(ip -j -"$family" r g $address | jq -r '.[].dev')
        if [ -n "$interface" ]; then
            echo "$interface"
            break
        fi
        if [ "$i" -ge 5 ]; then
            echo "!!! no v$family iface" 1>&2
            return 2
        else
            i=$((i + 1))
            printf '.' 1>&2
            sleep 2
        fi
    done && i=0
}

if [ "$(id -u)" = "0" ]; then
        echo "Please do not run this script as root!"
        exit 1
fi

if [ ! -d "$CONFIGDIR" ] || [ ! -e "$CONFIGDIR/$CONFIGFILE" ]; then
    mkdir -p "$CONFIGDIR" && \
    cp -rn /usr/share/phantomsocks/*.* "$CONFIGDIR"
fi

cd "$CONFIGDIR" || exit 1

ifs_v6="$(getInterfaces 6)"; NO_IPV6=$?
ifs_v4="$(getInterfaces 4)"; NO_IPV4=$?

if [ $NO_IPV6 = 1 ] && [ $NO_IPV4 = 1 ]; then
    echo !!! no network connection
    exit 1
elif [ $NO_IPV6 = 1 ]; then
    defaIf_v4="$(getInterface 4)" || exit $?
    defaIf_v6=$defaIf_v4
    ifs_v6=$ifs_v4
elif [ $NO_IPV4 = 1 ]; then
    defaIf_v6="$(getInterface 6)" || exit $?
    defaIf_v4=$defaIf_v6
    ifs_v4=$ifs_v6
else
    defaIf_v6="$(getInterface 6)" || exit $?
    defaIf_v4="$(getInterface 4)" || exit $?
fi

modifiedConf=$(jq -j \
    --arg ifs_v6 "$ifs_v6" \
    --arg ifs_v4 "$ifs_v4" \
    --arg defaIf_v6 "$defaIf_v6" \
    --arg defaIf_v4 "$defaIf_v4" '

def setPface(fam; dev):
    if (fam == 4) then
        if (dev | inside($ifs_v4) | not) or (dev == "") then
            dev = $defaIf_v4
        end
    elif (fam == 6) then
        if (dev | inside($ifs_v6) | not) or (dev == "") then
            dev = $defaIf_v6
        end
    end ;

def validatePface(dev; hint):
    if (dev != null) then
        if (hint != null) then
            if (hint | contains("ipv6")) and (hint | contains("ipv4")) then
                setPface(4; dev)
            elif (hint | contains("ipv6")) then
                setPface(6; dev)
            elif (hint | contains("ipv4")) then
                setPface(4; dev)
            else
                setPface(6; dev)
            end
        else
            setPface(4; dev)
        end
    end ;

.services[] |= validatePface(.device; .hint) |
.interfaces[] |= validatePface(.device; .hint)

' "$CONFIGDIR/$CONFIGFILE") && echo "$modifiedConf" > "$CONFIGDIR/$CONFIGFILE"

# workaround for rawsocks
if (strings /usr/bin/phantomsocks | grep -e '-tags=rawsocket' > /dev/null 2>&1); then
    sleep 2
fi

exec phantomsocks "$@"