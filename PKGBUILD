# Maintainer: DIMFLIX <dimflix.official@gmail.com>
pkgname=hotkeyhub-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="Cheat Sheet for keybindings in hyprland, bspwm, and other WMs"
arch=('x86_64')
url="https://github.com/meowrch/HotkeyHub"
license=('GPL-3.0-or-later')
depends=('gtk4')
source=(
  "$url/releases/download/v$pkgver/hotkeyhub-linux-x86_64"
)
sha256sums=('eaf1c4baf9e4c23b9ffb3090b46a3f9760157c2d7148a07897d74e92db31e79e')

package() {
  # Install binary
  install -Dm755 hotkeyhub-linux-x86_64 "$pkgdir/usr/bin/hotkeyhub"
}
