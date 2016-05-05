# Contributor: graysky <graysky AT archlinux dot us>

pkgname=lostfiles
pkgver=3.18
pkgrel=1
pkgdesc='Find orphan files - those not owned by any Arch packages.'
arch=('any')
license=('GPL2')
url="https://github.com/graysky2/lostfiles"
source=("https://github.com/graysky2/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('b87f7b4bc690a2df410f385cf3aaf5b74f69ea3e369cb14a8930f9f422ff391e')

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
}
