#!/bin/sh

# Check if --class is already set
for arg in "${@}"; do
    if [ "$arg" == '--class' ]; then
        exec /usr/lib/firefox-beta/firefox "$@"
        break;
    fi
done

# Set default --class
exec /usr/lib/firefox-beta/firefox --class 'Firefox Beta' "$@"
