# Maintainer: Dominic Egginton <dominic.egginton@gmail.com>
pkgname=flip-bin
pkgver=0.1.2
pkgrel=1
pkgdesc="Flip coins in your command line"
arch=("x86_64")
url="https://github.com/dominicegginton/flip"
license=('MIT')
provides=(flip)
conflicts=(flip)
source=(https://github.com/dominicegginton/flip/releases/download/0.1.2/flip)
sha256sums=('SKIP')

package() {
  install -Dm755 "${srcdir}/flip" "${pkgdir}/usr/bin/flip"
}
