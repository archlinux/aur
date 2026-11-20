# Maintainer: Ignacio Galmarino <igalmarino@gmail.com>
#
# Kept in Pila's repository (packaging/aur/pila-desktop); the AUR repository is
# a copy of this file and its .SRCINFO (makepkg --printsrcinfo > .SRCINFO).
#
# A metapackage: no files, only Pila (pila-git, or any package that provides
# pila) and the standard tools its default configuration runs. Installing
# pila-git alone gives the compositor alone; the defaults that aren't installed
# are skipped. The same list is in packaging/nfpm-desktop.yaml, flake.nix and
# docs/INSTALL.md. pkgver goes up when the list changes.

pkgname=pila-desktop
pkgver=2
pkgrel=1
pkgdesc='Pila with a desktop: its default wallpaper, bar, launcher, notifications, lock and keys'
arch=(any)
url='https://github.com/igalmarino/pila'
license=(GPL-3.0-or-later)
depends=(
    pila
    # The wallpaper (Pila's, drawn by swaybg), terminal, bar, launcher and
    # notifications.
    swaybg
    kitty
    waybar
    fuzzel
    mako
    # The symbols in the waybar configuration Pila writes.
    otf-font-awesome
    # Locking and the monitors off after a while.
    swayidle
    swaylock
    # The volume, brightness, media and screenshot keys.
    wireplumber
    brightnessctl
    playerctl
    grim
    slurp
    wl-clipboard
)
