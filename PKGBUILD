# Mantainer: matheus-git <mathiew0@gmail.com>
pkgname=systemd-manager-tui
pkgver=1.0.8
pkgrel=1
pkgdesc="systemd manager tui"
arch=('x86_64')
url="https://github.com/matheus-git/systemd-manager-tui"
license=('MIT')
source=("https://github.com/matheus-git/systemd-manager-tui/releases/download/v1.0.9/systemd-manager-tui_1.0.9")
sha256sums=('c1754e460eaa5eec683e72efc7d6c6d94f270f5b6a27a413cc585b63d4a9de99')

package() {
  install -Dm755 "$srcdir/systemd-manager-tui_1.0.9" "$pkgdir/usr/bin/systemd-manager-tui"
}
