#$Id: PKGBUILD,v 1.5 2009/02/05 12:36:03 abhidg Exp $
# Maintainer: Jeff Mickey <j@codemac.net>
# Maintainer: tardo <tardo@nagi-fanboi.net>

pkgname=cxxtest
pkgver=3.10.1
pkgrel=3
pkgdesc="A JUnit/CppUnit/xUnit-like framework for C++."
arch=('i686' 'x86_64')
url="http://cxxtest.sourceforge.net"
license=("LGPL")
depends=('perl' 'gcc')
makedepends=()
conflicts=()
replaces=()
backup=()
install=cxxtest.install
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('ec7d089b6b5d67048e7db84c3231a35c')

build() {
  cd $startdir/src/$pkgname
  install -m 755 -d $startdir/pkg/usr/bin $startdir/pkg/usr/include/cxxtest
  install -m 755 cxxtestgen.pl $startdir/pkg/usr/bin/
  install -m 644 cxxtest/* $startdir/pkg/usr/include/cxxtest/
}
