#!/bin/bash
if [ -z "$1" ]; then
  echo "Usage: $0 <version>"
  exit 1
fi
makepkg --printsrcinfo > .SRCINFO
git add .
git commit -m "Update to version $1"
git push origin master:master
