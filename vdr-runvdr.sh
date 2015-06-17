#!/bin/bash

# runvdr - VDR launcher
#
# runvdr [VDROPTION]...

shopt -s extglob nocasematch nullglob

VDR=/usr/sbin/vdr
PLUGINDIR=/usr/lib/vdr
PLUGINVER=VDR_PLUGIN_VERSION
PLUGINSUF=${PLUGINVER:+.$PLUGINVER}

log()
{
    type -P logger &>/dev/null && \
        logger -s -p daemon.info -t ${0##*/} "$1" 2>&1 || echo "INFO: $1"
}

plugconf()
{
    local plugin=$1 PLUGIN_OPTIONS= PLUGIN_ENABLED=
    if [[ -e /etc/vdr/vdr-plugins.d/$plugin.conf ]] ; then
        . /etc/vdr/vdr-plugins.d/$plugin.conf
        case $PLUGIN_ENABLED in no|false|0) return ;; esac
    fi
    if [[ $PLUGIN_OPTIONS ]] ; then
        VDR_OPTIONS+=( --plugin="$plugin $PLUGIN_OPTIONS" )
    else
        VDR_OPTIONS+=( --plugin=$plugin )
    fi
}

build_cmdline()
{
    local plugin= p=
    # Add "priority" plugins.
    for plugin in $VDR_PLUGIN_ORDER ; do
        [[ -e $PLUGINDIR/libvdr-${plugin}.so$PLUGINSUF ]] && plugconf $plugin
    done
    # Add the rest available.
    for plugin in $PLUGINDIR/libvdr-*.so$PLUGINSUF ; do
        plugin=${plugin##*/libvdr-}
        plugin=${plugin%.so$PLUGINSUF}
        for p in $VDR_PLUGIN_ORDER ; do
            if [[ $plugin == $p ]] ; then
                # Already added.
                continue 2
            fi
        done
        plugconf $plugin
    done
}

reload_dvb()
{
    local modules=$( /sbin/lsmod | \
        awk '/^dvb_core/ { gsub(","," ",$4) ; print $4 }' )
    if [[ $modules ]] ; then
        log "Reloading DVB modules"
        /sbin/modprobe -r $modules dvb_core
        for module in $modules ; do
            /sbin/modprobe $module
        done
    fi
}

set_rtcwake()
{
    # Check timestamp set by shutdown script.
    local nexttimer=$( cat /var/run/vdr/next-timer 2>/dev/null )
    rm -f /var/run/vdr/next-timer

    if [[ $nexttimer != +([0-9]) ]] ; then
        # Next timer timestamp not set by shutdown script or bogus,
        # try to get it via SVDRP.
        nexttimer=$( svdrpsend NEXT abs 2>/dev/null | \
            sed -rne 's/^250[[:space:]]+[0-9]+[[:space:]]+([0-9]+).*/\1/p' )
    fi

    if [[ $nexttimer && $nexttimer -gt $( date +%s ) ]] ; then
        [[ -f /etc/vdr/vdr ]] && . /etc/vdr/vdr
        local when=$(( $nexttimer - ${WAKEUP_BEFORE_RECORDING:-10} * 60 ))
        local hrwhen=$( date -d "1970-01-01 $when sec UTC" )
        log "Setting wakeup time for next recording: $hrwhen"
        /usr/sbin/rtcwake -m no -t $when >/dev/null
    fi
}

if [[ $1 == --set-wakeup ]] ; then
    # Just set RTC wakeup for next timer event.
    set_rtcwake
    exit $?
fi

rc=
while true ; do

    VDR_OPTIONS=()
    if [[ $VDR_INIT ]] ; then
        [[ -f /etc/vdr/vdr ]] && . /etc/vdr/vdr
        [[ $DAEMON_COREFILE_LIMIT ]] && \
            ulimit -S -c $DAEMON_COREFILE_LIMIT &>/dev/null && \
            VDR_OPTIONS+=( --userdump ) && cd ${TMPDIR:-/tmp}
        build_cmdline
    fi

    $VDR "$@" "${VDR_OPTIONS[@]}"
    rc=$?

    # 137: "kill -KILL" eg in killproc(), others: "man vdr"
    case $rc in
        0|2|137)
            log "VDR exited with status $rc, exiting"
            break
            ;;
        *)
            log "VDR exited with status $rc, attempting restart"
            case $RELOAD_DVB in yes|true|1) reload_dvb ;; esac
            ;;
    esac

done

exit $rc
