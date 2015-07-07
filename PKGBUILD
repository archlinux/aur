# Contributor: Angelo Theodorou <encelo@users.sourceforge.net>
pkgname=csl
pkgver=0.8
pkgrel=1
pkgdesc="Cube Server Lister"
arch=('i686')
url="http://cubelister.sourceforge.net/"
license=('GPL')
depends=('wxgtk' 'geoip')
source=(http://downloads.sourceforge.net/sourceforge/cubelister/$pkgname-$pkgver.tar.bz2)
md5sums=('e2acded5cc6cc64efd7d84eb05fbba28')

build() {
  cd $srcdir/$pkgname-$pkgver

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$pkgdir/ install
}
