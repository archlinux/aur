# Contributor: graysky <graysky AT archlinux dot us>

pkgname=lostfiles
pkgver=3.17
pkgrel=1
pkgdesc='Find orphan files - those not owned by any Arch packages.'
arch=('any')
license=('GPL2')
url="https://github.com/graysky2/lostfiles"
source=("https://github.com/graysky2/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('34b044b6198d87ca9778a00e3d5294655522dc5a6a026d1d67251a756781a886')

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
}
