
# Maintainer: Victor Tran <vicr12345 at gmail dot com>
pkgname=contemporary-cursors
pkgver=1.0
pkgrel=0
pkgdesc="Contemporary Cursors"
arch=("any")
url="http://vicr123.github.io/contemporary"
license=('cc-by-sa-4.0')
depends=()
makedepends=('git')
source=("$pkgname-$pkgver"::'git+https://github.com/vicr123/contemporary-cursors.git')
sha256sums=('SKIP')

package() {
	mkdir -p "$pkgdir/usr/share/icons/contemporary_cursors"
	cp -r "$pkgname-$pkgver/"* "$pkgdir/usr/share/icons/contemporary_cursors/"
	rm "$pkgdir/usr/share/icons/contemporary_cursors/README.md"
	mkdir -p "$pkgdir/usr/share/licenses/$pkgname/"
	mv "$pkgdir/usr/share/icons/contemporary_cursors/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}
