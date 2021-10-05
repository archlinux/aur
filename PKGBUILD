# Maintainer: calzonealamuerte <wilburn22 at messageden dot com>

pkgname=cliphist-bin
pkgver=0.1.0
pkgrel=1
pkgdesc='clipboard history “manager” for wayland'
arch=('x86_64')
url="https://github.com/sentriz/cliphist"
license=('GPL3')
provides=('cliphist')
depends=('go' 'wl-clipboard')
optdepends=('xdg-utils: for image mime inferance')
source=("${url}/releases/download/v${pkgver}/v${pkgver}-linux-amd64")
sha256sums=('624c07319357d422c60a4646feaa680513196306aa002ab7d5f20839ad5294fb')

package() {
  install -Dm755 "${srcdir}"/v${pkgver}-linux-amd64 "${pkgdir}/usr/bin/cliphist"
}
# vim:set ts=2 sw=2 et:
