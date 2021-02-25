# Maintainer: Thomas van Maaren <thomas.v.maaren@outlook.com>
pkgname=zobrollo
pkgver=0.2.0
pkgrel=3
pkgdesc="A 2d minimalistic top-view racing game"
arch=('x86_64')
url="https://www.kznarsk.xyz/zobrollo"
license=('GPL')
depends=('allegro' 'ttf-dejavu')
source=("$pkgname-$pkgver.tar.gz::https://www.kznarsk.xyz/zobrollo/build/$pkgname-$pkgver.tar.gz")
md5sums=('SKIP')


build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make  DESTDIR="$pkgdir"/ install
}
