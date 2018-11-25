#!/usr/bin/env sh

if [[ ! -n $(zcat /proc/config.gz | grep CONFIG_USER_NS=y)  ]]; then
    >&2 echo "User namespaces are not detected as enabled on your system, brave will run with the sandbox disabled"
    FLAG="--no-sandbox"
fi

exec "/usr/lib/brave-dev-bin/brave" "$FLAG" -- "$@"
