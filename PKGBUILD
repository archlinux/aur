# Maintainer: Andrei Dobre <andreidobre at gmail dot com>
# Contributor: David Birks <david@birks.dev>

pkgname=tilt
pkgdesc="Local Kubernetes development with no stress"
pkgver=0.24.0
pkgrel=1
arch=('x86_64')
license=('Apache')
url="https://github.com/tilt-dev/tilt"
conflicts=('tilt-bin')
source=("https://github.com/tilt-dev/tilt/releases/download/v${pkgver}/tilt.${pkgver}.linux.x86_64.tar.gz")
sha256sums=('1233b6a18d4bdcce83859be31b6068bd68ad62ee83af10eebae80b0601aadee9')

package() {
  install -Dm 755 "${srcdir}/tilt" "${pkgdir}/usr/bin/tilt"
}
