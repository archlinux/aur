# Maintainer: David Birks <david@birks.dev>

pkgname=systemd-manager-tui-bin
pkgver=1.2.0
pkgrel=1
pkgdesc="Terminal UI for managing systemd services"
arch=('x86_64')
url="https://github.com/matheus-git/systemd-manager-tui"
license=('MIT')
depends=()
options=('!debug')
provides=('systemd-manager-tui')
source=(
  "https://github.com/matheus-git/systemd-manager-tui/releases/download/v${pkgver}/systemd-manager-tui"
)
sha256sums=('39db9114e63e3124f4081c522143d70e6e2fc3382eb4ca8c28b3bc218754cd64')

package() {
  install -Dm755 "${srcdir}/systemd-manager-tui" "${pkgdir}/usr/bin/systemd-manager-tui"
}

