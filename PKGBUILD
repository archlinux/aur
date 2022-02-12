# Maintainer: Andrei Dobre <andreidobre at gmail dot com>
# Contributor: David Birks <david@birks.dev>

pkgname=tilt
pkgdesc="Local Kubernetes development with no stress"
pkgver=0.25.0
pkgrel=1
arch=('x86_64')
license=('Apache')
url="https://github.com/tilt-dev/tilt"
conflicts=('tilt-bin')
source=("https://github.com/tilt-dev/tilt/releases/download/v${pkgver}/tilt.${pkgver}.linux.x86_64.tar.gz")
sha256sums=('06459ecc3c158e692538305caf2a56fe155c415b1d6fd27f9ea37f51bbc9de18')

package() {
  install -Dm 755 "${srcdir}/tilt" "${pkgdir}/usr/bin/tilt"
}
