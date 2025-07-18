#!/bin/bash

set -e

# Проверяем и запускаем D-Bus если необходимо
if [ ! -S "/run/dbus/system_bus_socket" ] && [ ! -S "/var/run/dbus/system_bus_socket" ]; then
    echo "Предупреждение: D-Bus system bus недоступен"
    export DBUS_SESSION_BUS_ADDRESS="unix:path=/dev/null"
fi

# Устанавливаем hostname если команда недоступна
if ! command -v hostname >/dev/null 2>&1; then
    export HOSTNAME="${HOSTNAME:-localhost}"
fi

CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
CONFIG_FILE="${PERPLEXITY_CONFIG:-$CONFIG_HOME/perplexity.conf}"

if [ ! -f "$CONFIG_FILE" ]; then
    echo "Конфиг не найден, копирую дефолтный"
    mkdir -p "$(dirname "$CONFIG_FILE")"
    cp /etc/perplexity/default.conf "$CONFIG_FILE"
fi

# shellcheck source=/dev/null
source "$CONFIG_FILE"

# Определяем дополнительные флаги в зависимости от типа сессии
SESSION_FLAGS=""
if [ "$XDG_SESSION_TYPE" == "wayland" ] || [ -n "$WAYLAND_DISPLAY" ]; then
    # Флаги для Wayland
    SESSION_FLAGS="--ozone-platform=wayland --enable-features=UseOzonePlatform --disable-gpu-sandbox"
elif [ "$XDG_SESSION_TYPE" == "x11" ] || [ -n "$DISPLAY" ]; then
    # Флаги для X11
    SESSION_FLAGS="--ozone-platform=x11 --enable-gpu-rasterization --enable-zero-copy --ignore-gpu-blacklist"
    # Убираем --disable-gpu для X11 если он есть в ELECTRON_ARGS
    ELECTRON_ARGS=$(echo "$ELECTRON_ARGS" | sed 's/--disable-gpu//g')
else
    # Fallback для неопределенной сессии
    SESSION_FLAGS="--disable-gpu --disable-software-rasterizer"
fi

ELECTRON_BIN=${ELECTRON_CUSTOM_BIN:-/usr/bin/electron}

export TRAY_ENABLED=${TRAY_ENABLED:-0}
export DEV_TOOLS=${DEV_TOOLS:-0}

# Объединяем все флаги в одну строку
ALL_FLAGS="$ELECTRON_ARGS $SESSION_FLAGS"

exec "$ELECTRON_BIN" "/usr/lib/perplexity" $ALL_FLAGS "$@"
