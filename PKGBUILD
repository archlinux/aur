# Maintainer: cosarara <cosarara97@gmail.com>

pkgname=vba-sdl-h
pkgver=1.7.2
pkgrel=2
pkgdesc="VisualBoyAdvance SDL for Hackers."
arch=(i686 x86_64)
url="https://www.github.com/cosarara97/vba-sdl-h"
license=('GPL')
depends=('sdl' 'minizip' 'libpng')
source=("https://github.com/cosarara97/vba-sdl-h/releases/download/1.7.2/"$pkgname-$pkgver.tar.gz)
md5sums=('ab7329ed751295da16bca2e6a96f815e')

build() {
  cd $srcdir/$pkgname
  make
}
package() {
  cd $srcdir/$pkgname
  mkdir -p $pkgdir/usr/bin/
  mkdir -p $pkgdir/etc/
  install vba-sdl-h $pkgdir/usr/bin/
  install src/VisualBoyAdvance.cfg $pkgdir/etc/
}
