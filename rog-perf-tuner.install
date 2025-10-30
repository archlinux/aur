#!/bin/bash

UDEV_RULES="/usr/lib/udev/rules.d/60-rog-perf-tuner.rules"
ASSETS_UDEV_RULES="/usr/share/rog-perf-tuner/OpenRGB/60-openrgb.rules"

reload_udev_rules() {
    echo "  🔄 Reloading udev rules..."
    udevadm control --reload-rules
    udevadm trigger
}

stop_application() {
    echo "  ⏹️ Stopping application if running..."
    if [[ -n "$SUDO_USER" ]]; then
        sudo -u "$SUDO_USER" rog-perf-tuner -k
    else
        rog-perf-tuner -k
    fi
    return $?
}

relaunch_application() {
    stop_application
    local status=$?
    if [[ $status -eq 0 ]]; then
        echo "  🚀 Relaunching application..."

        if [[ -n "$SUDO_USER" ]]; then
            local USER_HOME USER_UID SESSION_ID SESSION_TYPE
            USER_HOME=$(getent passwd "$SUDO_USER" | cut -d: -f6)
            USER_UID=$SUDO_UID

            SESSION_ID=$(loginctl | awk "/$SUDO_USER/ {print \$1; exit}")
            SESSION_TYPE=$(loginctl show-session "$SESSION_ID" -p Type --value 2>/dev/null)

            if [[ "$SESSION_TYPE" == "wayland" ]]; then
                ENV_EXPORTS="export WAYLAND_DISPLAY=\${WAYLAND_DISPLAY:-wayland-0};
                             export XDG_RUNTIME_DIR=/run/user/${USER_UID};
                             export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/${USER_UID}/bus;"
            else
                ENV_EXPORTS="export DISPLAY=:0;
                             export XAUTHORITY=${USER_HOME}/.Xauthority;
                             export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/${USER_UID}/bus;"
            fi

            sudo -u "$SUDO_USER" bash -c "
                ${ENV_EXPORTS}
                nohup /usr/bin/rog-perf-tuner >/dev/null 2>&1 &
            " >/dev/null 2>&1 &
        else
            nohup /usr/bin/rog-perf-tuner >/dev/null 2>&1 &
        fi
    fi
}


post_install() {
    echo "📦 Performing install actions..."
    reload_udev_rules
}

post_upgrade() {
    echo "🔼 Performing update actions..."
    reload_udev_rules
    relaunch_application
}

post_remove() {
    echo "🗑️ Performing remove actions..."
    reload_udev_rules
    stop_application
}
