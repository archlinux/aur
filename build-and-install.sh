#!/bin/bash

# Exit on error
set -e

echo "Updating pkgver..."
makepkg --nobuild --nodeps

echo "Generating .SRCINFO..."
makepkg --printsrcinfo > .SRCINFO

echo "Building and installing package locally..."
makepkg -si
