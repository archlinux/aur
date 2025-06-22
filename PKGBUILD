# Maintainer: Vitalij Berdinskih <vitalij_r2@outlook.com>

pkgname=latynka-kbd
pkgver=1.0.1
pkgrel=1
pkgdesc="The Ukrainian Latin keyboard"
arch=("any")
url="https://github.com/vitalijr2/latynka-kbd"
license=('Apache')
depends=('xkeyboard-config')
source=("https://github.com/vitalijr2/$pkgname/archive/refs/tags/$pkgver.tar.gz")
md5sums=('025f726f7e284a2007e05c2c662ec50e')
sha256sums=('7d9e52e7f57571533d98923b4f8f57af402dd56614309bd6ed6ef169a2335f1f')

package() {
	cd "$pkgname-$pkgver"

	install -D -m 644 linux/xkb/symbols/latynka ${pkgdir}/usr/share/xkeyboard-config-2/symbols/latynka
}
