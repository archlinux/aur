# Maintainer: DIMFLIX <dimflix.official@gmail.com>
pkgname=hotkeyhub-bin
pkgver=0.2.1
pkgrel=1
pkgdesc="Cheat Sheet for keybindings in hyprland, bspwm, and other WMs"
arch=('x86_64')
url="https://github.com/meowrch/HotkeyHub"
license=('GPL-3.0-or-later')
depends=('gtk4')
source=(
  "$url/releases/download/v$pkgver/hotkeyhub-linux-x86_64"
)
sha256sums=('69523183535b7e12c973cb2a553d317308b28bfcda36a3506ab1483a5237873d')

package() {
  # Install binary
  install -Dm755 hotkeyhub-linux-x86_64 "$pkgdir/usr/bin/hotkeyhub"
}
