# $Id: PKGBUILD,v 1.2 2007/06/28 15:08:10 tardo Exp $
# Maintainer: Jeff Mickey <j@codemac.net>
# Contributor: Woody Gilk aka Shadowhand <woody.gilk@gmail.com>

pkgname=gmrun
pkgver=0.9.2
pkgrel=2
pkgdesc="A simple program which provides a run program window"
arch=('i686' 'x86_64')
url="http://sf.net/projects/gmrun"
license=('GPL')
depends=('gtk2' 'popt')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('6cef37a968006d9496fc56a7099c603c')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
} 
