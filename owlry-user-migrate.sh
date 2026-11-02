#!/bin/bash
# Keep pending state across an interrupted stop/start, but only for this boot.
set -eu -o pipefail
export PATH=/usr/bin LC_ALL=C
log() { printf 'owlry-user-migrate: %s\n' "$*" >&2; }
ctl() { /usr/bin/timeout -k 2 10 /usr/bin/systemctl --user "$@"; }
runtime="/run/user/$(id -u)"
[[ "${XDG_RUNTIME_DIR:-}" == "$runtime" && -d "$runtime" && ! -L "$runtime" &&
    "$(stat -c %u "$runtime")" == "$(id -u)" && "$(stat -c %a "$runtime")" == 700 ]] || {
    log "invalid user runtime directory"
    exit 1
}
umask 077
state="$runtime/owlry-migrate"
mkdir -p -- "$state"
[[ -d "$state" && ! -L "$state" && "$(stat -c %u "$state")" == "$(id -u)" &&
    "$(stat -c %a "$state")" == 700 ]] || exit 1
exec 9>"$state/lock"
flock -w 5 9 || { log "migration already in progress"; exit 1; }

socket_state=$(ctl show owlry.socket -p ActiveState --value)
case "$socket_state" in
    active|inactive) ;;
    *) log "socket state is $socket_state; leaving units untouched"; exit 1 ;;
esac
listen=$(ctl show owlry.socket -p Listen --value)
[[ -n "$listen" ]] || { log "socket has no listener configuration"; exit 1; }
if [[ "$listen" != "$runtime/owlry/owlry.sock (Stream)" ]]; then
    if [[ -f "$state/pending" ]]; then
        log "pending migration with custom socket configuration; recover manually"
        exit 1
    fi
    log "custom socket configuration; migrate manually if needed"
    exit 0
fi
if [[ ! -f "$state/pending" ]]; then
    if [[ "$socket_state" == inactive ]]; then
        log "inactive socket; nothing to migrate"
        exit 0
    fi
    if [[ -S "$runtime/owlry/owlry.sock" ]]; then
        pid=$(ctl show owlry.service -p MainPID --value)
        [[ "$pid" =~ ^[0-9]+$ ]] || exit 1
        if [[ "$pid" == 0 ]]; then
            log "healthy idle socket; nothing to migrate"
            exit 0
        fi
        # Read executable bytes, never execute a possibly user-overridden daemon.
        identity() {
            /usr/bin/timeout -k 2 5 /usr/bin/stat -Lc '%d:%i' "/proc/$pid/exe" /usr/bin/owlry || return
            /usr/bin/timeout -k 2 5 /usr/bin/cat "/proc/$pid/stat"
        }
        before=$(identity)
        running=$(/usr/bin/timeout -k 2 5 /usr/bin/sha256sum "/proc/$pid/exe")
        installed=$(/usr/bin/timeout -k 2 5 /usr/bin/sha256sum /usr/bin/owlry)
        after=$(identity)
        # /proc/PID/stat has changing counters. Its PID/start-time prefix is
        # checked separately from executable inode identity.
        before_exec=$(head -n2 <<<"$before")
        after_exec=$(head -n2 <<<"$after")
        before_stat=${before##*$'\n'}; before_stat=${before_stat##*) }
        after_stat=${after##*$'\n'}; after_stat=${after_stat##*) }
        read -ra before_fields <<<"$before_stat"
        read -ra after_fields <<<"$after_stat"
        [[ "$before_exec" == "$after_exec" && "${before_fields[19]}" == "${after_fields[19]}" &&
            "$(ctl show owlry.service -p MainPID --value)" == "$pid" ]] || {
            log "daemon identity changed during inspection; retry migration"
            exit 1
        }
        if [[ "${running%% *}" == "${installed%% *}" ]]; then
            log "running executable is current; nothing to migrate"
            exit 0
        fi
    fi
    # Creating pending must succeed before the first disruptive operation.
    : >"$state/pending"
fi

log "performing migration"
ctl stop owlry.service owlry.socket
ctl start owlry.socket
[[ "$(ctl show owlry.socket -p ActiveState --value)" == active && -S "$runtime/owlry/owlry.sock" ]] || {
    log "socket restoration incomplete; pending retained"
    exit 1
}
rm -- "$state/pending"
log "recovery complete (socket path recreated, service ready to start)"
