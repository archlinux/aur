# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=imager-bin
pkgver=0.3.4
pkgrel=2
pkgdesc='Automated image compression for efficiently distributing images on the web'
arch=('x86_64')
url="https://imager.io"
license=('MPL2')
depends=('gcc-libs')
provides=('imager')
conflicts=('imager')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/imager-io/imager/releases/download/auto-release/imager/${pkgver}/imager-v${pkgver}-linux.tar.gz")
sha256sums=('408c4e42cb02b0643d37c5955e7547d08de5e3417b500bb3c8a176c2601f6cbd')

package() {
  install -Dm755 linux/bin/imager -t "$pkgdir/usr/bin/"
}

# vim:set ts=2 sw=2 et:
