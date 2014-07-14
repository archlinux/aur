# Maintainer: Kovivchak Evgen <oneonfire@gmail.com>
# Contributer: Scimmia <scimmia22 at outlook dot com>
# Contributor: Orivej Desh <smpuj@bk.ru>

pkgname=libaal
pkgver=1.0.5
pkgrel=7
pkgdesc="Reiser4 filesystem support library"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/reiser4/"
depends=('glibc')
options=('!libtool' 'staticlibs')
license=('GPL2')
source=("http://sourceforge.net/projects/reiser4/files/reiser4-utils/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('af695773885c92f5d725c0e7acad4a50')

package() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr
  make DESTDIR=$pkgdir install
}
