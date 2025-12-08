# Maintainer: David Birks <david@birks.dev>

pkgname=systemd-manager-tui-bin
pkgver=1.2.0
pkgrel=2
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
sha256sums=('885aa9db3d24eadb53d2da00099f76de7cbfd30c2969ee2dd3c1a543cf90a4da')

package() {
  install -Dm755 "${srcdir}/systemd-manager-tui" "${pkgdir}/usr/bin/systemd-manager-tui"
}

