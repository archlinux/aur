# Maintainer: Lucas Werkmeister <mail@lucaswerkmeister.de>
# Contributor: Jeff Sharpe <jeff@impcode.com>
# Contributor: wido <widomaker2k7@gmail.com>

pkgname=fortune-mod-matrix
pkgver=20091124
pkgrel=3
pkgdesc="Fortune cookies: The trilogy matrix."
arch=('any')
license=('custom')
depends=('fortune-mod')
groups=('fortune-mods')
source="fortunes.txt"
url="https://en.wikiquote.org/wiki/The_Matrix_%28franchise%29"
md5sums=('3ff9ab5a2362b72d3f14768b5a36b06c')

build() {
  cp "${srcdir}/fortunes.txt" "${srcdir}/matrix"
  strfile "${srcdir}/matrix" "${srcdir}/matrix.dat"
}

package() {
  install -D -m644 "${srcdir}/matrix" "${pkgdir}/usr/share/fortune/matrix"
  install -D -m644 "${srcdir}/matrix.dat" "${pkgdir}/usr/share/fortune/matrix.dat"
}
