# Maintainer: Nick Econopouly <wry at mm dot st>
pkgname=xlsxio
pkgver="0.2.29"
pkgrel=1
pkgdesc="C library for reading and writing .xlsx files"
arch=('x86_64')
provides=('xlsxio')
url=https://github.com/brechtsanders/xlsxio
license=('MIT')
depends=('expat' 'minizip')
source=("$url/releases/download/$pkgver/xlsxio-$pkgver.tar.xz")
sha256sums=('d193c74251cf1ca3b0407acbf861a52012fd265ee2206d2679f6d569f4aff893')

package() {
	cd "$pkgname-$pkgver"
	make install PREFIX=$pkgdir/usr
	install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
