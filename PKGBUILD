
# Maintainer: Victor Tran <vicr12345 at gmail dot com>
pkgname=contemporary-icons
pkgver=1.10
pkgrel=0
pkgdesc="Contemporary Icons"
arch=("any")
url="http://vicr123.github.io/contemporary"
license=('cc-by-sa-4.0')
depends=()
makedepends=()
source=("$pkgname-$pkgver"::'https://github.com/vicr123/contemporary-icons/archive/refs/tags/v1.10.tar.gz')
sha256sums=('7c168ddbd47af1676e8083ef48742e741d529bcdd8b298cff99200576434f190')

package() {
	mkdir -p "$pkgdir/usr/share/icons/contemporary"
	cp -r "$pkgname-$pkgver/"* "$pkgdir/usr/share/icons/contemporary/"
	mkdir -p "$pkgdir/usr/share/licenses/$pkgname/"
	mv "$pkgdir/usr/share/icons/contemporary/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}
