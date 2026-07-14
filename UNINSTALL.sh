#!/bin/sh
# LidHandler uninstall script
# Removes the drop-in config and restores default lid switch behavior

set -e

DROPIN_FILE="/etc/systemd/logind.conf.d/10-lidhandler.conf"

echo "Uninstalling LidHandler..."

if [ -f "$DROPIN_FILE" ]; then
    rm -f "$DROPIN_FILE"
    echo "Removed $DROPIN_FILE"
fi

rmdir --ignore-fail-on-non-empty /etc/systemd/logind.conf.d 2>/dev/null || true

systemctl kill -s HUP systemd-logind 2>/dev/null || true
echo "LidHandler: Lid switch restored to default behavior"
echo "Uninstall complete."
