#!/bin/bash

set -e

AVAILABLE_MODES=(output window region)

Help() {
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
  --clipboard-only          copy to clipboard, don't save
  -s, --silent              suppress notification
  -d, --debug               enable debug logs
  -h, --help                show this help
  -- [command]              open screenshot with given command. e.g. swaycut -m window -- feh
EOF
}

log() {
    [ "$DEBUG" -eq 0 ] && return 0
    1>&2 printf "$@"
}

send_notification() {
    [ "$SILENT" -eq 1 ] && return 0
    notify-send "Screenshot saved" \
                "Image saved to <i>${1}</i> and copied to the clipboard." \
                -i "${1}"
}

save_geometry() {
    log "Geometry: %s\n" "$1"

    if [ "$CLIPBOARD" -eq 0 ]; then
        mkdir -p "$SAVEDIR"
        grim -g "$1" "$SAVE_FULLPATH"
        local output="$SAVE_FULLPATH"
        magick "$output" -trim +repage "$output"
        wl-copy < "$output"
        send_notification "$output"
        [ ${#COMMAND[@]} -gt 0 ] && "${COMMAND[@]}" "$output"
    else
        wl-copy < <(grim -g "$1" - | magick - -trim +repage -)
    fi
}

begin_grab() {
    save_geometry "$(grab_$1)"
}

grab_output() {
    slurp -or
}

grab_region() {
    slurp -d
}

grab_window() {
    local clients=$(swaymsg -t get_tree | jq -r '[.. | select(.type? == "con" and .visible == true and .name? != null and (.app_id? != null or .window_properties? != null))]')
    log "Clients: %s\n" "$clients"
    local boxes=$(echo "$clients" | jq -r '.[] | "\(.rect.x),\(.rect.y) \(.rect.width)x\(.rect.height) \(.name)"')
    log "Boxes:\n%s\n" "$boxes"
    slurp -r <<< "$boxes"
}

parse_args() {
    local options=$(getopt -o hf:o:m:ds --long help,filename:,output-folder:,mode:,clipboard-only,debug,silent -- "$@")
    eval set -- "$options"

    while true; do
        case "$1" in
            -h|--help)
                Help; exit ;;
            -o|--output-folder)
                shift; SAVEDIR=$1 ;;
            -f|--filename)
                shift; FILENAME=$1 ;;
            -m|--mode)
                shift; echo "${AVAILABLE_MODES[@]}" | grep -wq "$1"; OPTION=$1 ;;
            --clipboard-only)
                CLIPBOARD=1 ;;
            -d|--debug)
                DEBUG=1 ;;
            -s|--silent)
                SILENT=1 ;;
            --)
                shift; COMMAND=("$@"); break ;;
        esac
        shift
    done

    if [ -z "$OPTION" ]; then
        log "A mode is required\n\nAvailable modes are:\n\toutput\n\tregion\n\twindow\n"
        exit 2
    fi
}

[[ $# -eq 0 ]] && Help && exit

CLIPBOARD=0
DEBUG=0
SILENT=0
FILENAME="$(date +'swaycut_%Y-%m-%d_%H-%M-%S.png')"
SAVEDIR="${SWAY_SCREENSHOT_DIR:-${XDG_PICTURES_DIR:-$HOME/Pictures}}/Screenshots"

parse_args "$@"

SAVE_FULLPATH="$SAVEDIR/$FILENAME"
[ "$CLIPBOARD" -eq 0 ] && log "Saving in: %s\n" "$SAVE_FULLPATH"
begin_grab "$OPTION"
