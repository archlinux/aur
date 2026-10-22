#!/bin/sh

XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}
flags_file="$XDG_CONFIG_HOME/vesktop-flags.conf"

# Allow users to override command-line options: one flag per line, so a flag
# may contain spaces. Lines starting with # and empty lines are skipped.
if [ -f "$flags_file" ]; then
    n=$#
    while IFS= read -r line || [ -n "$line" ]; do
        case $line in
            '' | '#'*) continue ;;
        esac
        set -- "$@" "$line"
    done < "$flags_file"
    # Move the original arguments after the flags from the file.
    while [ "$n" -gt 0 ]; do
        set -- "$@" "$1"
        shift
        n=$((n - 1))
    done
fi

exec /usr/lib/vesktop/vesktop "$@"
