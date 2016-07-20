# Contributor: graysky <graysky AT archlinux dot us>

pkgname=lostfiles
pkgver=3.24
pkgrel=1
pkgdesc='Find orphaned files not owned by any Arch packages'
arch=('any')
license=('GPL2')
url="https://github.com/graysky2/lostfiles"
source=("https://github.com/graysky2/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('d4aea75a27e7c5b76c1029f493b638c50b7a8d9ced908cef1d1b803078c706c8')

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
}
