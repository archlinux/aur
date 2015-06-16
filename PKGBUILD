# Maintainer: Sebastian Krzyszkowiak <dos@dosowisko.net>
pkgname=flasciibird
pkgver=0.0.4
pkgrel=1
pkgdesc="ncurses implementation of famous Flappy Bird game"
arch=('any')
url='https://github.com/dos1/flasciibird'
license=('GPL3+')
depends=('python' 'ncurses')
source=(https://github.com/dos1/flasciibird/archive/$pkgver.tar.gz)
sha256sums=('873a1626e55bf28df2e7bb690ae8d9a200838614c534f8797c847db8da44fee4')

package() {
  cd "$pkgname-$pkgver"
  mkdir -p "$pkgdir/usr/bin"
  cp flasciibird.py "$pkgdir/usr/bin/flasciibird"
}
