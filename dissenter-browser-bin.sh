#!/usr/bin/env bash
XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"

# Allow users to override command-line options
USER_FLAGS_FILE="$XDG_CONFIG_HOME/dissenter-flags.conf"
if [[ -f $USER_FLAGS_FILE ]]; then
   USER_FLAGS="$(cat $USER_FLAGS_FILE | sed 's/#.*//')"
fi

if [[ ! (-r /proc/sys/kernel/unprivileged_userns_clone && $(< /proc/sys/kernel/unprivileged_userns_clone) == 1 && -n $(zcat /proc/config.gz | grep CONFIG_USER_NS=y) ) ]]; then
    >&2 echo "User namespaces are not detected as enabled on your system, brave will run with the sandbox disabled"
    FLAG=" --no-sandbox"
fi

exec "/opt/dissenter.com/dissenter/dissenter-browser" $@ $FLAG --class=dissenter-browser
