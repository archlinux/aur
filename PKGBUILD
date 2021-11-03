# Maintainer: calzonealamuerte <wilburn22 at messageden dot com>

pkgname=cliphist-bin
pkgver=0.3.0
pkgrel=1
pkgdesc='clipboard history “manager” for wayland'
arch=('x86_64')
url="https://github.com/sentriz/cliphist"
license=('GPL3')
provides=('cliphist')
depends=('wl-clipboard')
optdepends=('xdg-utils: for image mime inferance')
source=("${url}/releases/download/v${pkgver}/v${pkgver}-linux-amd64")
sha256sums=('b33dbe4a615d38689e2342ad9f8c6c41260b63a327b33032b97f699312501116')

package() {
  install -Dm755 "${srcdir}"/v${pkgver}-linux-amd64 "${pkgdir}/usr/bin/cliphist"
}
# vim:set ts=2 sw=2 et:
