#!/bin/bash

UDEV_RULES="/usr/lib/udev/rules.d/60-rog-perf-tuner.rules"
ASSETS_UDEV_RULES="/usr/share/rog-perf-tuner/OpenRGB/60-openrgb.rules"

reload_udev_rules() {
    echo "↻ Reloading udev rules..."
    udevadm control --reload-rules
    udevadm trigger
}

post_install() {
    echo "📦 Performing install actions..."
    reload_udev_rules
}

post_upgrade() {
    echo "🔼 Performing update actions..."
    reload_udev_rules
}

post_remove() {
    echo "🗑️ Performing remove actions..."
    reload_udev_rules
}
