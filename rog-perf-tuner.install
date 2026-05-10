#!/bin/bash

run_as_user() {
    if [[ -n "$SUDO_USER" ]]; then
        sudo -u "$SUDO_USER" "$@"
    else
        "$@"
    fi
}

print_bin_info(){
    echo ""
    echo "After first run, many useful scripts will be created in:"
    echo "    ~/.RogPerfTuner/bin"
    echo ""
    echo "You can use them to bind keyboards shortcuts to actions"
    echo ""
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
    print_bin_info
    echo "📦 Performing post install actions..."
    reload_udev_rules
}

post_upgrade() {
    print_bin_info
    echo "🔼 Performing post update actions..."
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