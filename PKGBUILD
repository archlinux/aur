# Maintainer: Witalij Berdinskikh <radio_rogal@keemail.me>

pkgname=latynka-kbd
pkgver=1.0.0
pkgrel=3
pkgdesc="The Ukrainian Latin keyboard"
arch=("any")
url="https://github.com/vitalijr2/latynka-kbd"
license=('Apache')
depends=('xkeyboard-config')
source=("https://github.com/vitalijr2/$pkgname/archive/refs/tags/$pkgver.tar.gz")
md5sums=('c3d650f276b688d1457adcf3cdd89ae4')
sha256sums=('e9b40b75aabb7ad83ab082b18da130781234a8d427c5e9084075834f2dd79798')

package() {
	cd "$pkgname-$pkgver"

	install -D -m 644 linux/xkb/symbols/latynka ${pkgdir}/usr/share/X11/xkb/symbols/latynka
}
