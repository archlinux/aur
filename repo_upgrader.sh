#!/bin/bash
# ###################################################
# You can use this script as
# cronjob (or something lika that)
# to automatically update package repository
#
# This script can be useful ONLY for repo contributors
# ####################################################
cd $(dirname "$0")
./update.sh && zenity --info --text "AUR-репозиторий пакета firefox-nightly-ru сейчас будет обновлен" --no-wrap && git pull && makepkg --printsrcinfo > .SRCINFO && git add PKGBUILD .SRCINFO && ./update.sh | grep -oP "^\w+: [0-9a-z.]+, \w+: \K([0-9a-z.]+)$" | awk '{print "Update to " $1}' | git commit -F - && git push
