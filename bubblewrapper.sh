#!/bin/bash
bwrap \
    --symlink usr/lib /lib \
    --symlink usr/lib64 /lib64 \
    --ro-bind /usr/lib /usr/lib \
    --ro-bind /usr/lib64 /usr/lib64 \
    --ro-bind /usr/bin/qq /usr/bin/qq \
    --ro-bind /usr/bin/xdg-open /usr/bin/xdg-open \
    --ro-bind /opt/QQ /opt/QQ \
    --ro-bind /usr/share /usr/share \
    --dev-bind /run/dbus /run/dbus \
    --dev-bind /run/user /run/user \
    --dev /dev \
    --dev-bind /dev/dri /dev/dri \
    --proc /proc \
    --ro-bind /etc/fonts /etc/fonts \
    --ro-bind /sys/dev/char /sys/dev/char \
    --ro-bind /sys/devices /sys/devices \
    --dir "$XDG_RUNTIME_DIR" \
    --ro-bind "$XDG_RUNTIME_DIR/pipewire-0" "$XDG_RUNTIME_DIR/pipewire-0" \
    --ro-bind "$XDG_RUNTIME_DIR/pulse" "$XDG_RUNTIME_DIR/pulse" \
    --tmpfs /tmp \
    --bind "$HOME/.cache" "$HOME/.cache" \
    --bind "$HOME/.themes" "$HOME/.themes" \
    --bind "$HOME/.icons" "$HOME/.icons" \
    --bind "$HOME/.local/share/themes" "$HOME/.local/share/themes" \
    --bind "$HOME/.local/share/icons" "$HOME/.local/share/icons" \
    --bind "$HOME/.config/fontconfig" "$HOME/.config/fontconfig" \
    --bind "$HOME/.config/QQ" "$HOME/.config/QQ" \
    --bind "$(xdg-user-dir DOWNLOAD)" "$(xdg-user-dir DOWNLOAD)" \
    --bind "$HOME/.pki" "$HOME/.pki" \
    --ro-bind "$HOME/.Xauthority" "$HOME/.Xauthority" \
    --bind /tmp/.X11-unix/X0 /tmp/.X11-unix/X0 \
     /opt/QQ/qq $@

rm -rf "$HOME/.config/QQ/crash_files"
