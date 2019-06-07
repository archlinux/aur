#!/usr/bin/bash

_help() {
cat <<EOF
    Usage: $script [options]
    Options:
            -h  --help                  Show this message
                --windowed              Windowed mode
		--settings
    Examples:

    $script --windowed
    $script --settings
    DOSBOX_CMD=dosbox-x $script
EOF
    exit 0
}

pushd() { builtin pushd "$@" > /dev/null; }
popd() { builtin popd > /dev/null; }

INSTALL_DIR=/opt/fantasy-general
HOME_DIR="$HOME"/.gog/fantasy-general
DOSBOX_CMD=${DOSBOX_CMD:-dosbox}

if which unionfs &> /dev/null; then
    USE_UNIONFS=1
fi

script=${0##*/}

TEMP=$(getopt -o h --long help,windowed,settings \
     -n "$script" -- "$@")

if [ $? != 0 ] ; then exit 1 ; fi

eval set -- "$TEMP"

while true; do
    case "$1" in
        -h|--help)  _help; shift ;;
        --windowed) WINDOWED=1; shift ;;
        --settings) WINDOWED=1; START_SETTINGS=1; shift ;;
        --) shift; break ;;
    esac
done

configs=('-conf' 'dosbox_fg.conf')

if [ "$WINDOWED" ]; then
    configs+=('-conf' 'dosbox_windowed.conf')
fi

if [ "$START_SETTINGS" ] ; then
    configs+=('-conf' 'dosbox_fg_settings.conf')
else
    configs+=('-conf' 'dosbox_fg_single.conf')
fi

if [ "$USE_UNIONFS" ]; then
    LOWER_DIR="$INSTALL_DIR"
    UPPER_DIR="$HOME_DIR/config"
    UNION_DIR="$HOME_DIR/game"
    mkdir -p "$HOME_DIR"/{game,config}

    unionfs -o cow,relaxed_permissions "$UPPER_DIR=RW:$LOWER_DIR=RO" "$UNION_DIR"
    echo "Launching game within $UNION_DIR"
    pushd "$UNION_DIR" && "$DOSBOX_CMD" "${configs[@]}"
    popd && fusermount -u "$UNION_DIR"
else
    echo "Launching game within $INSTALL_DIR"
    cd $INSTALL_DIR && "$DOSBOX_CMD" "${configs[@]}"
fi
