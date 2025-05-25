# Maintainer: Alois~ <aloisianer@proton.me>
pkgname=power-buttons
pkgver=1.0.1
pkgrel=4
pkgdesc="Adds poweroff and reboot buttons to the applications folder"
arch=('any')
url="https://alois.hackrland.dev"
license=('MIT')
depends=('systemd')

prepare() {
  cp ../*.desktop "$srcdir"
}

package() {
  sudo install -Dm 644 "$srcdir/poweroff.desktop" "/usr/share/applications/poweroff.desktop"
  sudo install -Dm 644 "$srcdir/reboot.desktop" "/usr/share/applications/reboot.desktop"
}
