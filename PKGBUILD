# Mantainer: matheus-git <mathiew0@gmail.com>
pkgname=systemd-manager-tui
pkgver=1.1.1
pkgrel=1
pkgdesc="systemd manager tui"
arch=('x86_64')
url="https://github.com/matheus-git/systemd-manager-tui"
license=('MIT')
source=("https://github.com/matheus-git/systemd-manager-tui/releases/download/v1.1.1/systemd-manager-tui")
sha256sums=('802f2850a5b1ecad50bf29fcecdce3baa6b9ef327c51569c298d6c01f8555a05')

package() {
  install -Dm755 "$srcdir/systemd-manager-tui_1.1.1" "$pkgdir/usr/bin/systemd-manager-tui"
}
