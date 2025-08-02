#!/bin/bash

set -e

AVAILABLE_MODES=(output window region)

function Help() {
    cat <<EOF
Usage: swaycut [options] -m <mode> -- [command]

Minimal screenshot utility for Sway.

Modes:
  output       capture full monitor
  window       capture active window
  region       capture selected region

Options:
  -m, --mode <mode>         capture mode: output, window, region
  -o, --output-folder <dir> directory to save the screenshot
  -f, --filename <name>     custom filename
  --clipboard-only          copy to clipboard, don’t save
  -s, --silent              suppress notification
  -d, --debug               enable debug logs
  -h, --help                show this help
  -- [command]              open screenshot with given command. e.g. swaycut -m window -- mirage
EOF
}

function log() {
    if [ $DEBUG -eq 0 ]; then
        return 0
    fi
    
    1>&2 printf "$@" 
}

function send_notification() {
    if [ $SILENT -eq 1 ]; then
        return 0
    fi
    notify-send "Screenshot saved" \
                "Image saved to <i>${1}</i> and copied to the clipboard." \
                -i "${1}"
}

function save_geometry() {
    log "Geometry: %s\n" "${1}"

    if [ $CLIPBOARD -eq 0 ]; then
        mkdir -p "$SAVEDIR"
        grim -g "${1}" "$SAVE_FULLPATH"
        local output="$SAVE_FULLPATH"
        # Trim transparent pixels, in case the window was floating and partially
        # outside the monitor
        magick $output -trim +repage $output
        wl-copy < "$output"
        send_notification $output
        [ -z "$COMMAND" ] || {
            "${COMMAND[@]}" "$output"
        }
    else
        wl-copy < <(grim -g "${1}" - | magick - -trim +repage -)
    fi
}

function begin_grab() {
    save_geometry "$(grab_$1)"
}

function grab_output() {
    slurp -or
}

function grab_region() {
    slurp -d
}

function grab_window() {
    local clients=`swaymsg -t get_tree | jq -r '[.. | select(.type? == "con" and .visible == true and .name? != null and (.app_id? != null or .window_properties? != null))]'`
    log "Clients: %s\n" "$clients"
    # Generate boxes for each visible window and send that to slurp
    # through stdin
    local boxes="$(echo $clients | jq -r '.[] | "\(.rect.x),\(.rect.y) \(.rect.width)x\(.rect.height) \(.name)"')"
    log "Boxes:\n%s\n" "$boxes"
    slurp -r <<< "$boxes"
}

function parse_args() {
    local options=$(getopt -o hf:o:m:ds --long help,filename:,output-folder:,mode:,clipboard-only,debug,silent -- "$@")
    eval set -- "$options"

    while true; do
        case "$1" in
            -h | --help)
                Help
                exit
                ;;
            -o | --output-folder)
                shift;
                SAVEDIR=$1
                ;;
            -f | --filename)
                shift;
                FILENAME=$1
                ;;
            -m | --mode)
                shift;
                echo "${AVAILABLE_MODES[@]}" | grep -wq $1
                OPTION=$1;;
            --clipboard-only)
                CLIPBOARD=1
                ;;
            -d | --debug)
                DEBUG=1
                ;;
            -s | --silent)
                SILENT=1
                ;;
            --)
                shift # Skip -- argument
                COMMAND=("${@}")
                break;;
        esac
        shift
    done

    if [ -z $OPTION ]; then
        log "A mode is required\n\nAvailable modes are:\n\toutput\n\tregion\n\twindow\n"
        exit 2
    fi
}

if [ -z $1 ]; then
    Help
    exit
fi

CLIPBOARD=0
DEBUG=0
SILENT=0
FILENAME="$(date +'swaycut_%Y-%m-%d_%H-%M-%S.png')"
[ -z "$SWAY_SCREENSHOT_DIR" ] && SAVEDIR=${XDG_PICTURES_DIR:=~} || SAVEDIR=${SWAY_SCREENSHOT_DIR}

parse_args $0 "$@"

SAVE_FULLPATH="$SAVEDIR/$FILENAME"
[ $CLIPBOARD -eq 0 ] && log "Saving in: %s\n" "$SAVE_FULLPATH"
begin_grab $OPTION