#!/bin/sh

# Set --class and --name argument if they are not provided

contains() {
    member="$1"
    shift
    for arg in "${@}"; do
        if [ "$arg" == "$member" ]; then
            return 0
        fi
    done
    return 1
}

args=("${@}")

if ! contains "--class" "${@}"; then
    args+=('--class' 'Firefox Beta')
fi

if ! contains "--name" "${@}"; then
    args+=('--name' 'Firefox Beta')
fi

exec /usr/lib/firefox-beta/firefox "${args[@]}"
