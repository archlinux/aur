# Maintainer: David Birks <david@birks.dev>

pkgname=systemd-manager-tui-bin
pkgver=1.1.1
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
sha256sums=('802f2850a5b1ecad50bf29fcecdce3baa6b9ef327c51569c298d6c01f8555a05')

package() {
  install -Dm755 "${srcdir}/systemd-manager-tui" "${pkgdir}/usr/bin/systemd-manager-tui"
}

