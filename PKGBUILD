# Maintainer: Alan Berndt <alan@eatabrick.org>
pkgname=dario
pkgver=1.0
pkgrel=1
pkgdesc="A falling block game made for Ludum Dare 32"
url="http://ludumdare.com/compo/ludum-dare-32/?action=preview&uid=50659"
license='MIT'
arch=('i686' 'x86_64')
depends=('sdl2' 'sdl2_mixer')
provides=('dario')
source=("http://ld32.eatabrick.org/final/dario-$pkgver.tgz")
sha1sums=('e4180482ea4bd55131aa770f607b1e973f45c88f')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
