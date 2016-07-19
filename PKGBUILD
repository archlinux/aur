# Contributor: graysky <graysky AT archlinux dot us>

pkgname=lostfiles
pkgver=3.23
pkgrel=1
pkgdesc='Find orphaned files not owned by any Arch packages'
arch=('any')
license=('GPL2')
url="https://github.com/graysky2/lostfiles"
source=("https://github.com/graysky2/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('a402874a6345b2f12c6e4903abe0133f1f76e6cc2c2f8d1d3ebdea7c112f3adf')

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
}
