# $Id: PKGBUILD 22681 2010-07-26 17:40:27Z svenstaro $
# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Tom Wambold <tom5760@gmail.com>

pkgname='frogatto-data'
arch=('any')
pkgver=1.1.1
pkgrel=1
pkgdesc="An old-school 2d platformer game, starring a certain quixotic frog (data files)"
url="http://www.frogatto.com"
license=('GPL')
depends=()
makedepends=()
source=(http://www.frogatto.com/files/frogatto-$pkgver.tar.bz2)
md5sums=('bf5a2ee4c3254a424766895ff250758b')

build() {
  cd "$srcdir/frogatto-$pkgver"
}

package() {
  cd "$srcdir/frogatto-$pkgver"

  mkdir -p $pkgdir/opt/frogatto/
  cp -r data $pkgdir/opt/frogatto/
  cp -r images $pkgdir/opt/frogatto/
  cp -r music $pkgdir/opt/frogatto/
  cp -r sounds $pkgdir/opt/frogatto/
  cp -r locale $pkgdir/opt/frogatto/
  install -D -m644 FreeMono.ttf $pkgdir/opt/frogatto/FreeMono.ttf
  install -D -m644 DejaVuSans.ttf $pkgdir/opt/frogatto/DejaVuSans.ttf

  install -D -m644 LICENSE $pkgdir/usr/share/licenses/frogatto-data/LICENSE
}

# vim:set ts=2 sw=2 et:
