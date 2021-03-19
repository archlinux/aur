# Maintainer: Stephan Friedrichs <accounts at sfriedri dot de>

pkgname='simple-svg'
pkgver='1.0.1'
pkgrel='1'
pkgdesc='A single file header-only C++ library for creating SVG files'
arch=('any')
url='https://github.com/adishavit/simple-svg'
license=('custom:BSD3')
source=("https://github.com/adishavit/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ab39240a6841c592ddbbf28c5338324844feff9f6507aea31a6e085b39460654')
depends=()

package() {
	install -D -m644 "${srcdir}/${pkgname}-${pkgver}/simple_svg_1.0.0.hpp" "${pkgdir}/usr/include/simple_svg.hpp"
	install -D -m644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
