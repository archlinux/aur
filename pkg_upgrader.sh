#!/bin/bash

# #########################################################
# You can use this script as 
# cronjob (or something lika that) 
# to automatically update the app.
#
# DON'T FORGET TO REPLACE `yay` to your favorite AUR helper
# #########################################################

RELEASE_TIMESTAMP=$(curl -sL https://download-installer.cdn.mozilla.net/pub/firefox/nightly/latest-mozilla-central-l10n/ | grep -A2 "firefox-$(cat PKGBUILD  | grep -oP "^_version=\K(.*)"  | awk '{print $1}').ru.linux-x86_64.tar.bz2\"" | tail -n1 | cut -f2 -d'>' | cut -f1 -d'<' | date +"%s" -f -)
LOCAL_TIMESTAMP=$(cat ~/.firefox-nightly-ru.release.timestamp || echo 0)

if (("$RELEASE_TIMESTAMP" > "$LOCAL_TIMESTAMP")); then
	yay -S firefox-nightly-ru --noconfirm && echo $RELEASE_TIMESTAMP > ~/.firefox-nightly-ru.release.timestamp
fi
