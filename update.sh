#!/bin/bash
makepkg --printsrcinfo > .SRCINFO && git commit .SRCINFO PKGBUILD && git push
