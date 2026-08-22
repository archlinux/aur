#/usr/bin/bash

makepkg --printsrcinfo > .SRCINFO

git add .

git commit -m "Update to version $1"