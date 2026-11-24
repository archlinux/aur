#!/bin/sh
set -e
# Keep the desktop database in sync when desktop-file-utils is present
# (harmless no-op otherwise).
if command -v update-desktop-database >/dev/null 2>&1; then
  update-desktop-database /usr/share/applications >/dev/null 2>&1 || true
fi
# Re-apply the extra-SDK patches when an additional SDK is installed: a
# fresh install or upgrade restores the pristine hvigor / hos-project-mgmt
# files. No-op without an extra SDK. Same as the pacman post_install /
# post_upgrade hook in devecostudio.install.
if [ -x /opt/devecostudio/bin/patch-extra-sdk.sh ]; then
  /opt/devecostudio/bin/patch-extra-sdk.sh --auto || true
fi
