# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Tom Wambold <tom5760@gmail.com>

pkgname='frogatto-data'
_pkgname='frogatto'
arch=('any')
pkgver=1.3.1
pkgrel=2
pkgdesc="An old-school 2d platformer game, starring a certain quixotic frog (data files)"
url="http://www.frogatto.com"
license=('custom')
depends=()
makedepends=()
source=("frogatto-$pkgver.tar.gz::https://github.com/frogatto/frogatto/tarball/$pkgver")
md5sums=('695e49b9edfa5a969798d28a7942f123')

build() {
  cd "$srcdir/$_pkgname-$_pkgname"*
}

package() {
  cd "$srcdir/$_pkgname-$_pkgname"*

  mkdir -p $pkgdir/opt/frogatto/
  cp -r data $pkgdir/opt/frogatto/
  cp -r images $pkgdir/opt/frogatto/
  cp -r music $pkgdir/opt/frogatto/
  cp -r modules $pkgdir/opt/frogatto/
  install -D -m644 FreeMono.ttf $pkgdir/opt/frogatto/FreeMono.ttf
  install -D -m644 DejaVuSans.ttf $pkgdir/opt/frogatto/DejaVuSans.ttf

  install -D -m644 LICENSE $pkgdir/usr/share/licenses/frogatto-data/LICENSE
}

# vim:set ts=2 sw=2 et:
