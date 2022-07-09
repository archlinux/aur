#!/bin/bash
makepkg
makepkg --printsrcinfo > .SRCINFO
rm -rfv rz608-fix* pkg src
