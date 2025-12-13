# Maintainer: DIMFLIX <dimflix.official@gmail.com>
pkgname=hotkeyhub-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="Cheat Sheet for keybindings in hyprland, bspwm, and other WMs"
arch=('x86_64')
url="https://github.com/meowrch/HotkeyHub"
license=('GPL-3.0-or-later')
depends=('gtk4')
source=(
  "$url/releases/download/v$pkgver/hotkeyhub-linux-x86_64"
)
sha256sums=('73b84f7278823b537113621fc87cb30badb6dbc7b5a0be3a132c31c2f78d1a42')

package() {
  # Install binary
  install -Dm755 hotkeyhub-linux-x86_64 "$pkgdir/usr/bin/hotkeyhub"
}
