# Maintainer: Nick Econopouly <wry at mm dot st>
pkgname=xlsxio
pkgver="0.2.21"
pkgrel=1
pkgdesc="C library for reading and writing .xlsx files"
arch=('x86_64')
provides=('xlsxio')
url=https://github.com/brechtsanders/xlsxio
license=('MIT')
depends=('expat' 'minizip')
source=("$url/releases/download/$pkgver/xlsxio-$pkgver.tar.xz")
sha256sums=('0cc9b339bbacdb9b140b2a88be8f2e15d57394808a42aad29d6bf74cab2fd506')

package() {
	cd "$pkgname-$pkgver"
	make install PREFIX=$pkgdir/usr
	install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}


