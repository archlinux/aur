__nwd_cmd=
__nwd_previous_focused=
__nwd_when_started=

__nwd_preexec() {
    # Called before executing the command

    local no_i3
    no_i3=0
    [[ -z $DISPLAY || -z $(i3 --get-socketpath) ]] && no_i3=1
    [[ $no_i3 -eq 1 || -z $1 ]] && return

    __nwd_cmd=$1
    __nwd_previous_focused=$(python3 /usr/share/nwd/focused_window.py)
    __nwd_when_started=$(date +%s)
}

__nwd_precmd() {
    # Called before showing the next prompt

    local no_i3
    no_i3=0
    [[ -z $DISPLAY || -z $(i3 --get-socketpath) ]] && no_i3=1
    [[ $no_i3 -eq 1 || -z $__nwd_cmd ]] && return

    local current_focused
    current_focused=$(python3 /usr/share/nwd/focused_window.py)
    if [[ $__nwd_previous_focused && $current_focused -ne $__nwd_previous_focused ]]; then
        local elapsed_seconds
        elapsed_seconds=$(( $(date +%s) - $__nwd_when_started ))
        [[ $elapsed_seconds -ge 1 ]] && notify-send -a nwd "$__nwd_cmd"
    fi

    __nwd_previous_focused=
    __nwd_cmd=
    __nwd_when_started=
}

[[ -z $(echo $preexec_functions|grep __nwd_preexec) ]] && preexec_functions+=(__nwd_preexec)
[[ -z $(echo $precmd_functions|grep __nwd_precmd) ]] && precmd_functions+=(__nwd_precmd)
