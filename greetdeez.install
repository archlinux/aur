#!/bin/sh
set -e

# Single source of truth for post-install setup.
# Called by: nFPM postinstall, AUR .install, and `make install`.

# --- System user ---
# sysusers.d handles this on systemd distros; this is the fallback.
if ! id -u greetdeez >/dev/null 2>&1; then
    useradd -r -s /usr/bin/nologin -d /var/lib/greetdeez -m greetdeez 2>/dev/null || true
fi

# --- State directory ---
# tmpfiles.d handles this on systemd distros; this is the fallback.
install -d -m 0750 -o greetdeez -g greetdeez /var/lib/greetdeez 2>/dev/null || true

# --- greetd config ---
cp /etc/greetd/greetd.toml /etc/greetd/config.toml
echo "==> Installed greetd config: /etc/greetd/config.toml"

# --- Enable greetd ---
if command -v systemctl >/dev/null 2>&1; then
    for dm in sddm gdm lightdm lxdm ly emptty; do
        systemctl disable "$dm.service" >/dev/null 2>&1 || true
    done

    systemctl set-default graphical.target >/dev/null 2>&1 || true
    systemctl enable greetd.service >/dev/null 2>&1 || true
    echo "==> Enabled greetd.service (starts on next boot)."
fi
