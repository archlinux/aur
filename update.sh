#!/bin/bash
set -x

makepkg
mksrcinfo

git add .
git commit -m "Rebuild to get latest version"

set +x

echo "Now install and smoke test the package, review the commit, and push"
