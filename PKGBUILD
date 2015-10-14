# Maintainer: Ennoïa <ennoia@laposte.net>
# Contributor: Victor Martinez Romanos <vmromanos@gmail.com>
# Previous Mantainer: Coman Mihai <mihai@m1x.ro>

pkgname=gtans
pkgver=1.99.0
pkgrel=1
pkgdesc="The Tangram chinese puzzle game"
depends=('gtk2')
url="http://gtans.sourceforge.net/"
license=("GPL")
arch=('i686' 'x86_64')
source=(http://sourceforge.net/projects/gtans/files/gtans/$pkgver/gtans-$pkgver.tar.gz)
md5sums=('47c8c6874a94aa1a8377d7e21f3ef254')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr
  make 
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}
