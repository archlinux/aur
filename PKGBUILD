# Maintainer: k1f0 <generic at k1f0.mozmail.com>

pkgname=xcursor-pro-hyprcursor
pkgver=0.2
pkgrel=3
pkgdesc="Hyprcursor port of https://github.com/ful1e5/XCursor-pro"
arch=(any)
url="https://github.com/0xk1f0/XCursor-Pro-Hyprcursor"
license=('GPL-3.0-only')
source=(
    "${pkgname}-${pkgver}-dark.tar.gz::${url}/releases/download/v${pkgver}/XCursor-Pro-Hyprcursor-Dark.tar.gz"
    "${pkgname}-${pkgver}-light.tar.gz::${url}/releases/download/v${pkgver}/XCursor-Pro-Hyprcursor-Light.tar.gz"
    "${pkgname}-${pkgver}-red.tar.gz::${url}/releases/download/v${pkgver}/XCursor-Pro-Hyprcursor-Red.tar.gz"
)
sha256sums=(
    "02c59e7809e741935091ba0c7aab5524644f983e852f169dd68eecc48434acd7"
    "9605c98590fbd4ec70fb490d91411b5bc0dddba380da9575bc8c8e360ca617ba"
    "67ba6e88d0e5265b6afdf45db96da70ce81612bdca49620b4b24999dc4099d77"
)

package() {
	install -d "${pkgdir}/usr/share/icons/XCursor-Pro-Hyprcursor-Dark"
	cp -ar --no-preserve=ownership "${srcdir}/XCursor-Pro-Hyprcursor-Dark/." "${pkgdir}/usr/share/icons/XCursor-Pro-Hyprcursor-Dark"
	install -d "${pkgdir}/usr/share/icons/XCursor-Pro-Hyprcursor-Light"
	cp -ar --no-preserve=ownership "${srcdir}/XCursor-Pro-Hyprcursor-Light/." "${pkgdir}/usr/share/icons/XCursor-Pro-Hyprcursor-Light"
	install -d "${pkgdir}/usr/share/icons/XCursor-Pro-Hyprcursor-Red"
	cp -ar --no-preserve=ownership "${srcdir}/XCursor-Pro-Hyprcursor-Red/." "${pkgdir}/usr/share/icons/XCursor-Pro-Hyprcursor-Red"
}
