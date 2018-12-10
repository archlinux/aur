#!/usr/bin/env sh

if [ -z "$BRAVE_FLAGS" ]; then
    if [[ ! (-r /proc/sys/kernel/unprivileged_userns_clone && $(< /proc/sys/kernel/unprivileged_userns_clone) == 1 && -n $(zcat /proc/config.gz | grep CONFIG_USER_NS=y) ) ]]; then
        >&2 echo "User namespaces are not detected as enabled on your system, brave will run with the sandbox disabled"
        FLAG="--no-sandbox"
    fi
fi
exec "/usr/lib/brave-dev-bin/brave" "$BRAVE_FLAGS" "$FLAG" -- "$@"
