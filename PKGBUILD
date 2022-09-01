# Maintainer: spitemim
pkgname=battalion
pkgver=1.4b
pkgrel=1
pkgdesc="Battalion is a game where 'A monster blows up, destroys' repeats."
arch=('x86_64')
url="https://www.evl.uic.edu/aej/AndyBattalion.html"
provides=("$pkgname")
source=("https://www.evl.uic.edu/aej/BATTALION/$pkgname$pkgver.tar.bz2")
sha256sums=('f9506f8fbb544a77373e01f8bda93ac339433b0ea84296fe0c287f2bf37bf8b3')

package() {
	install -Dm755 "$srcdir/$pkgname$pkgver/battalion" "$pkgdir/usr/bin/battalion"
}
