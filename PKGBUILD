# Maintainer: sansation <sansation.git@gmail.com>
pkgname=latexcalc
pkgver=1.0.1
pkgrel=1
pkgdesc="Program made to calculate values within LaTeX files before typesetting"
arch=('any')
url="http://latexcalc.sourceforge.net"
source=("http://downloads.sourceforge.net/project/${pkgname}/${pkgname}-${pkgver}.tar")
makedepends=('tar')
sha256sums=('SKIP')

package() {
	cd ${srcdir}/${pkgname}-${pkgver}
	./configure
	make
	install -Dm755 "build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 "COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
