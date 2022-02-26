# Maintainer: Andrei Dobre <andreidobre at gmail dot com>
# Contributor: David Birks <david@birks.dev>

pkgname=tilt
pkgdesc="Local Kubernetes development with no stress"
pkgver=0.25.2
pkgrel=1
arch=('x86_64')
license=('Apache')
url="https://github.com/tilt-dev/tilt"
conflicts=('tilt-bin')
source=("https://github.com/tilt-dev/tilt/releases/download/v${pkgver}/tilt.${pkgver}.linux.x86_64.tar.gz")
sha256sums=('d7b8c21ea3ab41fe147d1816379fcaf6201dd9253a54619bd3df370e2e04fc24')

package() {
  install -Dm 755 "${srcdir}/tilt" "${pkgdir}/usr/bin/tilt"
}
