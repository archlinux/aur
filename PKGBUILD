# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Jeff Mickey <j@codemac.net>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=bar
pkgver=1.4
pkgrel=6
pkgdesc='A script for showing progress bars.'
arch=('any')
url='http://www.theiling.de/projects/bar.html'
license=('custom')
source=("http://www.theiling.de/downloads/bar-${pkgver}-src.tar.bz2")
md5sums=('4b99147e2efbe678cbcdc985ad2412f4')

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	install -Dm0755 bar "${pkgdir}/usr/bin/bar"
	install -Dm0644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
