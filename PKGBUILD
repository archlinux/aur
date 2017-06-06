# Maintainer: EinBaum <mail@einbaum.org>

pkgrel=1
pkgver=1.12
sha256sums=('SKIP')

pkgname=rig
pkgdesc='Random Identity Generator'
arch=('any')
url='https://github.com/EinBaum/rig'
license=('GPL')
source=("https://github.com/EinBaum/rig/archive/1.12.tar.gz")

package() {
	cd $srcdir/$pkgname-$pkgver
	make
	make install PREFIX=$pkgdir/usr
}
