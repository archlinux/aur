# Maintainer: Brian Bidulock <bidulock@openss7.org>
#
pkgname=libdbh2
pkgver=5.0.15
pkgrel=1
pkgdesc="Disk based hashtables"
arch=('i686' 'x86_64')
url="http://sf.net/projects/dbh"
license=('GPL3')
depends=('glibc')
source=(http://downloads.sourceforge.net/project/dbh/dbh/$pkgver/$pkgname-$pkgver.tar.gz)
md5sums=('ed9a1339ebb31b9913b1dee914656883')

build()
{
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package()
{
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="${pkgdir}" install
}
md5sums=('b6ed5511742e6ec99f1e1b1bd0a82da1')
