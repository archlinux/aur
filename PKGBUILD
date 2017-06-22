
# Maintainer: Victor Tran <vicr12345 at gmail dot com>
pkgname=contemporary-icons
pkgver=1.2
pkgrel=0
pkgdesc="Contemporary Icons"
arch=("any")
url="http://vicr123.github.io/contemporary"
license=('cc-by-sa-4.0')
depends=()
makedepends=()
source=("$pkgname-$pkgver"::'git+https://github.com/vicr123/contemporary-icons.git')
sha256sums=('SKIP')

package() {
	mkdir -p "$pkgdir/usr/share/icons/contemporary"
	cp -r "$pkgname-$pkgver/"* "$pkgdir/usr/share/icons/contemporary/"
	mkdir -p "$pkgdir/usr/share/licenses/$pkgname/"
	mv "$pkgdir/usr/share/icons/contemporary/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}
