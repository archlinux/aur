_precmd() {
    CURRENT_WS=$(i3-msg -t get_workspaces|jq -c '.[]| select(.focused)|.num')
    if [[ $ND_FOCUSED_WS -ne $CURRENT_WS ]]; then
        notify-send -u critical "$ND_CMD" "Done @workspace=$ND_FOCUSED_WS"
    fi
}

_preexec() {
    ND_FOCUSED_WS=$(i3-msg -t get_workspaces|jq -c '.[]| select(.focused)|.num')
    ND_CMD=$1
}

preexec_functions+=(_preexec)
precmd_functions+=(_precmd)
