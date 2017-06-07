_precmd() {
    CURRENT_WS=$(i3-msg -t get_workspaces|jq -c '.[]| select(.focused)|.num')
    if [[ $NWD_FOCUSED_WS && $NWD_FOCUSED_WS -ne $CURRENT_WS ]]; then
        notify-send "$NWD_CMD" "Done @workspace=$NWD_FOCUSED_WS"
    fi

    NWD_FOCUSED_WS=
}

_preexec() {
    NWD_FOCUSED_WS=$(i3-msg -t get_workspaces|jq -c '.[]| select(.focused)|.num')
    NWD_CMD=$1
}

preexec_functions+=(_preexec)
precmd_functions+=(_precmd)
