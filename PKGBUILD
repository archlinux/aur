# Maintainer: nblock <nblock [/at\] archlinux DOT us>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: portix <portix@gmx.net>

pkgname=pwman
pkgver=0.4.4
pkgrel=1
pkgdesc="A text-based application for securely storing and managing passwords"
arch=('i686' 'x86_64')
url="http://pwman.sourceforge.net/"
license=('GPL')
depends=('libxml2' 'ncurses' 'gnupg')
makedepends=('glib2')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('29ddc5028391e224995151b4f959c51a')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure \
    --prefix=/usr \
    --mandir=/usr/share/man
  make  
  make DESTDIR=$pkgdir install
}

# vim:set ts=2 sw=2 et:
