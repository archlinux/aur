# Maintainer: Kyle Keen <keenerd@gmail.com>
pkgname=morseall
pkgver=0.5.0
pkgrel=1
pkgdesc="Morse Code UI, control your computer with one button."
arch=('i686' 'x86_64')
#url="http://morseall.org/"
url="http://web.archive.org/web/20100903203524/http://morseall.org/"
license=('GPL')
depends=('at-spi' 'glib2')
source=(http://pehr.net/software/$pkgname-$pkgver.tar.gz)
md5sums=('f947de9a9faeb132ef0680954533802d')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure prefix="/usr"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}


