# Maintainer: Witalij Berdinskikh <radio_rogal@keemail.me>

pkgname=latynka-kbd
pkgver=1.0.0
pkgrel=2
pkgdesc="The Ukrainian Latin keyboard"
arch=("any")
url="https://github.com/vitalijr2/latynka-kbd"
license=('Apache')
depends=('xkeyboard-config')
source=("https://github.com/vitalijr2/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.bz2")
md5sums=('6066ec6325f6224a0246023d2ed15910')
sha256sums=('b81d75853cb6c8ec6d4125358f76471d71476f2251e0539f117f290bccd15d43')

package() {
	cd "$pkgname-$pkgver"

	install -D -m 644 linux/xkb/symbols/latynka ${pkgdir}/usr/share/X11/xkb/symbols/latynka
}
