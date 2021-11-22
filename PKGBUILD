# Maintainer: Andrei Dobre <andreidobre at gmail dot com>
# Contributor: David Birks <david@birks.dev>

pkgname=tilt
pkgdesc="Local Kubernetes development with no stress"
pkgver=0.23.1
pkgrel=1
arch=('x86_64')
license=('Apache')
url="https://github.com/tilt-dev/tilt"
conflicts=('tilt-bin')
source=("https://github.com/tilt-dev/tilt/releases/download/v${pkgver}/tilt.${pkgver}.linux.x86_64.tar.gz")
sha256sums=('736eba94401d4312fd538ee7d10d0fefbe8594d5c8f1f0cfff12f145d3632e32')

package() {
  install -Dm 755 "${srcdir}/tilt" "${pkgdir}/usr/bin/tilt"
}
