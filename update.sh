#!/bin/bash
set -x

makepkg -i
makepkg --printsrcinfo > .SRCINFO

git add .
git commit -m "Rebuild to get latest version"

set +x

echo "Now install and smoke test the package, review the commit, and push"
