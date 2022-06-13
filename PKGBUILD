# Maintainer: Sintan Santorum <c1scu0hh at anonaddy dot me>
pkgname="knock"
pkgbase="knock-bin"
pkgver=1.2.0
pkgrel=1
pkgdesc="Convert ACSM files to PDF/EPUBs with one command on Linux"
arch=('x86_64')
url="https://github.com/BentonEdmondson/knock"
license=('GPLv3')
provides=('knock')
source=("knock::$url/releases/download/$pkgver/$pkgname-$pkgver-$arch-linux")
sha256sums=('304f7292d51e9b3fb2f68dd72965ffec7381b97dd5b75f116c1502815e3a344b')

package() {
	install -Dm755 ./knock "$pkgdir/usr/bin/knock"
}
