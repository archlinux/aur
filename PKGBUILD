# Maintainer: Kyle Keen <keenerd@gmail.com>
pkgname=joymouse
pkgver=0.5
pkgrel=1
pkgdesc="Control mice with the joystick."
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/joymouse-linux/"
license=('GPL')
depends=('libx11' 'libxtst')
source=(http://downloads.sourceforge.net/project/joymouse-linux/$pkgname/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz)
_watch="http://sourceforge.net/projects/joymouse-linux/files/"
md5sums=('083696c9c8cfd222ce6d9a72fdbb40b5')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure prefix="$pkgdir"/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make install
}


