# Contributor: graysky <graysky AT archlinux dot us>

pkgname=lostfiles
pkgver=3.15
pkgrel=1
pkgdesc='Find orphan files - those not owned by any Arch packages.'
arch=('any')
license=('GPL2')
url="https://github.com/graysky2/lostfiles"
source=("https://github.com/graysky2/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('c3d8c8abaab5469f733421b3086823f85983b94d00abf0fd7d4b2dd072818c1a')

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
}
