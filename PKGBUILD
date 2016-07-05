# Contributor: graysky <graysky AT archlinux dot us>

pkgname=lostfiles
pkgver=3.22
pkgrel=1
pkgdesc='Find orphaned files not owned by any Arch packages'
arch=('any')
license=('GPL2')
url="https://github.com/graysky2/lostfiles"
source=("https://github.com/graysky2/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('771adffeb9eafe3c3ca1bca1394264ee981545dfd90ba601f18cd5b2088a41a2')

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
}
