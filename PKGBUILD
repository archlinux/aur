# Maintainer: Kyle Keen <keenerd@gmail.com>
# Maintainer: eric <eric@archlinux.org>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>

pkgname=synaesthesia
pkgver=2.4
pkgrel=1
pkgdesc="Represents music graphically as coruscating field of fog and glowing lines"
arch=('i686' 'x86_64')
url="http://www.logarithmic.net/pfh/Synaesthesia"
license=('GPL')
depends=('sdl' 'libsm')
optdepends=('esound: For line input.')
source=(http://www.logarithmic.net/pfh-files/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('784105cbeed3ab209231675f0e029497')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make prefix="$pkgdir/usr" install
}
