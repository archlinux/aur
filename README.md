# wayback-x-compatibility-layer-git

AUR package for [wayback](https://github.com/kaniini/wayback) - an experimental X11 compatibility layer for Wayland.

## Description

Wayback is an experimental X compatibility layer which allows for running full X desktop environments using Wayland components. It is essentially a stub compositor which provides just enough Wayland capabilities to host a rootful Xwayland server.

## Repository Structure

This repository uses a single branch approach with a GitHub workflow that automatically updates the AUR package.

## Workflow

The GitHub workflow automatically:
1. Checks for new commits in the upstream wayback repository
2. Attempts to build the package
3. Updates the package version and description
4. If the build is successful, it removes "- Build unsuccessful" from the description (if present)
5. If the build fails, it adds "- Build unsuccessful" to the description
6. Creates a temporary directory with only the necessary files for AUR
7. Pushes those files directly to AUR

## Manual Installation

```bash
git clone https://aur.archlinux.org/wayback-x-compatibility-layer-git.git
cd wayback-x-compatibility-layer-git
makepkg -si
``` 