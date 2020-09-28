#!/bin/bash

# Steps:
# First in the main project / git repository needs to create an annotated tag and push it.
# - git tag -a v1.1 -m "Release version 1.1. Upgraded all the features with dark colors."
# - git push origin --tags
# Then go outside of this project folder and clone the next repository after this run this script.
# - git clone ssh://aur@aur.archlinux.org/battery-discharging-beep-git.git
# - cd battery-discharging-beep-git
# - ./upload-package.sh
# If you are in the AUR repository from your local computer and you don't know what files are needed, download these:
# - https://raw.githubusercontent.com/airvzxf/linux-battery-discharging-beep/master/arch-aur/PKGBUILD
# - https://raw.githubusercontent.com/airvzxf/linux-battery-discharging-beep/master/arch-aur/upload-package.sh
# - ./upload-package.sh

makepkg -f
rm -fR battery-discharging-beep* pkg src .SRCINFO
makepkg --printsrcinfo > .SRCINFO
git add .
git status
echo "Write your commit comment: "
read -r COMMENT
git commit -m "${COMMENT}"
git push
