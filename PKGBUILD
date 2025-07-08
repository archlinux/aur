# Maintainer: David Birks <david@birks.dev>

pkgname=systemd-manager-tui-bin
pkgver=1.0.2
pkgrel=1
pkgdesc="Terminal UI for managing systemd services"
arch=('x86_64')
url="https://github.com/matheus-git/systemd-manager-tui"
license=('MIT')
depends=('systemd')
options=('!debug')
provides=('systemd-manager-tui')
source=(
  "systemd-manager-tui::https://github.com/matheus-git/systemd-manager-tui/releases/download/v${pkgver}/systemd-manager-tui"
)
sha256sums=('c216566caf61e7470aa60925189f43853c18906d9c8c2c5cd02566e3b808a2bb')

package() {
  install -Dm755 "${srcdir}/systemd-manager-tui" "${pkgdir}/usr/bin/systemd-manager-tui"
}

