# Maintainer: Dominic Egginton <dominic.egginton@gmail.com>
pkgname=flip-bin
pkgver=0.1.4
pkgrel=1
pkgdesc="Flip coins in your command line"
arch=("x86_64")
url="https://github.com/dominicegginton/flip"
license=('MIT')
provides=(flip)
conflicts=(flip)
source=(https://github.com/dominicegginton/flip/releases/download/0.1.5/flip)
sha512sums=('fcd76a0e683b89f90e2685abf152c16593d623c7cafdec3f38af3f690d3e308e01fa927d6aff33835bcede9620b4a750eb480b1a6e2abe7d6ecf11b1e88d48c6')

package() {
  install -Dm755 "${srcdir}/flip" "${pkgdir}/usr/bin/flip"
}
