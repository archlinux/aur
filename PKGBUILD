# Maintainer: Jonathan Liu <net147@gmail.com>
pkgname=autopackage-devel
pkgver=1.4.2
pkgrel=1
pkgdesc="The multi-distribution binary packaging framework for Linux systems"
arch=('i686' 'x86_64')
url="http://www.autopackage.org/"
license=('LGPL')
depends=('autopackage' 'curl')
source=("http://autopackage.googlecode.com/files/$pkgname-$pkgver.tar.bz2")
md5sums=('1578569239f4f9503a64029999ca781e')

build() {
  cd "$srcdir/autopackage"
  PATH="$PATH:$pkgdir/usr/bin" make PREFIX="$pkgdir/usr" install
}

# vim:set ts=2 sw=2 et:
