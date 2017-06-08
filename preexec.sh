_precmd() {
    if [[ -z $NWD_CMD ]]; then return; fi

    CURRENT_FOCUSED_W=$(python3 focused_window.py)
    if [[ $NWD_FOCUSED_W && $CURRENT_FOCUSED_W -ne $NWD_FOCUSED_W ]]; then
        notify-send -a nwd "$NWD_CMD"
    fi

    NWD_FOCUSED_W=
    NWD_CMD=
}

_preexec() {
    NWD_CMD=$1
    NWD_FOCUSED_W=$(python3 focused_window.py)
}

preexec_functions+=(_preexec)
precmd_functions+=(_precmd)
