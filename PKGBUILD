# Maintainer: Sintan Santorum <c1scu0hh at anonaddy dot me>
pkgname="knock-bin"
_pkgname="knock"
pkgver=1.2.0
pkgrel=2
pkgdesc="Convert ACSM files to PDF/EPUBs with one command on Linux"
arch=('x86_64')
url="https://github.com/BentonEdmondson/knock"
license=('GPLv3')
source=("knock::$url/releases/download/$pkgver/$_pkgname-$pkgver-$arch-linux")
sha256sums=('304f7292d51e9b3fb2f68dd72965ffec7381b97dd5b75f116c1502815e3a344b')

package() {
	install -Dm755 ./knock "$pkgdir/usr/bin/knock"
}
