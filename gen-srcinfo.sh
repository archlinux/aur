#!/usr/bin/env bash

../sysit/scripts/gen-pkgbuild.sh > PKGBUILD

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )/" && pwd )"

podman build $SCRIPT_DIR -t sysit-bin-builder
cd $SCRIPT_DIR
podman run --rm sysit-bin-builder > .SRCINFO
podman image rm sysit-bin-builder
podman image rm archlinux

git commit -am "Update release." && git push
