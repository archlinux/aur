# Maintainer: Brandon 'Inco' Little <drinco@posteo.net>
projname=pinentry-dmenu
pkgname=$projname-inco
pkgdesc='simple dmenu / GnuPG integration'
pkgver=20.07.26.20
pkgrel=1

url=https://github.com/drincoxyz/$projname
source=($url/archive/$pkgver.tar.gz)
sha256sums=(04821c6ae5c39a3a37e6000ff62a9bbd1ce20904fe9bd7ef9ec2ea89d84f9225)

arch=(any)
license=(GPL)

makedepends=(make)
provides=(dmenu-pinentry)

package() {
	cd $srcdir/$projname-$pkgver
	make PREFIX=/usr DESTDIR=$pkgdir/ install
}
