#!/usr/bin/env bash

cd ~/projects/AUR/joplin-appimage
mksrcinfo && git add . && git commit -am "Updated to v. 1.0.229-1" && git push origin master
