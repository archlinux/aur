# $Id$
# Maintainer: Nicolas Geniteau <nicolas@lse.epita.fr>
pkgname=gcl
pkgver=2.6.13_pre
pkgrel=1
pkgdesc="GNU Common Lisp"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.gnu.org/software/gcl/"
makedepends=('git')
source=('git+git://git.sv.gnu.org/gcl.git#branch=Version_2_6_13pre')
md5sums=('SKIP')

build() {
  cd $srcdir/$pkgname/$pkgname/
  ./configure --prefix=/usr
  make
}

package() {
  cd $srcdir/$pkgname/$pkgname/
  make DESTDIR=$pkgdir install
}
