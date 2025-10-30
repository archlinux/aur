#!/bin/bash

UDEV_RULES="/usr/lib/udev/rules.d/60-rog-perf-tuner.rules"
ASSETS_UDEV_RULES="/usr/share/rog-perf-tuner/OpenRGB/60-openrgb.rules"

reload_udev_rules() {
    echo "  🔄 Reloading udev rules..."
    udevadm control --reload-rules
    udevadm trigger
}

stop_application() {
    echo "  ⏹️  Stopping application if running..."
    if [[ -n "$SUDO_USER" ]]; then
        sudo -u "$SUDO_USER" rog-perf-tuner -k
    else
        rog-perf-tuner -k
    fi
    return $?
}

post_install() {
    echo "📦 Performing install actions..."
    reload_udev_rules
}

post_upgrade() {
    echo "🔼 Performing update actions..."
    reload_udev_rules
}

pre_remove() {
    echo "🗑️ Performing pre remove actions..."
    stop_application
}

post_remove() {
    echo "🗑️ Performing post remove actions..."
    reload_udev_rules
}
