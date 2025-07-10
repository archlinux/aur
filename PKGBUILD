# Mantainer: matheus-git <mathiew0@gmail.com>
pkgname=systemd-manager-tui
pkgver=1.0.8
pkgrel=1
pkgdesc="systemd manager tui"
arch=('x86_64')
url="https://github.com/matheus-git/systemd-manager-tui"
license=('MIT')
source=("https://github.com/matheus-git/systemd-manager-tui/releases/download/v1.0.8/systemd-manager-tui_1.0.8")
sha256sums=('60ad62371e3742053cafcf4cbdcecf2bf188ca0da01958f5c1788c5b4850edc0')

package() {
  install -Dm755 "$srcdir/systemd-manager-tui_1.0.8" "$pkgdir/usr/bin/systemd-manager-tui"
}
