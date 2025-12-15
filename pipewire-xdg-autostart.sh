#!/bin/sh

if pgrep -u "${USER}" -x pipewire\|pipewire-pulse\|wireplumber 1>/dev/null 2>&1; then
    pkill -u "${USER}" -x pipewire\|pipewire-pulse\|wireplumber 1>/dev/null 2>&1
    pidwait -u "${USER}" -x pipewire\|pipewire-pulse\|wireplumber
fi

/usr/bin/pipewire &
/usr/bin/pipewire-pulse &

timeout() {
    n="$1"; shift
    for x in $(seq $(($n * 10))); do
        sleep .1
        "$@" && return 0
    done
    return 1
}

check_pipewire() {
    test -n "$XDG_RUNTIME_DIR" -a -S "$XDG_RUNTIME_DIR/pipewire-0" || \
    test -S /run/pipewire/pipewire-0
}

if timeout 60 check_pipewire; then
    /usr/bin/wireplumber &
else
    echo "pipewire not ready when attempting to start wireplumber" >&2
fi &
