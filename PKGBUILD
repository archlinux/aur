# Contributor: graysky <graysky AT archlinux dot us>

pkgname=lostfiles
pkgver=3.16
pkgrel=1
pkgdesc='Find orphan files - those not owned by any Arch packages.'
arch=('any')
license=('GPL2')
url="https://github.com/graysky2/lostfiles"
source=("https://github.com/graysky2/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('9754946bd3cffef7e0ee13a8ce4582d212fab4980edad6f79a173b1db7ef009e')

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
}
