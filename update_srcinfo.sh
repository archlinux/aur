#!/bin/sh

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

echo Updating .SRCINFO

cd "$DIR"
makepkg --printsrcinfo > .SRCINFO
git add .SRCINFO
