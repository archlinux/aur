# Maintainer: k1f0 <generic at k1f0.mozmail.com>

pkgname=xcursor-pro-hyprcursor
pkgver=0.1
pkgrel=2
pkgdesc="Hyprcursor port of https://github.com/ful1e5/XCursor-pro"
arch=(any)
url="https://github.com/0xk1f0/XCursor-Pro-Hyprcursor"
license=('GPL-3.0-only')
source=(
    "${url}/releases/download/v${pkgver}/XCursor-Pro-Hyprcursor-Dark.tar.gz"
    "${url}/releases/download/v${pkgver}/XCursor-Pro-Hyprcursor-Light.tar.gz"
    "${url}/releases/download/v${pkgver}/XCursor-Pro-Hyprcursor-Red.tar.gz"
)
sha256sums=(
    "ddcc4be68bf18486b8090588a80bfae72b7ef1dbb2d2ade88bf15c16b4e7bf18"
    "e656804228d942de57062d527e91323bfd19574c37d2bac85eb7e14ee5237829"
    "9ee021aaf8a3577cf8a9a1b532fc02477c8cfc648dcadf7ad55245f9619d0e47"
)

package() {
	install -d "${pkgdir}/usr/share/icons/XCursor-Pro-Hyprcursor-Dark"
    cp -ar --no-preserve=ownership "${srcdir}/XCursor-Pro-Hyprcursor-Dark/." "${pkgdir}/usr/share/icons/XCursor-Pro-Hyprcursor-Dark"
	install -d "${pkgdir}/usr/share/icons/XCursor-Pro-Hyprcursor-Light" "XCursor-Pro-Hyprcursor-Light"
    cp -ar --no-preserve=ownership "${srcdir}/XCursor-Pro-Hyprcursor-Light/." "${pkgdir}/usr/share/icons/XCursor-Pro-Hyprcursor-Light"
    install -d "${pkgdir}/usr/share/icons/XCursor-Pro-Hyprcursor-Red" "XCursor-Pro-Hyprcursor-Red"
    cp -ar --no-preserve=ownership "${srcdir}/XCursor-Pro-Hyprcursor-Red/." "${pkgdir}/usr/share/icons/XCursor-Pro-Hyprcursor-Red"
}
