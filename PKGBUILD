# Maintainer: Andrei Dobre <andreidobre at gmail dot com>
# Contributor: David Birks <david@birks.dev>

pkgname=tilt
pkgdesc="Local Kubernetes development with no stress"
pkgver=0.23.4
pkgrel=1
arch=('x86_64')
license=('Apache')
url="https://github.com/tilt-dev/tilt"
conflicts=('tilt-bin')
source=("https://github.com/tilt-dev/tilt/releases/download/v${pkgver}/tilt.${pkgver}.linux.x86_64.tar.gz")
sha256sums=('b5e3ec7b6abbb4ee89a2a3bc6b3c55062c889d7812922c83c13b6c099f709a2f')

package() {
  install -Dm 755 "${srcdir}/tilt" "${pkgdir}/usr/bin/tilt"
}
