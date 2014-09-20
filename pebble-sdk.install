#!/bin/bash

post_upgrade() {
    if [[ $2 == 2.0.* ]]; then
        echo "IMPORTANT: You will need to update your Pebble to run apps \
built with the 2.1 SDK. Applications compiled with the SDK 2.1 will not \
appear in the menu and will not run on Pebble firmware 2.0."
        echo
        echo "Tracking via Google Analytics is now disabled by default."
        echo "If you want to enable it, remove /opt/pebble/NO_TRACKING"
    fi
    if [[ $2 == 2.5-* ]]; then
        echo "Note you'll need to run 'pebble clean' in your existing "
        echo "projects after this upgrade."
    fi
}

post_install() {
    if [[ $1 == 2.1.* ]]; then
        echo "IMPORTANT: You will need to update your Pebble to run apps \
built with the 2.1 SDK. Applications compiled with the SDK 2.1 will not \
appear in the menu and will not run on Pebble firmware 2.0."
        echo
    fi
    echo "Tracking via Google Analytics is disabled by default."
    echo "If you want to enable it, remove /opt/pebble/NO_TRACKING"
}
