# Maintainer: Stephan Friedrichs <accounts at sfriedri dot de>

pkgname='simple-svg'
pkgver='1.0.0'
pkgrel='4'
pkgdesc='This library is a single file header-only C++ library for creating SVG files'
arch=('any')
url='https://github.com/adishavit/simple-svg'
license=('custom:BSD3')
source=('https://github.com/adishavit/simple-svg/archive/refs/heads/master.zip')
sha256sums=('91c559c5ba813982dab382a90d9bb33dfe411084f3afb2f64600ea76669738cb')
depends=()

package() {
	install -D -m644 "${srcdir}/${pkgname}-master/simple_svg_${pkgver}.hpp" "${pkgdir}/usr/include/simple_svg.hpp"
	install -D -m644 "${srcdir}/${pkgname}-master/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
