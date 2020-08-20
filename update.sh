#!/usr/bin/env bash

cd ~/projects/AUR/joplin-appimage
makepkg --printsrcinfo > .SRCINFO && git add . && git commit -am "Updated to v. 1.0.235-1" && git push origin master
