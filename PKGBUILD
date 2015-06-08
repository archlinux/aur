# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Arkham <arkham at archlinux dot us>

_pkgpostfix=cvs-20071123
pkgname=capture
pkgver=1.0.4
pkgrel=4
pkgdesc="Tool for periodic image capturing with digital Canon cameras"
arch=('i686' 'x86_64')
url="http://capture.sourceforge.net/"
license=('GPL')
depends=('gtk2' 'libptp2')
source=(http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver-$_pkgpostfix.tar.gz)
md5sums=('78899a989e7c2cc585a382e3aa17f491')

build() {
  cd $pkgname-$pkgver-$_pkgpostfix
  make
}

package() {
  cd $pkgname-$pkgver-$_pkgpostfix
  make PREFIX="$pkgdir/usr" install
}

