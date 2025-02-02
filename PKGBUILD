# Maintainer: FerrousInk <ferrousink-aur@proton.me>
pkgname=power-buttons
pkgver=2.0.0
pkgrel=2
pkgdesc="Adds poweroff, reboot and suspend buttons to the applications folder"
arch=('any')
url="https://halal.hackrland.dev"
license=('MIT')
depends=('systemd')

prepare() {
  cp ../*.desktop "$srcdir"
}

package() {
  sudo install -Dm 644 "$srcdir/poweroff.desktop" "/usr/share/applications/poweroff.desktop"
  sudo install -Dm 644 "$srcdir/reboot.desktop" "/usr/share/applications/reboot.desktop"
  sudo install -Dm 644 "$srcdir/suspend.desktop" "/usr/share/applications/suspend.desktop"
}
