# Maintainer: Sintan Santorum <c1scu0hh at anonaddy dot me>
pkgname="knock-bin"
_pkgname="knock"
pkgver=1.3.1
pkgrel=1
pkgdesc="Convert ACSM files to PDF/EPUBs with one command on Linux"
arch=('x86_64')
url="https://github.com/BentonEdmondson/knock"
license=('GPL3')
source=("knock::$url/releases/download/$pkgver/$_pkgname-$pkgver-$arch-linux")
b2sums=('ec0e7c0041cdec2a6bc7bdb3fec54eaaa55ed36212480494969b64b26570bf12a446d7949f9015d47d34cb01a59ede52030ea095bfd33d80668466eae8688885')

package() {
	install -Dm755 ./knock "$pkgdir/usr/bin/knock"
}
