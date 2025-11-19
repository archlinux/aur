#!/bin/bash

run_as_user() {
    if [[ -n "$SUDO_USER" ]]; then
        sudo -u "$SUDO_USER" "$@"
    else
        "$@"
    fi
}

reload_udev_rules() {
    echo "  🔄 Reloading udev rules..."
    udevadm control --reload-rules
    udevadm trigger
}

stop_application() {
    echo "  ⏹️  Stopping application if running..."
    run_as_user rog-perf-tuner -k &>> /dev/null
}

post_install() {
    echo "📦 Performing post install actions..."
    reload_udev_rules
}

post_upgrade() {
    echo "🔼 Performing post update actions..."
    reload_udev_rules
}

pre_remove() {
    echo "🗑️ Performing pre remove actions..."
    stop_application
    run_as_user rog-perf-tuner -u &>> /dev/null
}

post_remove() {
    echo "🗑️ Performing post remove actions..."
    reload_udev_rules
}