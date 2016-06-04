# Contributor: graysky <graysky AT archlinux dot us>

pkgname=lostfiles
pkgver=3.19
pkgrel=1
pkgdesc='Find orphaned files not owned by any Arch packages'
arch=('any')
license=('GPL2')
url="https://github.com/graysky2/lostfiles"
source=("https://github.com/graysky2/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('db21ef736dd253e9c01394df110de90f5ff9429fee82b405aa669f7b89b25f8b')

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
}
