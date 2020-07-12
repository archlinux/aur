# Maintainer: Brandon 'Inco' Little <drinco@posteo.net>
projname=pinentry-dmenu
pkgname=$projname-inco
pkgdesc='simple dmenu / GnuPG integration'
pkgver=20.07.12.13
pkgrel=1

url=https://github.com/drincoxyz/$projname
source=($url/archive/$pkgver.tar.gz)
sha256sums=(0da76d817b21d87bd006ac487180ac3f866a5019706b55ba1c702cea3899c6d8)

arch=(any)
license=(GPL)

makedepends=(make)
provides=(dmenu-pinentry)

package() {
	cd $srcdir/$projname-$pkgver
	make PREFIX=/usr DESTDIR=$pkgdir/ install
}
