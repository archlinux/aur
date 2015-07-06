# Contributor: realitygaps
# Maintainer: realitygaps
pkgname=as6edriver
pkgver=0.5
pkgrel=1
pkgdesc="AS6E scanner driver for Linux"
url="http://as6edriver.sourceforge.net/"
license="GPL"
arch=('i686')
source=(http://heanet.dl.sourceforge.net/sourceforge/as6edriver/$pkgname-$pkgver.tar.gz)
md5sums=('52663aadb38e96efe3fccb444f693321')

build() {
 cd $pkgname-$pkgver || return 1
  ./configure
  make 
  mkdir -p $pkgdir/usr/bin
  cp as6edriver/as6edriver $pkgdir/usr/bin/
}
