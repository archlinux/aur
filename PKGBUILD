# $Id: PKGBUILD 22681 2010-07-26 17:40:27Z svenstaro $
# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Tom Wambold <tom5760@gmail.com>

pkgname='frogatto-data'
_pkgname='frogatto'
arch=('any')
pkgver=1.2
pkgrel=1
pkgdesc="An old-school 2d platformer game, starring a certain quixotic frog (data files)"
url="http://www.frogatto.com"
license=('custom')
depends=()
makedepends=()
source=("frogatto-$pkgver.tar.gz::https://github.com/frogatto/frogatto/tarball/$pkgver")
md5sums=('b60924f384e04728eb6e76cdd48ab8f9')

build() {
  cd "$srcdir/$_pkgname-$_pkgname"*
}

package() {
  cd "$srcdir/$_pkgname-$_pkgname"*

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
