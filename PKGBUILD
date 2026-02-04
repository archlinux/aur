# Maintainer: Michal Wojdyla < micwoj9292 at gmail dot com >
# Contributor: Jelle van der Waa <jelle@archlinux.org>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=nyacc
pkgver=3.02.0
pkgrel=1
pkgdesc="Not Yet Another Compiler Compiler"
url="http://www.nongnu.org/nyacc"
arch=('x86_64')
license=('GPL' 'LGPL' 'FDL')
depends=('guile')
makedepends=('guile')
source=("http://download-mirror.savannah.gnu.org/releases/nyacc/$pkgname-$pkgver.tar.gz")
sha256sums=('6fa4ce553c60f9b57b7b4fb4587bf9cfc5e4716dd9e72fd14786ce58bfa41091')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}
 
package() {
  cd $pkgname-$pkgver
  make install DESTDIR=$pkgdir
}
