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
url="http://www.moviemistakes.com/film3297/quotes"
md5sums=('46f18341b325dff8bc1d1bf4db091738')

build() {
  cp "${srcdir}/fortunes.txt" "${srcdir}/matrix"
  strfile "${srcdir}/matrix" "${srcdir}/matrix.dat"
}

package() {
	install -D -m644 "${srcdir}/matrix" "${pkgdir}/usr/share/fortune/matrix"
	install -D -m644 "${srcdir}/matrix.dat" "${pkgdir}/usr/share/fortune/matrix.dat"
}
