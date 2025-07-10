# Mantainer: matheus-git <mathiew0@gmail.com>
pkgname=systemd-manager-tui
pkgver=1.0.8
pkgrel=1
pkgdesc="systemd manager tui"
arch=('x86_64')
url="https://github.com/matheus-git/systemd-manager-tui"
license=('MIT')
source=("https://github.com/matheus-git/systemd-manager-tui/releases/download/v1.0.8/systemd-manager-tui_1.0.8")
sha256sums=('7949945673a55b2613ae25df4e1b7f3510b6e6949b401e185c7334e2bfa35179')

package() {
  install -Dm755 "$srcdir/systemd-manager-tui_1.0.8" "$pkgdir/usr/bin/systemd-manager-tui"
}
