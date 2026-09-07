#!/usr/bin/env bash
set -euo pipefail
source_dir=$(cd -- "$(dirname -- "$0")" && pwd)
work=$(mktemp -d "$PWD/wrapper-check.XXXXXXXX")
trap 'rm -rf -- "$work"' EXIT
install -Dm755 "$source_dir/mock-bash.sh" "$work/bin/bash"
export TRACE="$work/trace" WINEPREFIX="$work/prefix with spaces"
export PATH="$work/bin:$PATH"
unset WINRTCAMSTUB_DLL LIGHTBURN_LAUNCHER_EXE
for command in lightburn-on-linux lightburn-on-linux-setup lightburn-on-linux-map-serial; do
    case "$command" in
        lightburn-on-linux) script=run.sh ;;
        lightburn-on-linux-setup) script=install.sh ;;
        lightburn-on-linux-map-serial) script=map-serial.sh ;;
    esac
    for status in 0 37; do
        actual=0
        MOCK_STATUS=$status /usr/bin/bash "$source_dir/$command" 'file with spaces' '' '--literal=$HOME;*' || actual=$?
        [[ $actual == "$status" ]]
        {
            # shellcheck disable=SC2016 # Verify that the wrapper does not expand this argument.
            printf '%s\0' "/usr/share/lightburn-on-linux/scripts/$script" 'file with spaces' '' '--literal=$HOME;*' "$WINEPREFIX"
            if [[ $script == install.sh ]]; then
                printf '%s\0' /usr/lib/lightburn-on-linux/winrtcamstub.dll /usr/lib/lightburn-on-linux/start-lightburn.exe
            else
                printf '%s\0' '' ''
            fi
        } > "$work/expected"
        cmp "$work/expected" "$TRACE"
    done
done
printf 'Wrapper paths, arguments, environment and exit statuses passed.\n'
