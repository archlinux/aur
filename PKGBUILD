# Contributor: graysky <graysky AT archlinux dot us>

pkgname=lostfiles
pkgver=3.14
pkgrel=1
pkgdesc='Find orphan files - those not owned by any Arch packages.'
arch=('any')
license=('GPL2')
url="https://github.com/graysky2/lostfiles"
source=("https://github.com/graysky2/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('f16ff9c2b74e18f7826a140df2a7b381bf262aa3d3fe564fb1c3900f531a2675')

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
}
