# Contributor: graysky <graysky AT archlinux dot us>

pkgname=lostfiles
pkgver=3.20
pkgrel=1
pkgdesc='Find orphaned files not owned by any Arch packages'
arch=('any')
license=('GPL2')
url="https://github.com/graysky2/lostfiles"
source=("https://github.com/graysky2/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('d912009ac4d74211bf661184ac5a4e9f7c0853bee23985f0ec70ab4ca6c36543')

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
}
