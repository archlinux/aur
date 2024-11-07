#!/bin/sh

# Update VCS && Version
makepkg --nobuild --force

# Generate Updated SRCINFO
makepkg --printsrcinfo > .SRCINFO
