# Maintainer: Aria Moradi <aria.moradi007 at gmail dot com>

pkgname=catapult-bin
pkgver=22.03b
pkgrel=1
pkgdesc="A cross-platform launcher for Cataclysm: DDA and BN"
arch=("x86_64")
url="https://github.com/qrrk/Catapult"
license=("MIT")
depends=()
provides=("catapult")
source=("$pkgname-$pkgver::$url/releases/download/$pkgver/catapult-linux-x64-$pkgver"
	"catapult.sh")
sha256sums=('SKIP'
	    '72f7e507fc2081b2c7b51e389f3dd07c35954ec3576021bd7a11b6e35fc80d63')

noextract=("$pkgname-$pkgver")

package() {
    install -Dm755 "${srcdir}/$pkgname-$pkgver"  "${pkgdir}/opt/${pkgname}/catapult"
    install -Dm755 "${srcdir}/catapult.sh"  "${pkgdir}/usr/bin/catapult"
}
