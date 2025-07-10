# Mantainer: matheus-git <mathiew0@gmail.com>
pkgname=systemd-manager-tui
pkgver=1.0.8
pkgrel=1
pkgdesc="systemd manager tui"
arch=('x86_64')
url="https://github.com/matheus-git/systemd-manager-tui"
license=('MIT')
source=("https://github.com/matheus-git/systemd-manager-tui/releases/download/v1.0.8/systemd-manager-tui_1.0.8")
sha256sums=('SKIP')

package() {
  install -Dm755 "$srcdir/systemd-manager-tui" "$pkgdir/usr/bin/systemd-manager-tui"
}
