# Maintainer: Kyle Keen <keenerd@gmail.com>
# Contributor: Tom Vincent Tom Vincent <http://tlvince.com/contact>

pkgname=sunwait
pkgver=0.8
_pkgver=0-8
pkgrel=1
url="http://www.risacher.org/sunwait/"
pkgdesc="A small C program for calculating sunrise and sunset times"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gcc-libs')

# original version
#pkgver=20041208
#source=(http://www.risacher.org/sunwait/$pkgname-$pkgver.tar.gz)
#md5sums=('957dbcb6d16cb8f3b1ead0687397b495')

# newer fork
source=("http://downloads.sourceforge.net/project/sunwait4windows/sunwait${_pkgver}.tar")
md5sums=('97b062fb4adce37d4af59f5b42675fce')

build() {
  #cd "$srcdir/$pkgname-$pkgver"
  cd "$srcdir/$pkgname/$pkgver"
  make
}

package() {
  #cd "$srcdir/$pkgname-$pkgver"
  cd "$srcdir/$pkgname/$pkgver"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}

# vim:set ts=2 sw=2 et:
