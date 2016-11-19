#!/usr/bin/bash

_help() {
cat <<EOF
    Usage: $script [options]
    Options:
            -h  --help          Show this message
                --windowed      Windowed mode
                --single        Start Syndicate
                --main          Start original Syndicate
                --addon         Start Syndicate: American Revolt
                --reset         Reset settings
                --client        Start in client mode
                --server        Start in server mode
    Examples:

    $script --windowed
    $script --addon --client
    $script --single --server
EOF
    exit 0
}

pushd() { builtin pushd "$@" > /dev/null; }
popd() { builtin popd > /dev/null; }

INSTALL_DIR=/opt/syndicate-plus
HOME_DIR="$HOME"/.gog/syndicate-plus

if which unionfs &> /dev/null; then
    USE_UNIONFS=1
fi

script=${0##*/}

TEMP=$(getopt -o h --long help,windowed,single,main,addon,reset,client,server \
     -n "$script" -- "$@")

if [ $? != 0 ] ; then exit 1 ; fi

eval set -- "$TEMP"

while true; do
    case "$1" in
        -h|--help) _help; shift ;;
        --windowed) WINDOWED=1; shift ;;
        --single) START_SINGLE=1; shift ;;
        --main) START_MAIN=1; shift ;;
        --addon) START_ADDON=1; shift ;;
        --reset) START_RESET=1; shift ;;
        --client) START_CLIENT=1; shift ;;
        --server) START_SERVER=1; shift ;;
        --) shift; break ;;
    esac
done

configs=('-conf' 'dosboxsyndicate.conf')

if [ "${START_SERVER:=0}" -eq 1 ] && [ ! "$START_RESET" ]; then
    configs+=('-conf' 'dosboxsyndicate_server.conf')
    ENABLE_IPX=1
fi

if [ "${START_CLIENT:=0}" -eq 1 ] && [ "${START_SERVER:=0}" -ne 1 ] \
        && [ ! "$START_RESET" ]; then
    configs+=('-conf' 'dosboxsyndicate_client.conf')
    ENABLE_IPX=1
fi

if [ "$WINDOWED" ]; then
    configs+=('-conf' 'dosbox_windowed.conf')
fi

if [ "$START_SINGLE" ]; then
    configs+=('-conf' 'dosboxsyndicate_single.conf')
elif [ "$START_ADDON" ]; then
    configs+=('-conf' 'dosboxsyndicate_addon.conf')
elif [ "$START_RESET" ]; then
    configs+=('-conf' 'dosboxsyndicate_reset.conf')
else
    configs+=('-conf' 'dosboxsyndicate_main.conf')
fi

if [ "$ENABLE_IPX" ]; then
    configs+=('-conf' 'dosbox_ipx.conf')
fi

if [ "$USE_UNIONFS" ]; then
    LOWER_DIR="$INSTALL_DIR"
    UPPER_DIR="$HOME_DIR/config"
    UNION_DIR="$HOME_DIR/game"
    mkdir -p "$HOME_DIR"/{game,config}

    unionfs -o cow,relaxed_permissions "$UPPER_DIR=RW:$LOWER_DIR=RO" "$UNION_DIR"
    echo "Launching game within $UNION_DIR"
    pushd "$UNION_DIR" && dosbox "${configs[@]}"
    popd && fusermount -u "$UNION_DIR"
else
    echo "Launching game within $INSTALL_DIR"
    cd $INSTALL_DIR && dosbox "${configs[@]}"
fi
