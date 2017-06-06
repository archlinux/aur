# Maintainer: EinBaum <mail@einbaum.org>

pkgrel=3
pkgver=1.12
sha256sums=('995229efec9982cdfd79c5ca8b35055ef46d3b7da65451ec4f375de970c57359')

pkgname=rig
pkgdesc='Random Identity Generator'
arch=('any')
url='https://github.com/EinBaum/rig'
license=('GPL')
source=("https://github.com/EinBaum/rig/archive/1.12.tar.gz")

build() {
	cd $srcdir/$pkgname-$pkgver
	make PREFIX=/usr
}
package() {
	cd $srcdir/$pkgname-$pkgver
	make install PREFIX=$pkgdir/usr
}
