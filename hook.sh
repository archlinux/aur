#!/bin/bash

packages=("firefox"
          "thunderbird")

for package in "${packages[@]}"; do
    target="/usr/lib/$package/dictionaries"

    # Check if package exists
    if [[ -e "$target" ]]; then
        case "$1" in
            "install")
                ln -snf /etc/mozilla-custom-dictionaries "$target"
                ;;
            "remove")
                ln -snf /usr/share/hunspell "$target"
                ;;
            *)
                exit 1
                ;;
        esac
    fi
done

exit 0
