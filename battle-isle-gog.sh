#!/usr/bin/bash

_help() {
cat <<EOF
    Usage: $script [options]
    Options:
            -h  --help                  Show this message
                --windowed              Windowed mode
                --single
                --addon [desert|moon]   Start addon The Desert or The Moon of Chromos
                --desert                Start Battle Isle: The Desert
                --moon                  Start Battle Isle: The Moon of Chromos
    Examples:

    $script --windowed
    $script --addon moon
    $script --windowed --desert
EOF
    exit 0
}

pushd() { builtin pushd "$@" > /dev/null; }
popd() { builtin popd > /dev/null; }

INSTALL_DIR=/opt/battle-isle
HOME_DIR="$HOME"/.gog/battle-isle

if which unionfs &> /dev/null; then
    USE_UNIONFS=1
fi

script=${0##*/}

TEMP=$(getopt -o h --long help,windowed,single,addon:,moon,desert \
     -n "$script" -- "$@")

if [ $? != 0 ] ; then exit 1 ; fi

eval set -- "$TEMP"

while true; do
    case "$1" in
        -h|--help)  _help; shift ;;
        --windowed) WINDOWED=1; shift ;;
        --single)   START_SINGLE=1; shift ;;
        --addon)
            case "$2" in
                desert) START_DESERT=1 ;;
                moon)   START_MOON=1 ;;
                *) echo "Invalid value '$2' for $1. Valid values [desert,moon]"; exit 1;;
            esac
            shift 2 ;;
        --desert)   START_DESERT=1; shift ;;
        --moon)     START_MOON=1; shift ;;
        --) shift; break ;;
    esac
done

configs=('-conf' 'dosboxbi1.conf')

if [ "$WINDOWED" ]; then
    configs+=('-conf' 'dosbox_windowed.conf')
fi

if [ "$START_SINGLE" ] ; then
    configs+=('-conf' 'dosboxbi1_single.conf')
elif [ "$START_DESERT" ] ; then
    configs+=('-conf' 'dosboxbi1_desert.conf')
elif [ "$START_MOON" ] ; then
    configs+=('-conf' 'dosboxbi1_moon.conf')
else
    configs+=('-conf' 'dosboxbi1_main.conf')
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
