# Maintainer: calzonealamuerte <wilburn22 at messageden dot com>

pkgname=cliphist-bin
pkgver=0.3.1
pkgrel=1
pkgdesc='clipboard history “manager” for wayland'
arch=('x86_64')
url="https://github.com/sentriz/cliphist"
license=('GPL3')
provides=('cliphist')
depends=('wl-clipboard')
optdepends=('xdg-utils: for image mime inferance')
source=("${url}/releases/download/v${pkgver}/v${pkgver}-linux-amd64")
sha256sums=('3aa354dfc38193fac8e7790f22700ea9c0ecb648700eba1898f4a53df874b55a')

package() {
  install -Dm755 "${srcdir}"/v${pkgver}-linux-amd64 "${pkgdir}/usr/bin/cliphist"
}
# vim:set ts=2 sw=2 et:
